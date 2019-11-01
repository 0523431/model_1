package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/*
 * ���������ڸ� ���� �ʾҴ� : ���� ��Ű�������� ������ �����Ѱž�
 */


public class DBConnection {
	private DBConnection() {
		
	} // ��ü ������ �� �� ���� �������
	
	// static�̾�..
	static Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/classdb", "scott", "1234");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn; // MemberDao Ŭ������ return
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
