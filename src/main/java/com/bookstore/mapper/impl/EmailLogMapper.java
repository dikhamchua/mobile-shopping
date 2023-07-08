/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bookstore.mapper.impl;

import com.bookstore.entity.EmailLog;
import java.sql.ResultSet;
import java.sql.SQLException;
import mapper.IGenericMapper;

public class EmailLogMapper implements IGenericMapper<EmailLog> {

    @Override
    public EmailLog mapRow(ResultSet resultSet) {
        try {
            int id = resultSet.getInt("id");
            String to = resultSet.getString("to");
            String subject = resultSet.getString("subject");
            String content = resultSet.getString("content");
            EmailLog emailLog = new EmailLog(id, to, subject, content);
            return emailLog;
        } catch (SQLException ex) {
            System.out.println("Wrong at EmailLogMapper: " + ex.getMessage());
            ex.printStackTrace();
            return null;
        }
    }

}

