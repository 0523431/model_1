package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

// Model����� ����ϴ� Ŭ������ ����(����)
// Dao : �����ͺ��̽��� �������� �����ϴ� ��� Data Access Object
public class MemberDao {
	
	public Member selectOne(String id) {
		// id : ȭ�鿡 �Էµ� ���̵�
		
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from member where binary id =?"; // binary : ��ҹ��� ������
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Member mem = new Member();
				mem.setId(rs.getString("id"));
				mem.setPass(rs.getString("pass"));
				mem.setName(rs.getString("name"));
				mem.setGender(rs.getInt("gender"));
				mem.setTel(rs.getString("tel"));
				mem.setEmail(rs.getString("email"));
				mem.setPicture(rs.getString("picture"));
				return mem;
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally { // return�� ������ finally�� �ݵ�� ����
			DBConnection.close(conn, pstmt, rs); // DBConnectionŬ������ close()�޼���
		}
		return null;
	}
	
	// ȭ�����κ��� �Է¹��� ������ �����ϰ� �ִ� ��ü m
	// insert()�� ���ϰ��� join.jsp�� int result ���� ��.
	public int insert(Member m) { // ����� �޾Ƽ� ����� �����ϴ���
		// ������ connection �ٽ� ����
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "insert into member (id,pass,name,gender,email,tel,picture) values(?,?,?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			// 1�� ����ǥ, 2��................7�� ����ǥ�� �� ����
			pstmt.setString(1,  m.getId());
			pstmt.setString(2,  m.getPass());
			pstmt.setString(3,  m.getName());
			pstmt.setInt(4,  m.getGender());
			pstmt.setString(5,  m.getEmail());
			pstmt.setString(6,  m.getTel());
			pstmt.setString(7,  m.getPicture());
			
			// int executeUpdate() : ����� ���ڵ��� �Ǽ�
			return pstmt.executeUpdate(); // insert�Ǵ� ����! ==> �����ϸ� return '1'
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, null);
		}
		return 0; // insert ���и� ���� (return -1;�� ����)
	}
	
	// MemberDao().list()
	// ����� �ִ� ����Ʈ�� �ҷ���..?
	public List<Member> list() {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		// ����ִ� ArrayList��ü list
		List<Member> list = new ArrayList<Member>();
		
		try {
			pstmt = conn.prepareStatement("select * from member");
			rs = pstmt.executeQuery();
			while(rs.next()) { // ù��° ���ڵ尡 �־�?
				Member m = new Member();
				m.setId(rs.getString("id"));
				m.setPass(rs.getString("pass"));
				m.setName(rs.getString("name"));
				m.setGender(rs.getInt("gender"));
				m.setTel(rs.getString("tel"));
				m.setEmail(rs.getString("email"));
				m.setPicture(rs.getString("picture"));
				
				list.add(m); // ����Ʈ ��ü�� �߰�
			}
			return list;
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, rs);
		}
		return null; // ������ ���� null���� ����
	}

	// ȭ�����κ��� �Է¹��� ����(���� �� ����)�� �����ϰ� �ִ� ��ü m
	// insert()�� ���ϰ��� update.jsp�� int result ���� ��.
	public int update(Member m) {
		// ������ connection �ٽ� ����
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "update member set name=?,gender=?,email=?,tel=?,picture=? where id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			// 1�� ����ǥ, 2��................6�� ����ǥ�� �� ����
			pstmt.setString(1,  m.getName());
			pstmt.setInt(2,  m.getGender());
			pstmt.setString(3,  m.getEmail());
			pstmt.setString(4,  m.getTel());
			pstmt.setString(5,  m.getPicture());
			pstmt.setString(6,  m.getId());
			
			// int executeUpdate() : ����� ���ڵ��� �Ǽ�
			return pstmt.executeUpdate(); // insert�Ǵ� ����! ==> �����ϸ� return '1'
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, null);
		}
		return 0; // insert ���и� ���� (return -1;�� ����)
	}
	
	public int updatepass(String id, String new_pass) {
		// ������ connection �ٽ� ����
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;

		String sql = "update member set pass=? where id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, new_pass);
			pstmt.setString(2, id);
			
			// int executeUpdate() : ����� ���ڵ��� �Ǽ�
			return pstmt.executeUpdate(); // insert�Ǵ� ����! ==> �����ϸ� return '1'

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, null);
		}
		return 0; // insert ���и� ���� (return -1;�� ����)
	}
	
	public int delete(String id) {
		// ������ connection �ٽ� ����
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;

		String sql = "delete from member where id=?";

		try {
			pstmt = conn.prepareStatement(sql);

			// 1�� ����ǥ�� �� ����
			pstmt.setString(1, id);
			// int executeUpdate() : ����� ���ڵ��� �Ǽ�
			return pstmt.executeUpdate(); // insert�Ǵ� ����! ==> �����ϸ� return '1'

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, null);
		}
		return 0; // insert ���и� ���� (return -1;�� ����)
	}
	
	public String findId(String email, String tel) {

		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from member where binary email=? and tel=?"; // binary ��ҹ��� ����

		try {
			// email, tel�� �ش��ϴ�
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, tel);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				String id = rs.getString("id");

				return id;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, rs);
		}
		return null;
	}

	public String findPass(String id, String email, String tel) {

		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from member where binary id=? and binary email=? and tel=?"; // binary ��ҹ��� ����

		try {
			// id, email, tel�� �ش��ϴ�
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, email);
			pstmt.setString(3, tel);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				String pass = rs.getString("pass");

				return pass;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, rs);
		}
		return null;
	}
}
