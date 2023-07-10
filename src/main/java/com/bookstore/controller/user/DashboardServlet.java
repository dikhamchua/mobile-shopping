/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.bookstore.controller.user;

import com.bookstore.biz.impl.AccountLogic;
import com.bookstore.entity.Account;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
public class DashboardServlet extends HttpServlet {

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
        String page = request.getParameter("page");
        if (page == null || page.isEmpty()) {
            request.getRequestDispatcher("view/user/dashboard/index.jsp").forward(request, response);
        }
        
        switch (page) {
            case "profile":
                request.getRequestDispatcher("view/common/dashboard/profile.jsp").forward(request, response);
                break;
            default:
                throw new AssertionError();
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
        String action = request.getParameter("action");
        if (action == null || action.isEmpty()) {
            response.sendRedirect("dashboard");
        }
        switch (action) {
            case "profile":
                //update
                updateProfile(request, response);
                //quay tro ve trang dashboard
                response.sendRedirect("dashboard?page=profile");
                break;
            default:
                throw new AssertionError();
        }
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

    private void updateProfile(HttpServletRequest request, HttpServletResponse response) {
        AccountLogic logic = new AccountLogic();
        String address = request.getParameter("address");
        String username = request.getParameter("username");
        
        logic.updateAddress(username, address);
        
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        account.setAddress(address);
        session.setAttribute("account", account);
    }

}
