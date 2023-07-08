/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bookstore.biz.impl;

import com.bookstore.biz.IGenericLogic;
import com.bookstore.dal.impl.VerifyRequestDAO;
import com.bookstore.entity.VerifyRequest;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class VerifyRequestLogic implements IGenericLogic<VerifyRequest>{
    VerifyRequestDAO dao;

    public VerifyRequestLogic() {
        dao = new VerifyRequestDAO();
    }
    
    
    
    @Override
    public List<VerifyRequest> findAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int insertToDb(VerifyRequest t) {
        return dao.insertToDb(t);
    }

    @Override
    public void updateToDb(VerifyRequest t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(VerifyRequest t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public VerifyRequest findByTokenAndUsername(String tokenEncrypt, String accountIdDecrypt) {
        return dao.findByTokenAndUsername(tokenEncrypt, accountIdDecrypt);
    }
    
}
