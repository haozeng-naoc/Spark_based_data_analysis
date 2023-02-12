package com.qdu.util;

import java.sql.*;
import java.util.ResourceBundle;

/**
 * DatabaseUtil类，一个数据库工具类，负责打开和关闭数据库连接
 *
 * @author Anna
 */
public class DatabaseUtil {

    private static final String DRIVER_CLASS;
    private static final String URL;
    private static final String USERNAME;
    private static final String PASSWORD;
    //ResourceBundle对象可用于读取一个属性文件，这里指定属性文件的名称，不加扩展名，格式：包名.文件名
    private static final ResourceBundle rb=ResourceBundle.getBundle("dbconfig");
    
    static{
        //调用ResourceBundle的getString()方法根据属性名读取属性值
         DRIVER_CLASS=rb.getString("jdbc.driver");
         URL=rb.getString("jdbc.url");
         USERNAME=rb.getString("jdbc.username");
         PASSWORD=rb.getString("jdbc.password");
    }

    /**
     * 打开一个数据库连接
     *
     * @return 一个Connection对象，表示一个数据库连接
     */
    public static Connection getConnection() {

        Connection con = null;
        
        try {
            Class.forName(DRIVER_CLASS);
            con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
        }

        return con;
    }

    /**
     * 关闭用到的数据库连接、结果集和语句
     *
     * @param rs 需要关闭的ResultSet对象
     * @param stmt 需要关闭的Statement对象
     * @param con 需要关闭的Connection对象
     */
    public static void close(ResultSet rs, Statement stmt, Connection con) {

        try {
            if (null != rs) {
                rs.close();
            }
            if (null != stmt) {
                stmt.close();
            }
            if (null != con) {
                con.close();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

}
