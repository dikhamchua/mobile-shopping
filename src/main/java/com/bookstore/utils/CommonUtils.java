/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bookstore.utils;

import com.bookstore.constant.CommonConst;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.UUID;

/**
 *
 * @author ADMIN
 */
public class CommonUtils {

    /**
     * generate uniqueToken
     *
     * @return uniqueToken
     */
    public static String uniqueToken() {
        String token = UUID.randomUUID().toString();
        return token;
    }
    
    public static Timestamp getCurrentTimestamp() {
        return Timestamp.valueOf(LocalDateTime.now());
    }
    
    public static Timestamp getTimestampExpired() {
        return Timestamp.valueOf(LocalDateTime.now().plusHours(CommonConst.EXPIRED_HOUR));
    }

}
