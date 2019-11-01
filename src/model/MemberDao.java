package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

// Model기능을 담당하는 클래스로 설정(내가)
// Dao : 데이터베이스를 가져오고 전달하는 기능 Data Access Object
public class MemberDao {
	
	public Member selectOne(String id) {
		// id : 화면에 입력된 아이디
		
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from member where binary id =?"; // binary : 대소문자 구별용
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
		} finally { // return을 만나도 finally는 반드시 실행
			DBConnection.close(conn, pstmt, rs); // DBConnection클래스의 close()메서드
		}
		return null;
	}
	
	// 화면으로부터 입력받은 내용을 저장하고 있는 객체 m
	// insert()의 리턴값은 join.jsp의 int result 값이 됨.
	public int insert(Member m) { // 어떤값을 받아서 어떤값을 리턴하느냐
		// 끊어진 connection 다시 연결
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "insert into member (id,pass,name,gender,email,tel,picture) values(?,?,?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			// 1번 물음표, 2번................7번 물음표의 값 설정
			pstmt.setString(1,  m.getId());
			pstmt.setString(2,  m.getPass());
			pstmt.setString(3,  m.getName());
			pstmt.setInt(4,  m.getGender());
			pstmt.setString(5,  m.getEmail());
			pstmt.setString(6,  m.getTel());
			pstmt.setString(7,  m.getPicture());
			
			// int executeUpdate() : 변경된 레코드의 건수
			return pstmt.executeUpdate(); // insert되는 순간! ==> 성공하면 return '1'
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, null);
		}
		return 0; // insert 실패를 뜻함 (return -1;도 가능)
	}
	
	// MemberDao().list()
	// 멤버에 있는 리스트를 불러와..?
	public List<Member> list() {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		// 비어있는 ArrayList객체 list
		List<Member> list = new ArrayList<Member>();
		
		try {
			pstmt = conn.prepareStatement("select * from member");
			rs = pstmt.executeQuery();
			while(rs.next()) { // 첫번째 레코드가 있어?
				Member m = new Member();
				m.setId(rs.getString("id"));
				m.setPass(rs.getString("pass"));
				m.setName(rs.getString("name"));
				m.setGender(rs.getInt("gender"));
				m.setTel(rs.getString("tel"));
				m.setEmail(rs.getString("email"));
				m.setPicture(rs.getString("picture"));
				
				list.add(m); // 리스트 객체에 추가
			}
			return list;
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, rs);
		}
		return null; // 오류가 나면 null값을 전달
	}

	// 화면으로부터 입력받은 내용(변경 될 내용)을 저장하고 있는 객체 m
	// insert()의 리턴값은 update.jsp의 int result 값이 됨.
	public int update(Member m) {
		// 끊어진 connection 다시 연결
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "update member set name=?,gender=?,email=?,tel=?,picture=? where id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			// 1번 물음표, 2번................6번 물음표의 값 설정
			pstmt.setString(1,  m.getName());
			pstmt.setInt(2,  m.getGender());
			pstmt.setString(3,  m.getEmail());
			pstmt.setString(4,  m.getTel());
			pstmt.setString(5,  m.getPicture());
			pstmt.setString(6,  m.getId());
			
			// int executeUpdate() : 변경된 레코드의 건수
			return pstmt.executeUpdate(); // insert되는 순간! ==> 성공하면 return '1'
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, null);
		}
		return 0; // insert 실패를 뜻함 (return -1;도 가능)
	}
	
	public int updatepass(String id, String new_pass) {
		// 끊어진 connection 다시 연결
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;

		String sql = "update member set pass=? where id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, new_pass);
			pstmt.setString(2, id);
			
			// int executeUpdate() : 변경된 레코드의 건수
			return pstmt.executeUpdate(); // insert되는 순간! ==> 성공하면 return '1'

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, null);
		}
		return 0; // insert 실패를 뜻함 (return -1;도 가능)
	}
	
	public int delete(String id) {
		// 끊어진 connection 다시 연결
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;

		String sql = "delete from member where id=?";

		try {
			pstmt = conn.prepareStatement(sql);

			// 1번 물음표의 값 설정
			pstmt.setString(1, id);
			// int executeUpdate() : 변경된 레코드의 건수
			return pstmt.executeUpdate(); // insert되는 순간! ==> 성공하면 return '1'

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, null);
		}
		return 0; // insert 실패를 뜻함 (return -1;도 가능)
	}
	
	public String findId(String email, String tel) {

		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from member where binary email=? and tel=?"; // binary 대소문자 구별

		try {
			// email, tel에 해당하는
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

		String sql = "select * from member where binary id=? and binary email=? and tel=?"; // binary 대소문자 구별

		try {
			// id, email, tel에 해당하는
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
