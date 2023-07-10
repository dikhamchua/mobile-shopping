/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.bookstore.controller.user;

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
public class ProductDetailsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BookLogic bookLogic = new BookLogic();
        try {
            //get id cua product
            int id = Integer.parseInt(request.getParameter("id"));
            //find product by id
            Book bookFoundById = bookLogic.findBooksById(id);
            //if bookFoundById = null => not found => go 404 error
            if (bookFoundById == null) {
                request.setAttribute("error", "Not found");
                request.getRequestDispatcher("view/error/404.jsp").forward(request, response);
            }else {
                //set attribute
                request.setAttribute("book", bookFoundById);
                request.getRequestDispatcher("view/common/homepage/productDetails.jsp").forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("error", "Not found");
            request.getRequestDispatcher("view/error/404.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
