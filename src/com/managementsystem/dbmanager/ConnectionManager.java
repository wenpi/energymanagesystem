package com.managementsystem.dbmanager;

import java.sql.Connection;

public class ConnectionManager {

	public static Connection getConnection() throws Exception {
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
		Connection con = java.sql.DriverManager.getConnection(
				"jdbc:sqlserver://127.0.0.1:1433;databaseName=taobao;", "sa",
				"admin,123");
		return con;
	}

}
