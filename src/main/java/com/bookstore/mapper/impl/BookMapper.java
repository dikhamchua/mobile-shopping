/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bookstore.mapper.impl;

import com.bookstore.entity.Book;
import java.sql.ResultSet;
import mapper.IGenericMapper;

/**
 *
 * @author ADMIN
 */
public class BookMapper implements IGenericMapper<Book>{

    @Override
    public Book mapRow(ResultSet resultSet) {
        try {
            int id = resultSet.getInt("id");
            String name = resultSet.getString("name");
            String description = resultSet.getString("description");
            String author = resultSet.getString("author");
            float price = resultSet.getFloat("price");
            int quantity = resultSet.getInt("quantity");
            String image = resultSet.getString("image");
            int categoryId = resultSet.getInt("categoryId");
            
            Book book = new Book(id, name, description, author, price, quantity, image, categoryId);
            return book;
        } catch (Exception e) {
            System.out.println("Wrong at BookMapper: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }
    
}
