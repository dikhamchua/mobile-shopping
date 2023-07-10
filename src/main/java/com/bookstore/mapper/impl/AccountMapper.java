/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bookstore.mapper.impl;

import com.bookstore.entity.Account;
import java.sql.ResultSet;
import mapper.IGenericMapper;

/**
 *
 * @author ADMIN
 */
public class AccountMapper implements IGenericMapper<Account>{

    @Override
    public Account mapRow(ResultSet resultSet) {
         try {
            int id = resultSet.getInt("id");
            String username = resultSet.getString("username");
            String password = resultSet.getString("password");
            String email = resultSet.getString("email");
            String address = resultSet.getString("address");
            int roleId = resultSet.getInt("roleId");
            boolean isVerify = resultSet.getBoolean("isVerify");
            
            Account account = new Account(id, username, password, email, address,isVerify, roleId);
            return account;
        } catch (Exception e) {
            System.out.println("Wrong at AccountMapper: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }
    
}
