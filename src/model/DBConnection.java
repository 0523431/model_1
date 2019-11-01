package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/*
 * 접근제어자를 쓰지 않았다 : 같은 패키지에서만 접근이 가능한거야
 */


public class DBConnection {
	private DBConnection() {
		
	} // 객체 생성을 할 수 없게 만들어줌
	
	// static이야..
	static Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/classdb", "scott", "1234");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn; // MemberDao 클래스로 return
	}
	
	static void close(Connection conn, Statement stmt, ResultSet rs) {
		try {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (conn != null) {
				conn.commit();
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
