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
public class VerifyRequestLogic implements IGenericLogic<VerifyRequest> {
    
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
    
    public void verify(String token) {
        AccountLogic logic = new AccountLogic();
        VerifyRequest verifyRequest = dao.findByRequestContent(token);
        //check token exist in database
        //token exist in db and token not verify
        if (verifyRequest != null && verifyRequest.isVerify() == false) {
            //change isVerify true ( da duoc xac thuc thanh cong )
            dao.updateIsVerify(verifyRequest.getId());
            //kich hoat tai khoan
            logic.updateIsVerify(verifyRequest.getAccountId());
            //token not exist in db orr token verified
        } else {
            throw new IllegalArgumentException("Tai khoan da duoc xac thuc hoac duong dan bi sai");
        }
        
    }

    
}
