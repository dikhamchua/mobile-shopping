/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bookstore.mapper.impl;

import com.bookstore.entity.Category;
import java.sql.ResultSet;
import mapper.IGenericMapper;

/**
 *
 * @author ADMIN
 */
public class CategoryMapper implements IGenericMapper<Category>{

    @Override
    public Category mapRow(ResultSet resultSet) {
        try {
            int id = resultSet.getInt("id");
            String name = resultSet.getString("name");
            Category category = new  Category(id, name);
            return category;
        } catch (Exception e) {
            System.out.println("Wrong at CategoryMapper: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }
    
}
