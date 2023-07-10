/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bookstore.utils;

import java.nio.charset.StandardCharsets;
import java.security.InvalidAlgorithmParameterException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.KeySpec;
import java.util.Base64;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.SecretKeySpec;
import javax.management.openmbean.InvalidKeyException;

public class TrippleDesASCUtils {

    /* Private variable declaration */
    private static final String SECRET_KEY = "123456789";
    private static final String SALTVALUE = "abcdefg";


    /* Encryption Method */
    public static String encrypt(String strToEncrypt) {
        try {
            /* Declare a byte array. */
            byte[] iv = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            IvParameterSpec ivspec = new IvParameterSpec(iv);
            /* Create factory for secret keys. */
            SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256");
            /* PBEKeySpec class implements KeySpec interface. */
            KeySpec spec = new PBEKeySpec(SECRET_KEY.toCharArray(), SALTVALUE.getBytes(), 65536, 256);
            SecretKey tmp = factory.generateSecret(spec);
            SecretKeySpec secretKey = new SecretKeySpec(tmp.getEncoded(), "AES");
            Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
            cipher.init(Cipher.ENCRYPT_MODE, secretKey, ivspec);
            /* Returns encrypted value. */
            byte[] encryptedBytes = cipher.doFinal(strToEncrypt.getBytes(StandardCharsets.UTF_8));
            return Base64.getUrlEncoder().withoutPadding().encodeToString(encryptedBytes);
        } catch (InvalidAlgorithmParameterException | InvalidKeyException | NoSuchAlgorithmException | InvalidKeySpecException | BadPaddingException | IllegalBlockSizeException | NoSuchPaddingException e) {
            System.out.println("Error occurred during encryption: " + e.toString());
        } catch (java.security.InvalidKeyException ex) {
            Logger.getLogger(TrippleDesASCUtils.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    /* Decryption Method */
    public static String decrypt(String strToDecrypt) {
        try {
            /* Declare a byte array. */
            byte[] iv = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            IvParameterSpec ivspec = new IvParameterSpec(iv);
            /* Create factory for secret keys. */
            SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256");
            /* PBEKeySpec class implements KeySpec interface. */
            KeySpec spec = new PBEKeySpec(SECRET_KEY.toCharArray(), SALTVALUE.getBytes(), 65536, 256);
            SecretKey tmp = factory.generateSecret(spec);
            SecretKeySpec secretKey = new SecretKeySpec(tmp.getEncoded(), "AES");
            Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5PADDING");
            cipher.init(Cipher.DECRYPT_MODE, secretKey, ivspec);
            /* Returns decrypted value. */
            byte[] decryptedBytes = cipher.doFinal(Base64.getUrlDecoder().decode(strToDecrypt));
            return new String(decryptedBytes, StandardCharsets.UTF_8);
        } catch (InvalidAlgorithmParameterException | InvalidKeyException | NoSuchAlgorithmException | InvalidKeySpecException | BadPaddingException | IllegalBlockSizeException | NoSuchPaddingException e) {
            System.out.println("Error occurred during decryption: " + e.toString());
        } catch (java.security.InvalidKeyException ex) {
            Logger.getLogger(TrippleDesASCUtils.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static String generateRandomUUID() {
        return UUID.randomUUID().toString();
    }

    /* Driver Code */
    public static void main(String[] args) {
        for (int i = 0; i < 100; i++) {
            String random = generateRandomUUID();
            String test = encrypt(random);
//            String decrypt = decrypt(test);
            if (test.contains("+")) {
                System.out.printf("%s %s\n", test, true);
            } else {
                System.out.printf("%s %s\n", test, false);
            }
//            System.out.println(decrypt.equals(random));
        }
    }

}
