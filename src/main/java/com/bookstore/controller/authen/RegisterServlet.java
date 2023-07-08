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
import com.bookstore.utils.TrippleDesEncDec;
import com.bookstore.utils.CommonUtils;
import com.bookstore.utils.EmailUtils;
import java.io.IOException;
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

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        Account account = Account.builder().
                username(username).
                password(password).
                email(email).
                isVerify(false).
                roleId(CommonConst.ROLE_USER).
                build();

        try {
            int accountId = accountLogic.insertToDb(account);
            //if id = -1 => insert not success
            if (accountId == CommonConst.ID_INSERT_FAIL) {
                throw new IllegalArgumentException("Some thing went wrong !!");
            }
            
            //encrypt token, accountId
            String accountIdEncrypt = TrippleDesEncDec.encrypt(accountId + "");
            String tokenEncrypt = TrippleDesEncDec.encrypt(CommonUtils.uniqueToken());

            String URLWeb = "http://" + request.getServerName() + ":"
                    + request.getServerPort()
                    + request.getContextPath();
            //send mail 
            boolean isSendMailSuccess = emailLogLogic.sendMail(account,
                    CommonConst.TYPE_SEND_MAIL_VERIFY_REGISTER,
                    EmailUtils.getMailContentRegister(tokenEncrypt, URLWeb, accountIdEncrypt));
            if (isSendMailSuccess) {
                EmailLog emailLog = EmailLog.builder().
                        to(account.getEmail()).
                        subject("Register").
                        content(EmailUtils.getMailContentRegister(tokenEncrypt, URLWeb, accountIdEncrypt)).
                        build();
                int emailLogId = emailLogLogic.insertToDb(emailLog);
                VerifyRequest verifyRequest = VerifyRequest.builder().
                        requestContent(tokenEncrypt).
                        accountId(accountId).
                        emailLogId(emailLogId).
                        createAt(CommonUtils.getCurrentTimestamp()).
                        expired(CommonUtils.getTimestampExpired()).
                        isVerify(false).
                        build();
                verifyRequestLogic.insertToDb(verifyRequest);
                response.sendRedirect("home");
            }
            //catch error of username or email 
        } catch (IllegalArgumentException e) {
            request.setAttribute(CommonConst.ATTRIBUTE_ERROR, e.getMessage());
            //go to register page
            request.getRequestDispatcher("view/common/authen/register.jsp").forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }
}
