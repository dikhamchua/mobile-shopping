/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.bookstore.controller.user;

import com.bookstore.biz.impl.BookLogic;
import com.bookstore.biz.impl.CategoryLogic;
import com.bookstore.constant.CommonConst;
import com.bookstore.entity.Book;
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
public class CategoryServlet extends HttpServlet {

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
        CategoryLogic logic = new CategoryLogic();
        BookLogic bookLogic = new BookLogic();

        //get session
        HttpSession session = request.getSession();
        try {
            //get category id
            int categoryId = logic.findCategory(request);
            //get total record by category id
            int totalRecord = bookLogic.findTotalRecordByCateId(categoryId);
            //get total page by category id
            int totalPage = bookLogic.findTotalPage(totalRecord);
            //get current page
            int page = bookLogic.findCurrentPage(request);
            //get list book by current page
            List<Book> listByCurrentPage = bookLogic.findBooksByCategory(page, categoryId);
            //create instance
            PageControl pageControl = new PageControl(
                    "category?id="+categoryId +"&",
                    CommonConst.BOOK_RECORD_PER_PAGE,
                    totalPage,
                    totalRecord,
                    page);
            //set attribute
            session.setAttribute("listBook", listByCurrentPage);
            request.setAttribute("pageControl", pageControl);
            //redirect to page
            request.getRequestDispatcher("view/user/homepage/index.jsp").forward(request, response);
        } catch (IllegalArgumentException ex) {
            //redirect to 404 page
            response.sendRedirect("view/error/404.jsp");
        }

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
    }
}
