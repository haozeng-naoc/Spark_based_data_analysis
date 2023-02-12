package com.qdu.dao;

import java.sql.ResultSet;

/**
 * 可以创建BaseDao接口，用于包含各个Dao接口共同的操作
 *
 * @author NIIT
 */
public interface BaseDao {

    //如果有接口和接口的实现类，javadoc写在接口中的方法前
    /**
     * 执行增删改
     *
     * @param sql 字符串表示的要执行的sql语句
     * @param params 可变参数，表示sql需要的各个参数值
     * @return 一个整数，表示受影响的行数
     */
    int excuteUpdate(String sql, Object... params);

    ResultSet exceuteQuery(String sql, Object... params);
}
