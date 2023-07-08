/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.bookstore.controller.user;

import com.bookstore.biz.impl.BookLogic;
import com.bookstore.biz.impl.CategoryLogic;
import com.bookstore.constant.CommonConst;
import com.bookstore.entity.Book;
import com.bookstore.entity.Category;
import com.bookstore.entity.PageControl;
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
public class HomePageServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BookLogic bookLogic = new BookLogic();
        CategoryLogic categoyLogic = new CategoryLogic();
        
        //get session
        HttpSession session = request.getSession();
        //get total record
        int totalRecord = bookLogic.findTotalRecord("");
        //get total page
        int totalPage = bookLogic.findTotalPage(totalRecord);
        //get current page
        int page = bookLogic.findCurrentPage(request);
        //get list book by current page
        List<Book> listByCurrentPage = bookLogic.findBooksByPage(page, "");
        //get list category
        List<Category> listCategories = categoyLogic.findAll();
        
        //create instance
        PageControl pageControl = new PageControl("home?",
                CommonConst.BOOK_RECORD_PER_PAGE,
                totalPage,
                totalRecord,
                page);
        
        
        
        //set attribute
        session.setAttribute("listBook", listByCurrentPage);
        session.setAttribute("listCategories", listCategories);
        request.setAttribute("pageControl", pageControl);
        
        
        //redirect to page
        request.getRequestDispatcher("view/user/homepage/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }


}
