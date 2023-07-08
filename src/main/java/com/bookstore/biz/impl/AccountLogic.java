/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bookstore.biz.impl;

import com.bookstore.biz.IGenericLogic;
import com.bookstore.constant.CommonConst;
import com.bookstore.dal.impl.AccountDAO;
import com.bookstore.dal.impl.EmailLogDAO;
import com.bookstore.dal.impl.VerifyRequestDAO;
import com.bookstore.entity.Account;
import com.bookstore.utils.TrippleDesEncDec;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ADMIN
 */
public class AccountLogic implements IGenericLogic<Account> {

    AccountDAO dao;
    EmailLogDAO emailLogDAO;
    VerifyRequestDAO verifyRequestDAO;

    public AccountLogic() {
        dao = new AccountDAO();
        emailLogDAO = new EmailLogDAO();
        verifyRequestDAO = new VerifyRequestDAO();
    }

    @Override
    public List<Account> findAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int insertToDb(Account objAccount) {

        //check account in DB
        //check username
        if (dao.findByUsername(objAccount) != null) {
            throw new IllegalArgumentException("Username exist !!");
        }
        //check email
        if (dao.findByEmail(objAccount) != null) {
            throw new IllegalArgumentException("Email exist !!");
        }

        try {
            //bypass password
            objAccount.setPassword(TrippleDesEncDec.encrypt(objAccount.getPassword()));
        } catch (UnsupportedEncodingException ex) {
            Logger.getLogger(AccountLogic.class.getName()).log(Level.SEVERE, null, ex);
        }

        //insert to db
        return dao.insertToDb(objAccount);
    }

    @Override
    public void updateToDb(Account t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Account t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public Account findAccount(Account account, String optionFind) {
        Account accountFound = null;
        switch (optionFind) {
            case CommonConst.FIND_ACCOUNT_BY_EMAIL:

                break;
            case CommonConst.FIND_ACCOUNT_BY_USERNAME_PASSWORD:
                accountFound = dao.findByUsernamePassword(account);
                break;

        }
        return accountFound;
    }

    public void updateIsVerify(String accountId) {
        dao.updateIsVerify(accountId);
    }

}
