<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%--
	<�� ������ login.jsp�� ���>
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

<%	// model1 ver
	
	// 2���� �Ķ���Ͱ� ����
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	
	// MemberDao() : model�� ������ �ϴ� Ŭ����
	// Model : dbms�� �����ִ� ����� ���� Ŭ����(connection ���)
	// (DB�κ��� ������ ������ ��, ���� Dao�� �ٿ��� �����)
	// (�����ü mem�� ���� ��)
	Member mem = new MemberDao().selectOne(id); // ���������� : public, ����Ÿ�� : Member
	
	if(mem != null) { // id�� �����ϴ� ���
		if(pass.equals(mem.getPass())) { // ��й�ȣ�� �´� ���, ����
			// pass : �Է��� pass
			// mem.getPass() : DB�� �ִ� Pass
			session.setAttribute("login", id); // �α��� ���� ���, id������ ������ ����
%>
			<script type="text/javascript">
				alert("<%=mem.getName() %>���� �α��� �ϼ̽��ϴ�");
				// mem.getName() : DB�� ����� Name
				location.href='main.jsp';
			</script>
<%
		} else { // ��й�ȣ�� Ʋ�� ���
%>
			<script type="text/javascript">
				alert("��й�ȣ�� Ʋ���ϴ�");
				location.href='loginForm.jsp'; // ��� �Ѿ�� ��
			</script>
<%		}
	} else { // id�� ���� ���
%>
		<script type="text/javascript">
			alert("���̵� Ȯ���ϼ���");
			location.href='loginForm.jsp'; // ��� �Ѿ�� ��
		</script>
<%	} %>

</body>
</html>