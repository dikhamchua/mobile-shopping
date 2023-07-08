/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.bookstore.controller.user;

import com.bookstore.biz.impl.BookLogic;
import com.bookstore.constant.CommonConst;
import com.bookstore.entity.Book;
import com.bookstore.entity.PageControl;
import java.io.IOException;
import java.io.PrintWriter;
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
public class SearchServlet extends HttpServlet {


    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BookLogic logic = new BookLogic();
        
         //get session
        HttpSession session = request.getSession();
        //get keyword
        String keyword = request.getParameter("keyword");
        //get total record by keyword
        int totalRecord = logic.findTotalRecord(keyword);
        //get total page by keyword
        int totalPage = logic.findTotalPage(totalRecord);
        //get current page
         int page = logic.findCurrentPage(request);
        //get list book by current page
        List<Book> listByCurrentPage = logic.findBooksByPage(page,keyword);
         //create instance
        PageControl pageControl = new PageControl("search?keyword=" + keyword+"&",
                CommonConst.BOOK_RECORD_PER_PAGE,
                totalPage,
                totalRecord,
                page);
        
        //set attribute
        session.setAttribute("listBook", listByCurrentPage);
        request.setAttribute("pageControl", pageControl);
        //redirect to page
        request.getRequestDispatcher("view/user/homepage/index.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
