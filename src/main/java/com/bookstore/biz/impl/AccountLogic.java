/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bookstore.biz.impl;

import com.bookstore.biz.IGenericLogic;
import com.bookstore.constant.CommonConst;
import com.bookstore.dal.impl.AccountDAO;
import com.bookstore.entity.Account;
import com.bookstore.utils.TrippleDesASCUtils;
import com.debitbook.model.Parameter;
import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.sql.Types;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ADMIN
 */
public class AccountLogic implements IGenericLogic<Account> {

    AccountDAO dao;

    public AccountLogic() {
        dao = new AccountDAO();
    }

    @Override
    public List<Account> findAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int insertToDb(Account t) {
        //check username exist
        if (dao.findByUsername(t) != null) {
            throw new IllegalArgumentException("Username exist !!");
        }
        //check email exist
        if (dao.findByEmail(t) != null) {
            throw new IllegalArgumentException("Email exist !!");
        }
        try {
            //insert
            t.setPassword(TrippleDesASCUtils.encrypt(t.getPassword()));
        } catch (Exception ex) {
            try {
                throw new Exception();
            } catch (Exception ex1) {
                Logger.getLogger(AccountLogic.class.getName()).log(Level.SEVERE, null, ex1);
            }
        }
        return dao.insertToDb(t);
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
        account.setPassword(TrippleDesASCUtils.encrypt(account.getPassword()));
        switch (optionFind) {
            case CommonConst.FIND_ACCOUNT_BY_EMAIL:

                break;
            case CommonConst.FIND_ACCOUNT_BY_USERNAME_PASSWORD:
                accountFound = dao.findByUsernamePassword(account);
                break;

        }
        return accountFound;
    }

    void updateIsVerify(int accountId) {
        dao.updateIsVerify(accountId);
    }

    public void updateAddress(String username, String address) {
        String sql = "UPDATE [dbo].[Account]\n"
                + "   SET \n"
                + "      [address] = ?\n"
                + "      \n"
                + " WHERE username = ?";
        dao.update(sql, new Parameter(address, Types.NVARCHAR),
        new Parameter(username, Types.NVARCHAR));
    }

}
