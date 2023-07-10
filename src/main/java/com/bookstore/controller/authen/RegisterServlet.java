/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.bookstore.controller.authen;

import com.bookstore.biz.impl.AccountLogic;
import com.bookstore.biz.impl.EmailLogLogic;
import com.bookstore.biz.impl.VerifyRequestLogic;
import com.bookstore.constant.CommonConst;
import com.bookstore.entity.Account;
import com.bookstore.entity.EmailLog;
import com.bookstore.entity.VerifyRequest;
import com.bookstore.utils.CommonUtils;
import com.bookstore.utils.EmailUtils;
import com.bookstore.utils.TrippleDesASCUtils;
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
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("view/common/authen/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AccountLogic accountLogic = new AccountLogic();
        EmailLogLogic emailLogLogic = new EmailLogLogic();
        VerifyRequestLogic verifyRequestLogic = new VerifyRequestLogic();
        
        //get information from form
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        //create instance account
        Account account = Account.builder().
                username(username).
                password(password).
                email(email).
                isVerify(false).
                roleId(CommonConst.ROLE_USER).
                build();
        try {
            int id = accountLogic.insertToDb(account);
            //generate token
            String token = TrippleDesASCUtils.encrypt(CommonUtils.generateRandomUUID());

            //get link
            String link = request.getScheme() + "://" + request.getServerName() + ":"
                    + request.getServerPort() + request.getContextPath() + "/verify?token=" + token;

            //send mail
            boolean isSendMailSuccess = emailLogLogic.sendMail(CommonConst.TYPE_SEND_MAIL_REGISTER,
                    EmailUtils.getContentMailRegister(link), account.getEmail());

            if (isSendMailSuccess) {
                EmailLog emailLog = EmailLog.builder().
                        to(account.getEmail()).
                        subject("REGISTER").
                        content(EmailUtils.getContentMailRegister(link)).
                        build();
                //insert to db emailLog
                int emailLogId = emailLogLogic.insertToDb(emailLog);
                
                VerifyRequest verifyRequest = VerifyRequest.builder().
                        requestContent(token).
                        isVerify(false).
                        accountId(id).
                        emailLogId(emailLogId).
                        createAt(CommonUtils.getCurrentTimestamp()).
                        expired(CommonUtils.getTimestampExpired()).
                        build();
                        
                verifyRequestLogic.insertToDb(verifyRequest);
                
                request.setAttribute("mess", "XAC THUC THANH CONG");
                request.getRequestDispatcher("view/common/thanhcong.jsp").forward(request, response);
            }
            //username or email not exist
        } catch (IllegalArgumentException e) {
            //set error
            request.setAttribute("error", e.getMessage());
            //redirect register
            request.getRequestDispatcher("view/common/authen/register.jsp").forward(request, response);
        } catch (Exception e) {

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

}
