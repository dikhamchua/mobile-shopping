/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.bookstore.controller.admin;

import com.bookstore.biz.impl.BookLogic;
import com.bookstore.biz.impl.CategoryLogic;
import com.bookstore.entity.Book;
import com.bookstore.entity.Category;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
public class DashboardAdminServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BookLogic bookLogic = new BookLogic();
        CategoryLogic categoryLogic = new CategoryLogic();
        //get session
        HttpSession session = request.getSession();
        
        //get List all books
        List<Book> listAllBooks = bookLogic.findAll();
        List<Category> listCategories = categoryLogic.findAll();
        
        //set attribute
        session.setAttribute("listBook", listAllBooks);
        session.setAttribute("listCategories", listCategories);
        
        request.getRequestDispatcher("../view/admin/dashboard/index.jsp")
                .forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }


}
