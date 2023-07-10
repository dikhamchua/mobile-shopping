/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.bookstore.controller.authen;

import com.bookstore.biz.impl.AccountLogic;
import com.bookstore.constant.CommonConst;
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
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("view/common/authen/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AccountLogic accountLogic = new AccountLogic();
        HttpSession session = request.getSession();
        
        //get username
        String username = request.getParameter("username");
        //get password
        String password = request.getParameter("password");
        //create instance
        Account account = Account.builder().
                username(username).
                password(password).
                build();

        // check account by username and password exist\
        try {
            account = accountLogic.findAccount(account, CommonConst.FIND_ACCOUNT_BY_USERNAME_PASSWORD);
        } catch (Exception e) {
        }

        if (account != null) {
            session.setAttribute(CommonConst.SESSION_ACCOUNT, account);
            //go to page correspoding to role
            switch (account.getRoleId()) {
                case CommonConst.ROLE_ADMIN:
                    response.sendRedirect("admin/dashboard");
                    break;
                case CommonConst.ROLE_USER:
                    response.sendRedirect("home");
                    break;
            }

            //account not exist
        } else {
            request.setAttribute("error", "Username or password incorrect !");
            request.getRequestDispatcher("view/common/authen/login.jsp").forward(request, response);
        }
    }

}
