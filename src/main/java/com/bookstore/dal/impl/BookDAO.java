/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bookstore.dal.impl;

import com.bookstore.constant.CommonConst;
import com.bookstore.dal.DBContext;
import com.bookstore.entity.Book;
import com.bookstore.mapper.impl.BookMapper;
import com.debitbook.model.Parameter;
import dal.IGenericDAO;
import java.sql.Types;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class BookDAO extends DBContext<Book> implements IGenericDAO<Book> {

    @Override
    public List<Book> findAll() {
        String sql = "select * from Book";
        List<Book> list = query(sql, new BookMapper());
        return list;
    }

    @Override
    public Book findOneById(int id) {
        String sql = "select * from book where id = ?";
        List<Book> list = query(sql, new BookMapper(), new Parameter(id, Types.INTEGER));
        return list.isEmpty() ? null : list.get(0);
    }

    @Override
    public int insertToDb(Book t) {
        String sql = "INSERT INTO [Book]\n"
                + "           ([name]\n"
                + "           ,[description]\n"
                + "           ,[author]\n"
                + "           ,[price]\n"
                + "           ,[quantity]\n"
                + "           ,[image]\n"
                + "           ,[categoryId])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        int id = insert(sql,
                new Parameter(t.getName(), Types.NVARCHAR),
                new Parameter(t.getDescription(), Types.NVARCHAR),
                new Parameter(t.getAuthor(), Types.NVARCHAR),
                new Parameter(t.getPrice(), Types.FLOAT),
                new Parameter(t.getQuantity(), Types.INTEGER),
                new Parameter(t.getImage(), Types.NVARCHAR),
                new Parameter(t.getCategoryId(), Types.INTEGER)
        );
        return id;
    }

    public static void main(String[] args) {
        BookDAO dao = new BookDAO();
    }

    public int findTotalRecord(String keyword) {
        String sql = "SELECT COUNT(*) FROM Book\n"
                + "where name like ?";
        return findTotalRecord(sql, new Parameter("%" + keyword + "%", Types.NVARCHAR));
    }

    public List<Book> findBooksByPage(int page, String keyword) {
        String sql = "select *\n"
                + "from Book\n"
                + "where name like ?\n"
                + "order by id\n"
                + "offset ?\n"
                + "rows fetch next ?\n"
                + "rows only";
        List<Book> listByCurrentPage = query(sql, new BookMapper(),
                new Parameter("%" + keyword + "%", Types.NVARCHAR),
                new Parameter((page - 1) * CommonConst.BOOK_RECORD_PER_PAGE, Types.INTEGER),
                new Parameter(CommonConst.BOOK_RECORD_PER_PAGE, Types.INTEGER));
        return listByCurrentPage;
    }

    public List<Book> findBooksByCategory(int page, int categoryId) {
        String sql = "select *\n"
                + "from Book\n"
                + "where categoryId = ?\n"
                + "order by id\n"
                + "offset ?\n"
                + "rows fetch next ?\n"
                + "rows only";
        List<Book> listByCurrentPage = query(sql, new BookMapper(),
                new Parameter(categoryId, Types.INTEGER),
                new Parameter((page - 1) * CommonConst.BOOK_RECORD_PER_PAGE, Types.INTEGER),
                new Parameter(CommonConst.BOOK_RECORD_PER_PAGE, Types.INTEGER));
        return listByCurrentPage;
    }

    public int findTotalRecordByCateId(int categoryId) {
        String sql = "select count(*)\n"
                + "from Book\n"
                + "where categoryId = ?";
        return findTotalRecord(sql, new Parameter(categoryId, Types.INTEGER));
    }

    @Override
    public void updateToDb(Book t) {
        String sql = "UPDATE [Book]\n"
                + "   SET [name] = ?\n"
                + "      ,[description] = ?\n"
                + "      ,[author] = ?\n"
                + "      ,[price] = ?\n"
                + "      ,[quantity] = ?\n"
                + "      ,[image] = ?\n"
                + "      ,[categoryId] = ?\n"
                + " WHERE id = ?";
        update(sql,
                new Parameter(t.getName(), Types.NVARCHAR),
                new Parameter(t.getDescription(), Types.NVARCHAR),
                new Parameter(t.getAuthor(), Types.NVARCHAR),
                new Parameter(t.getPrice(), Types.FLOAT),
                new Parameter(t.getQuantity(), Types.INTEGER),
                new Parameter(t.getImage(), Types.NVARCHAR),
                new Parameter(t.getCategoryId(), Types.INTEGER),
                new Parameter(t.getId(), Types.INTEGER)
        );
    }

    @Override
    public void delete(Book t) {
        String sql = "DELETE FROM [Book]\n"
                + "      WHERE id = ?";
        update(sql,
                new Parameter(t.getId(), Types.INTEGER));
    }

}
