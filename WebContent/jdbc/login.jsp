<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%--
	< �� ������ login.jsp�� ���>
	1. id�� �ش��ϴ� ������ db���� ��ȸ
	2. ������ �����ϸ�, ��й�ȣ�� üũ (����)
	   db�� ��й�ȣ�� �Էµ� ��й�ȣ�� Ȯ��
	     ->�´� ��� : session �α��� ���� ��� & Ȯ�� �޽��� ���
	                main.jsp�� ������ �̵�
	     ->Ʋ�� ��� : '��й�ȣ�� Ʋ���ϴ�' �޽��� ���

	   vs id�� ������, ȭ�鿡 '���̵� Ȯ���ϼ���' �޽��� ���
	      loginForm.jsp�� ������ �̵�
--%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�α��� ���ɿ��� Ȯ��</title>
</head>
<body>

<%  // 1. id�� �ش��ϴ� ����(id,password)�� db���� ��ȸ

	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	
	Class.forName("org.mariadb.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/classdb", "scott", "1234");

	String sql = "select * from member where id=?";

	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id); // id=?
	// db�� ���� id�� �ش��ϴ� ���� �б�
	ResultSet rs = pstmt.executeQuery();
	
	if(rs.next()) { // id�� �����ϴ� ���, ��й�ȣ�� Ȯ���ؾ���
		String dbPass = rs.getString("pass");
		if(pass.equals(dbPass)) { // ��й�ȣ�� �´� ���
			session.setAttribute("login", id);
			String name = rs.getString("name");
%>
			<script type="text/javascript">
				alert("<%=name %>���� �α��� �ϼ̽��ϴ�");
				location.href='main.jsp';
			</script>
<%
		} else { // ��й�ȣ�� Ʋ�� ���
%>
			<script type="text/javascript">
				alert("��й�ȣ�� Ʋ���ϴ�");
				location.href='loginForm.jsp';
			</script>
<%		}
	} else { // id�� ���� ���
%>
		<script type="text/javascript">
			alert("���̵� Ȯ���ϼ���");
			location.href='loginForm.jsp';
		</script>
<%	} %>

</body>
</html>