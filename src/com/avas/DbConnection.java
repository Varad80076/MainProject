package com.avas;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection {
	public static Connection connect()
	{
		Connection con=null;
		 try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Driver loaded");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/awas_yojana","root","");
		System.out.println("Connection Established ");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return (con);
		
	}
}
