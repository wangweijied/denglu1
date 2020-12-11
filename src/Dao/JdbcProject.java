package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class JdbcProject {
	ResultSet result = null;
	PreparedStatement ps = null;
	static{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

	 public Connection connect(){
		  try {
			  
				Connection conn ;
				
				String url="jdbc:mysql://localhost:3307/resturant?useSSL=false&serverTimezone=UTC";
				String username = "root";
				String password = "dgwangweijie17";
				 conn =DriverManager.getConnection(url, username, password);
				 return conn;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return null;
  
	  }
	
	public boolean insert(String sql,Connection conn) throws SQLException{
		Statement stmt = conn.createStatement();
		boolean flag = stmt.execute(sql);
		stmt.close();
		conn.close();
		return flag;
		
	}
	 
	public ResultSet select(String sql1,Connection conn) throws SQLException{
		Statement stmt = conn.createStatement();
		  result = stmt.executeQuery(sql1);
		  return result;
	}
	 
	}

