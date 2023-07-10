/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bookstore.biz.impl;

import com.bookstore.biz.IGenericLogic;
import com.bookstore.constant.CommonConst;
import com.bookstore.dal.impl.EmailLogDAO;
import com.bookstore.entity.EmailLog;
import com.bookstore.utils.EmailUtils;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class EmailLogLogic implements IGenericLogic<EmailLog>{
    EmailLogDAO dao;
    
    public EmailLogLogic() {
        dao = new EmailLogDAO();
    }
    
    
    @Override
    public List<EmailLog> findAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int insertToDb(EmailLog t) {
        return dao.insertToDb(t);
    }

    @Override
    public void updateToDb(EmailLog t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(EmailLog t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    public boolean sendMail(String typeSendMail, String content, String emailTo) {
        switch (typeSendMail) {
            case CommonConst.TYPE_SEND_MAIL_REGISTER:
                return EmailUtils.sendMail(emailTo, "REGISTER", content);
        }
        return false;
    }
    
}
