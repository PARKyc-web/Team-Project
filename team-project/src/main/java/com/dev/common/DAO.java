package com.dev.common;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class DAO {

	// Oracle DB 정보
	private String oracle_driver;
	private String oracle_url;
	private String id;
	private String pwd;
	
	
	// DAO에서 공통으로 사용할 필드
	protected Connection conn;
	protected Statement stmt;
	protected PreparedStatement pstmt;
	protected ResultSet rs;
	
	public DAO(){
//		DBconfig();
		oracle_driver = "oracle.jdbc.driver.OracleDriver";
		oracle_url = "jdbc:oracle:thin:@192.168.0.13:1521:xe";
		id = "teamdb";
		pwd = "teamdb";
	}
	
	// DB에 접속하는 메소드
	protected void connect() {
		
		try {
			Class.forName(oracle_driver);
			conn = DriverManager.getConnection(oracle_url, id, pwd);
			
		}catch(ClassNotFoundException e) {
			System.out.println("JDBC 로딩 실패!");
			e.printStackTrace();
			
		}catch(SQLException e) {
			System.out.println("DB 연결 실패!");
			e.printStackTrace();
		}
	}
	
	// DB정보를 가져오는 메소느
	protected void DBconfig() {
		
		String url = "config/localDB.properties";
		Properties propertiese = new Properties();
		
		try {
			String filePath = ClassLoader.getSystemClassLoader().getResource(url).getPath();	
			propertiese.load(new FileInputStream(filePath));
			// load를 사용해야지 MAP 형태로 데이터를 가져올 수 있다.
		}catch(IOException e) {
			System.out.println("DB 정보 검색 실패!");
			e.printStackTrace();
		}
		
//		oracle_driver = propertiese.getProperty("driver");
//		oracle_url = propertiese.getProperty("url");
//		id = propertiese.getProperty("id");
//		pwd = propertiese.getProperty("password");		
		oracle_driver = "oracle.jdbc.driver.OracleDriver";
		oracle_url = "jdbc:oracle:thin:@localhost:1521:xe";
		id = "hr";
		pwd = "hr";
	}
	
	// DB 접속을 해제하는 메소드
	protected void disconnect() {
		
		try {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
			
		}catch(SQLException e) {
			System.out.println("DB 접속 해제 실패!");
			e.printStackTrace();
		}		
	}	
}



