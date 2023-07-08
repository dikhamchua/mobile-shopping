/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bookstore.dal.impl;

import com.bookstore.dal.DBContext;
import com.bookstore.entity.VerifyRequest;
import com.bookstore.mapper.impl.VerifyRequestMapper;
import com.debitbook.model.Parameter;
import dal.IGenericDAO;
import java.sql.Types;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class VerifyRequestDAO extends DBContext<VerifyRequest> implements IGenericDAO<VerifyRequest> {

    @Override
    public List<VerifyRequest> findAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public VerifyRequest findOneById(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int insertToDb(VerifyRequest t) {
        String sql = "INSERT INTO [VerifyRequest]\n"
                + "           ([requestContent]\n"
                + "           ,[isVerify]\n"
                + "           ,[expired]\n"
                + "           ,[createAt]\n"
                + "           ,[accountId]\n"
                + "           ,[emailLogId])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        return insert(sql,
                new Parameter(t.getRequestContent(), Types.NVARCHAR),
                new Parameter(t.isVerify(), Types.BOOLEAN),
                new Parameter(t.getExpired(), Types.TIMESTAMP),
                new Parameter(t.getCreateAt(), Types.TIMESTAMP),
                new Parameter(t.getAccountId(), Types.INTEGER),
                new Parameter(t.getEmailLogId(), Types.INTEGER)
        );

    }

    @Override
    public void updateToDb(VerifyRequest t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(VerifyRequest t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public VerifyRequest findByTokenAndUsername(String tokenDecrypt, String accountIdDecrypt) {
        String sql = "select * from VerifyRequest\n"
                + "where requestContent = ? and accountId = ?";
        List<VerifyRequest> list = query(sql, new VerifyRequestMapper(),
                new Parameter(tokenDecrypt, Types.NVARCHAR),
                new Parameter(accountIdDecrypt, Types.NVARCHAR)
        );
        return list.isEmpty() ? null : list.get(0);
    }

}
