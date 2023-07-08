/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package dal;

import java.util.List;

/**
 *
 * @author ADMIN
 */
public interface IGenericDAO<T> {
    
    /**
     * find all record in table
     * @return list of all record
     */
    List<T> findAll();
    
    /**
     * Find a record by id
     * @param id: id of record
     * @return : record
     */
    T findOneById(int id);
    
    /**
     * insert to database
     * @param t
     * @return 
     */
    int insertToDb(T t);
    
    void updateToDb(T t);
    
    void delete(T t);
}
