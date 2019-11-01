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
<title>������ select ���� ���� ��� Ȯ��</title>
<link rel="stylesheet" href="../css/main.css">

</head>
<body>

<%--
	form�� action�Ӽ��� ���� ���, �ڽ��� �������� �ٽ� ȣ����
--%>

<%
	request.setCharacterEncoding("euc-kr");
	String sql = request.getParameter("sql");
%>

	<form method="post">
	<textarea cols="60" rows="5" name="sql"><%= (sql==null)? "":sql %><%-- sql�� ������ �ִ� ���� ����� --%></textarea>
	<input type="submit" value="����">
</form>
	
<%
	Connection conn = null;
	if(sql != null && !sql.trim().equals("")) {
	try {
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/classdb","scott","1234");
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		ResultSetMetaData rsmt = rs.getMetaData(); // �÷��̸��� ������������ metadata
		
		// row count ���ϱ�
		PreparedStatement pstmt2 =
				conn.prepareStatement("select count(*) from (" + sql +") a");
		ResultSet rs2 = pstmt2.executeQuery();
		rs2.next(); // ���۾��� ����� getInt()�� ����� �� ����
		int row = rs2.getInt(1); // 1���÷��� row ����
%>

	<table>
		<tr>
			<td colspan="<%=rsmt.getColumnCount() %>" style="text-align: right">��ȸ�� ���ڵ� ���� : <%=row %>
			</td>
		</tr>
		<tr>
			<%-- ���̺����(�÷���) ��� --%>
			<%		for(int i=1; i<=rsmt.getColumnCount(); i++) {%>
			<th><%=rsmt.getColumnName(i) %></th>
			<%		} %>
		</tr>

<%		while(rs.next()) { %>
		<tr>
			<%-- �÷� ���� ��� --%>
<%			for(int i=1; i<=rsmt.getColumnCount(); i++) { %>
		<td><%=rs.getString(i) %></td>
<%			} %>
<%		} %>
		</tr>
	</table>

<%} catch(Exception e) {%>
			<h3>
			sql���� ���� �Դϴ�.<br>
			<%=e.getMessage() %><br>
			sql���� : <%=sql %>
			</h3>
<%	} finally {
		conn.close();
	} %>
<%	} %>


</body>
</html>