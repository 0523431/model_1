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
	<textarea cols="60" rows="5" name="sql"><%= (sql==null)? "":sql %><%-- 작성한 쿼리문을 지우않고 프린트해줌 --%></textarea>
	<input type="submit" value="실행">
</form>
	
<%
	Class.forName("org.mariadb.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/classdb","scott","1234");
	if(sql == null) { %>
		sql.value = "입력하세요"
<%  } else {%>
<%	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	ResultSetMetaData rsmt = rs.getMetaData();
%>
	<table>
		<tr>
<%		for(int i=1; i<=rsmt.getColumnCount(); i++) {%>
			<th><%=rsmt.getColumnName(i) %></th>
<%		} %>
		</tr>

<%		while(rs.next()) { %>
		<tr>
<%			for(int i=1; i<=rsmt.getColumnCount(); i++) { %>
			<td><%=rs.getString(i) %></td>
<%			} %>
<%		} %>
		</tr>
	</table>
<%	} %>

</body>
</html>