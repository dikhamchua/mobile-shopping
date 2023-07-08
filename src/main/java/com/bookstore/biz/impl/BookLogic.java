/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bookstore.biz.impl;

import com.bookstore.biz.IGenericLogic;
import com.bookstore.constant.CommonConst;
import com.bookstore.dal.impl.BookDAO;
import com.bookstore.entity.Book;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author ADMIN
 */
public class BookLogic implements IGenericLogic<Book>{
    BookDAO dao;

    public BookLogic() {
        dao = new BookDAO();
    }
    
    @Override
    public List<Book> findAll() {
        List<Book> list = dao.findAll();
        return list;
    }
    
    /**
     * get current page 
     * @date : 09/06/2023
     * @param request
     * @return currentPage
     */
    public int findCurrentPage(HttpServletRequest request) {
        int currentPage;
        if (request.getParameter("page") == null) {
            currentPage = 1;
        }else {
            try {
                currentPage = Integer.parseInt(request.getParameter("page"));
                if (currentPage <= 0) {
                    currentPage = 1;
                }
                
            } catch (NumberFormatException e) {
                currentPage = 1;
            }
        }
        return currentPage;
    }

    public int findTotalRecord(String keyword) {
        int totalRecord = dao.findTotalRecord(keyword);
        return totalRecord;
    }
    
    /**
     * get totalPage
     * @date : 09/06/2023
     * @param totalRecord
     * @return totalPage
     */
    public int findTotalPage(int totalRecord) {
        int result = totalRecord % CommonConst.BOOK_RECORD_PER_PAGE;
        return result % 2 != 0 ? result++ : result;
    }

    public List<Book> findBooksByPage(int page, String keyword) {
        List<Book> listByCurrentPage = dao.findBooksByPage(page, keyword);
        return listByCurrentPage;
    }

    public int findTotalRecordByCateId(int categoryId) {
        int totalRecord = dao.findTotalRecordByCateId(categoryId);
        return totalRecord;
    }

    public List<Book> findBooksByCategory(int page, int categoryId) {
         List<Book> listByCurrentPage = dao.findBooksByCategory(page, categoryId);
        return listByCurrentPage;
    }

    @Override
    public int insertToDb(Book t) {
        return dao.insertToDb(t);
    }

    @Override
    public void updateToDb(Book t) {
        dao.updateToDb(t);
    }

    @Override
    public void delete(Book t) {
        dao.delete(t);
    }
    
}
