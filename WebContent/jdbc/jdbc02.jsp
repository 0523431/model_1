<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>간단한 select 구문 실행 결과 확인</title>
<link rel="stylesheet" href="../css/main.css">

</head>
<body>

<%--
	form에 action속성이 없는 경우, 자신의 페이지를 다시 호출함
--%>

<%
	request.setCharacterEncoding("euc-kr");
	String sql = request.getParameter("sql");
%>

	<form method="post">
	<textarea cols="60" rows="5" name="sql"><%= (sql==null)? "":sql %><%-- sql이 가지고 있는 값을 출력해 --%></textarea>
	<input type="submit" value="실행">
</form>
	
<%
	Connection conn = null;
	if(sql != null && !sql.trim().equals("")) {
	try {
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/classdb","scott","1234");
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		ResultSetMetaData rsmt = rs.getMetaData(); // 컬럼이름을 가져오기위한 metadata
		
		// row count 구하기
		PreparedStatement pstmt2 =
				conn.prepareStatement("select count(*) from (" + sql +") a");
		ResultSet rs2 = pstmt2.executeQuery();
		rs2.next(); // 이작업을 해줘야 getInt()를 사용할 수 있음
		int row = rs2.getInt(1); // 1번컬럼의 row 개수
%>

	<table>
		<tr>
			<td colspan="<%=rsmt.getColumnCount() %>" style="text-align: right">조회된 레코드 개수 : <%=row %>
			</td>
		</tr>
		<tr>
			<%-- 테이블헤더(컬럼명) 출력 --%>
			<%		for(int i=1; i<=rsmt.getColumnCount(); i++) {%>
			<th><%=rsmt.getColumnName(i) %></th>
			<%		} %>
		</tr>

<%		while(rs.next()) { %>
		<tr>
			<%-- 컬럼 내용 출력 --%>
<%			for(int i=1; i<=rsmt.getColumnCount(); i++) { %>
		<td><%=rs.getString(i) %></td>
<%			} %>
<%		} %>
		</tr>
	</table>

<%} catch(Exception e) {%>
			<h3>
			sql구문 오류 입니다.<br>
			<%=e.getMessage() %><br>
			sql구문 : <%=sql %>
			</h3>
<%	} finally {
		conn.close();
	} %>
<%	} %>


</body>
</html>