package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Created by warkey on 2018-04-24.
 *  singleton instance 连接数据库
 */
public class dbutil {
    private static Connection  conn;
    private static String driver="com.mysql.jdbc.Driver";
    private static String url="jdbc:mysql://localhost:3306/dbtest";
    private static String username="root";
    private static String password="";
    //私有构造器
    private dbutil(){}
    //单件返回,线程不安全
    public static Connection getConnection()
    {

       if (null==conn)
       {
           try {
               Class.forName(driver);
               conn= DriverManager.getConnection(url,username,password);
               System.out.println("连接成功");
           } catch (SQLException e) {
               e.printStackTrace();
           } catch (ClassNotFoundException e) {
               e.printStackTrace();
           }
       }
       return conn;

    }
    public static void close(Connection conn, PreparedStatement ps)
    {
        if(conn!=null)
        {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (ps!=null)
        {
            try {
                ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }



}
