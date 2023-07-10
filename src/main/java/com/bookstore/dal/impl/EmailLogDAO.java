/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bookstore.dal.impl;

import com.bookstore.dal.DBContext;
import com.bookstore.entity.EmailLog;
import com.debitbook.model.Parameter;
import dal.IGenericDAO;
import java.sql.Types;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class EmailLogDAO extends DBContext<EmailLog> implements IGenericDAO<EmailLog>{

    @Override
    public List<EmailLog> findAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public EmailLog findOneById(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int insertToDb(EmailLog t) {
         String sql = "INSERT INTO [EmailLog]\n"
                + "           ([to]\n"
                + "           ,[subject]\n"
                + "           ,[content])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?)";
        return insert(sql,
                new Parameter(t.getTo(), Types.NVARCHAR),
                new Parameter(t.getSubject(), Types.NVARCHAR),
                new Parameter(t.getContent(), Types.NVARCHAR)
                );

    }

    @Override
    public void updateToDb(EmailLog t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(EmailLog t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
