/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bookstore.utils;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.KeySpec;
import java.util.Base64;
import java.util.Scanner;
import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.SecretKeySpec;

/**
 *
 * @author ADMIN
 */
public class TrippleDesEncDec {

//    private static final String UNICODE_FORMAT = "UTF8";
//    public static final String DESEDE_ENCRYPTION_SCHEME = "DESede";
//    private final KeySpec ks;
//    private final SecretKeyFactory skf;
//    private final Cipher cipher;
//    byte[] arrayBytes;
//    private final String myEncryptionKey;
//    private final String myEncryptionScheme;
//    SecretKey key;
//
//    public TrippleDesEncDec() throws Exception {
//        myEncryptionKey = "ThisIsSpartaThisIsSparta";
//        myEncryptionScheme = DESEDE_ENCRYPTION_SCHEME;
//        arrayBytes = myEncryptionKey.getBytes(UNICODE_FORMAT);
//        ks = new DESedeKeySpec(arrayBytes);
//        skf = SecretKeyFactory.getInstance(myEncryptionScheme);
//        cipher = Cipher.getInstance(myEncryptionScheme);
//        key = skf.generateSecret(ks);
//    }
//
//    public String encrypt(String unencryptedString) {
//        String encryptedString = null;
//        try {
//            cipher.init(Cipher.ENCRYPT_MODE, key);
//            byte[] plainText = unencryptedString.getBytes(UNICODE_FORMAT);
//            byte[] encryptedText = cipher.doFinal(plainText);
//            encryptedString = new String(Base64.getEncoder().encode(encryptedText));
//        } catch (UnsupportedEncodingException | InvalidKeyException
//                | BadPaddingException | IllegalBlockSizeException e) {
//        }
//        return encryptedString;
//    }
//
//    public String decrypt(String encryptedString) {
//        String decryptedText = null;
//        try {
//            cipher.init(Cipher.DECRYPT_MODE, key);
//            byte[] encryptedText = Base64.getDecoder().decode(encryptedString);
//            byte[] plainText = cipher.doFinal(encryptedText);
//            decryptedText = new String(plainText);
//        } catch (InvalidKeyException | BadPaddingException | IllegalBlockSizeException e) {
//            e.printStackTrace();
//        }
//        return decryptedText;
//    }
//
//    public static void main(String[] args) {
////        String plaintext = "Hello, World!";
//
////        // Tạo khóa AES
////        KeyGenerator keyGenerator = null;
////        try {
////            keyGenerator = KeyGenerator.getInstance("AES");
////        } catch (NoSuchAlgorithmException ex) {
////            Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
////        }
////        keyGenerator.init(128); // Độ dài khóa: 128-bit
////        SecretKey key = keyGenerator.generateKey();
//        // Chuyển đổi khóa thành chuỗi
////        String keyString = Base64.getEncoder().encodeToString(key.getEncoded());
////        System.out.println("Khóa dưới dạng chuỗi: " + keyString); 
//        //ENCRYPTION
////        String encryptedText = encrypt(plaintext, encryptionKey);
////        System.out.println("Encrypted Text: " + encryptedText);
////        
////        
////        //DECRYPTION
//        Scanner scanner = new Scanner(System.in);
//        TrippleDesEncDec trippleDesEncDec = null;
//        try {
//            trippleDesEncDec = new TrippleDesEncDec();
//            System.out.println("Enter encrypt text: ");
//            String input = scanner.nextLine();
//            String encryptedText = trippleDesEncDec.encrypt(input);
//            System.out.println("Encrypted Text: " + encryptedText);
//            String decryptedText = trippleDesEncDec.decrypt("4Ph59BiWk");
//            System.out.println("Decrypted Text: " + decryptedText);
//        } catch (Exception ex) {
//            Logger.getLogger(TrippleDesEncDec.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
    /* Private variable declaration */
    private static final String SECRET_KEY = "123456789";
    private static final String SALTVALUE = "abcdefg";

    /* Encryption Method */
    public static String encrypt(String strToEncrypt) throws UnsupportedEncodingException {
        try {
            /* Mã hóa dữ liệu trước khi sử dụng Triple DES */
            String encodedData = URLEncoder.encode(strToEncrypt, StandardCharsets.UTF_8.toString());

            /* Tiếp tục mã hóa như bình thường sử dụng Triple DES */
            byte[] iv = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            IvParameterSpec ivspec = new IvParameterSpec(iv);
            SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256");
            KeySpec spec = new PBEKeySpec(SECRET_KEY.toCharArray(), SALTVALUE.getBytes(), 65536, 256);
            SecretKey tmp = factory.generateSecret(spec);
            SecretKeySpec secretKey = new SecretKeySpec(tmp.getEncoded(), "AES");
            Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
            cipher.init(Cipher.ENCRYPT_MODE, secretKey, ivspec);

            /* Retruns encrypted value */
            return Base64.getEncoder().encodeToString(cipher.doFinal(encodedData.getBytes(StandardCharsets.UTF_8)));
        } catch (InvalidAlgorithmParameterException | InvalidKeyException | NoSuchAlgorithmException | InvalidKeySpecException | BadPaddingException | IllegalBlockSizeException | NoSuchPaddingException e) {
            System.out.println("Error occured during encryption: " + e.toString());
        } catch (UnsupportedEncodingException e) {
            System.out.println("Error occured during encoding: " + e.toString());
        }
        return null;
    }

    /* Decryption Method */
    public static String decrypt(String strToDecrypt) {
        try {
            /* Giải mã dữ liệu trước khi sử dụng Triple DES */
            String decodedData = URLDecoder.decode(strToDecrypt, StandardCharsets.UTF_8.toString());

            /* Tiếp tục giải mã như bình thường sử dụng Triple DES */
            byte[] iv = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            IvParameterSpec ivspec = new IvParameterSpec(iv);
            SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256");
            KeySpec spec = new PBEKeySpec(SECRET_KEY.toCharArray(), SALTVALUE.getBytes(), 65536, 256);
            SecretKey tmp = factory.generateSecret(spec);
            SecretKeySpec secretKey = new SecretKeySpec(tmp.getEncoded(), "AES");
            Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5PADDING");
            cipher.init(Cipher.DECRYPT_MODE, secretKey, ivspec);

            /* Retruns decrypted value */
            return new String(cipher.doFinal(Base64.getDecoder().decode(decodedData)));
        } catch (InvalidAlgorithmParameterException | InvalidKeyException | NoSuchAlgorithmException | InvalidKeySpecException | BadPaddingException | IllegalBlockSizeException | NoSuchPaddingException e) {
            System.out.println("Error occured during decryption: " + e.toString());
        } catch (UnsupportedEncodingException e) {
            System.out.println("Error occured during decoding: " + e.toString());
        }
        return null;
    }

    /* Driver Code */
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
//        /* Message to be encrypted. */
//        String originalval = "AES Encryption";

        /* Call the encrypt() method and store result of encryption. */
//        System.out.println("Enter string want to encrypt: ");
//        String encryptedval = encrypt(scanner.nextLine());
//        System.out.println("Encrypted value: " + encryptedval);

        /* Call the decrypt() method and store result of decryption. */
        System.out.println("Enter string want to decrypt: ");
        String decryptedval = decrypt(scanner.nextLine());
        System.out.println("Decrypted value: " + decryptedval);
    }
}
