/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.bookstore.biz;

import java.util.List;

/**
 *
 * @author ADMIN
 */
public interface IGenericLogic<T> {
    
    List<T> findAll();
    
    int insertToDb(T t);
    
    void updateToDb(T t);
    
    void delete(T t);
}
