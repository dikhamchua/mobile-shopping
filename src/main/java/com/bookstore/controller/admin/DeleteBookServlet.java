/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.bookstore.controller.admin;

import com.bookstore.biz.impl.BookLogic;
import com.bookstore.entity.Book;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
public class DeleteBookServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BookLogic bookLogic = new BookLogic();
        //get information
        int id = Integer.parseInt(request.getParameter("id"));
        
        //create instance
        Book book = Book.builder().
                    id(id).
                    build();
        //delete book
        bookLogic.delete(book);
        //go to dashboard
        response.sendRedirect("dashboard");
    }

}
