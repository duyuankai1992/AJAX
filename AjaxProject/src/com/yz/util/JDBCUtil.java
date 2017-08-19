package com.yz.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class JDBCUtil {
    public static Connection getConnection() throws NamingException, SQLException
    {
    	Context context=new InitialContext();
    	DataSource ds=(DataSource) context.lookup("java:comp/env/jdbc/jmsdb");
    	return ds.getConnection();
    }
    
    public static void closeResource(Connection conn,Statement stat,ResultSet rs)
    {
    	if(conn!=null)
    	{
    		try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	}
    	
    	if(stat!=null)
    	{
    		try {
				stat.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	}
    	
    	if(rs!=null)
    	{
    		try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	}
    		
    }
}
