package com.fitness.connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	public static Connection getConnection() throws Exception {

		Connection conObj = null;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conObj = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "Dsb@2001");

		} catch (Exception e) {
			conObj = null;
			System.out.println(e);
		}

		return conObj;
	}
}
