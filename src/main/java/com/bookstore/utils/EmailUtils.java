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

public class EmailUtils {

    public static final String username = "vinhpkhe153482@fpt.edu.vn";
    public static final String password = "oigqswyzoyywjwss";

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

    public static String getContentMailRegister(String link) {
        String content = "<!DOCTYPE html>\n"
                + "<html lang=\"en\">\n"
                + "<head>\n"
                + "    <meta charset=\"UTF-8\">\n"
                + "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
                + "    <title>Reset Password</title>\n"
                + "    <!-- CSS Bootstrap 4.3 -->\n"
                + "    <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css\">\n"
                + "</head>\n"
                + "<body>\n"
                + "    <h1>\n"
                + link
                + "    </h1>\n"
                + "    <!-- JavaScript Bootstrap 4.3 and jQuery (required for this example) -->\n"
                + "    <script src=\"https://code.jquery.com/jquery-3.3.1.slim.min.js\"></script>\n"
                + "    <script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js\"></script>\n"
                + "</body>\n"
                + "</html>";
        return content;
    }

    public static void main(String[] args) {
        EmailUtils emailUtils = new EmailUtils();
        String content = "<!DOCTYPE html>\n"
                + "<html lang=\"en\">\n"
                + "<head>\n"
                + "    <meta charset=\"UTF-8\">\n"
                + "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
                + "    <title>Reset Password</title>\n"
                + "    <!-- CSS Bootstrap 4.3 -->\n"
                + "    <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css\">\n"
                + "</head>\n"
                + "<body>\n"
                + "    <h1>\n"
                + "        hello \n"
                + "    </h1>\n"
                + "\n"
                + "    <h2>hellooooooooooooo</h2>\n"
                + "\n"
                + "    <!-- JavaScript Bootstrap 4.3 and jQuery (required for this example) -->\n"
                + "    <script src=\"https://code.jquery.com/jquery-3.3.1.slim.min.js\"></script>\n"
                + "    <script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js\"></script>\n"
                + "</body>\n"
                + "</html>";
        emailUtils.sendMail("vinhpham2761@gmail.com", "hello, mot ngay that dep tuoi", content);
    }

}
