/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bookstore.utils;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author ADMIN
 */
public class EmailUtils {

    public static final String username = "vinhpkhe153482@fpt.edu.vn";
    public static final String password = "iurznzqbznzxrfxn";

    public static boolean sendMail(String to, String subject, String content) {
        Properties properies = new Properties();

        properies.put(
                "mail.smtp.host", "smtp.gmail.com");
        properies.put(
                "mail.smtp.port", "465");
        properies.put(
                "mail.smtp.auth", "true");
        properies.put(
                "mail.smtp.starttls.enable", "true");
        properies.put(
                "mail.smtp.starttls.required", "true");
        properies.put(
                "mail.smtp.ssl.protocols", "TLSv1.2");
        properies.put(
                "mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

        Session session = Session.getInstance(properies, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(to));
            message.setSubject(subject);
            message.setContent(content, "text/html");

            Transport.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }

        return true;
    }
    
    public static String getMailContentRegister(String tokenEncrypt, String URLWeb, String accountIdEncrypt) {
        return URLWeb + "/verify?token=" + tokenEncrypt + "&account=" + accountIdEncrypt;
    }

    public static void main(String[] args) {
        EmailUtils.sendMail("vinhpham2761@gmail.com", "test gui mail", "hello");
    }

}
