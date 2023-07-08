/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.bookstore.controller.authen;

import com.bookstore.biz.impl.AccountLogic;
import com.bookstore.biz.impl.VerifyRequestLogic;
import com.bookstore.entity.VerifyRequest;
import com.bookstore.utils.TrippleDesEncDec;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
public class VerifyServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        VerifyRequestLogic verifyRequestLogic = new VerifyRequestLogic();
        AccountLogic accountLogic = new AccountLogic();
        try {
            //get token
            String tokenEncrypt = request.getParameter("token");
            System.out.println(tokenEncrypt);
            //get accountId 
            String accountIdEncrypt = request.getParameter("account");
            //decrypt accountId
            String accountIdDecrypt = TrippleDesEncDec.decrypt(accountIdEncrypt);
            //check token and accountId exist in verifyRequest's table
            VerifyRequest verifyRequest = verifyRequestLogic.findByTokenAndUsername(tokenEncrypt, accountIdDecrypt);
            //exist in table
            if (verifyRequest != null) {
                //update isVerify account to true
                accountLogic.updateIsVerify(accountIdDecrypt);
                //go to verifySuccessful.jsp
                response.sendRedirect("home");
                //not exist
            } else {
                //go to 404.jsp
                request.getRequestDispatcher("view/error/404.jsp").forward(request, response);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            request.getRequestDispatcher("view/error/404.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
