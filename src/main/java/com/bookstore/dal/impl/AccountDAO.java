/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bookstore.dal.impl;

import com.bookstore.dal.DBContext;
import com.bookstore.entity.Account;
import com.bookstore.mapper.impl.AccountMapper;
import com.debitbook.model.Parameter;
import dal.IGenericDAO;
import java.sql.Types;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import com.bookstore.utils.TrippleDesEncDec;

/**
 *
 * @author ADMIN
 */
public class AccountDAO extends DBContext<Account> implements IGenericDAO<Account> {

    @Override
    public List<Account> findAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Account findOneById(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int insertToDb(Account t) {
        String sql = "INSERT INTO [Account]\n"
                + "           ([username]\n"
                + "           ,[password]\n"
                + "           ,[email]\n"
                + "           ,[address]\n"
                + "           ,[isVerify]\n"
                + "           ,[roleId])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        return insert(sql,
                new Parameter(t.getUsername(), Types.NVARCHAR),
                new Parameter(t.getPassword(), Types.NVARCHAR),
                new Parameter(t.getEmail(), Types.NVARCHAR),
                new Parameter(t.getAddress(), Types.NVARCHAR),
                new Parameter(t.isVerify(), Types.BOOLEAN),
                new Parameter(t.getRoleId(), Types.INTEGER)
        );
    }

    @Override
    public void updateToDb(Account t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Account t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public Account findByUsernamePassword(Account account) {
        TrippleDesEncDec trippleDesEncDec = null;
        try {
            trippleDesEncDec = new TrippleDesEncDec();
            String passwordEncrypt = trippleDesEncDec.encrypt(account.getPassword());
            String sql = "select * from account\n"
                    + "where username = ? and password = ?";
            List<Account> list = query(sql, new AccountMapper(),
                    new Parameter(account.getUsername(), Types.VARCHAR),
                    new Parameter(passwordEncrypt, Types.VARCHAR)
            );
            return list.isEmpty() ? null : list.get(0);
        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Account findByUsername(Account objAccount) {
        String sql = "select * from account where username = ?";
        List<Account> list = query(sql, new AccountMapper(),
                new Parameter(objAccount.getUsername(), Types.NVARCHAR));
        return list.isEmpty() ? null : list.get(0);
    }

    public Account findByEmail(Account objAccount) {
        String sql = "select * from account where email = ?";
        List<Account> list = query(sql, new AccountMapper(),
                new Parameter(objAccount.getEmail(), Types.NVARCHAR));
        return list.isEmpty() ? null : list.get(0);
    }

    public void updateIsVerify(String accountId) {
        String sql = "UPDATE [Account]\n"
                + "   SET "
                + "      [isVerify] = 1"
                + " WHERE id = ?";
        update(sql, new Parameter(accountId, Types.NVARCHAR));
    }

}
