/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qdu.dao.impl;

import com.qdu.dao.BaseDao;
import com.qdu.util.DatabaseUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author 77725
 */
public class BaseDaoImpl implements BaseDao {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public ResultSet exceuteQuery(String sql, Object... params) {

        try {
            con =  DatabaseUtil.getConnection();
            //Statement stmt = conn.createStatement();
            ps = con.prepareStatement(sql);
            if (params != null) {
                for (int i = 0; i < params.length; i++) {
                    ps.setObject(i + 1 , params[i]);
                }
            }
            rs = ps.executeQuery();

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return rs;
    }

    public int excuteUpdate(String sql, Object... params) {
//        Connection con = null;
//        PreparedStatement ps = null;
        //Connection con = null;//需要一个数据库连接
        //PreparedStatement ps = null;//需要一个StateMent对象 用于操作要执行的sql语句
        int rows = 0;//用一个变量存储执行sql语句后 受影响的行数

        con = DatabaseUtil.getConnection();
        try {
            //指定要执行的sql语句 创建一个preparedstatement对象 用于操作该sql语句
            ps = con.prepareStatement(sql);
            //可变参数的值会封装成一个数组 
            //这里遍历Params这个数组 获取每个参数的值 设置为Sql语句参数的值
            for (int i = 1; i <= params.length; i++) {
                ps.setObject(i, params[i - 1]);
            }
            //调用prepareStatement的executeUpdate方法执行增删改操作 
            //返回受影响的行数 赋值给rows变量
            rows = ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(BaseDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            //finally模块的代码不管Try中是否出现异常 都会被执行 通常用于关闭一些资源的占用
            DatabaseUtil.close(null, ps, con);
        }

        return rows;
    }

}
