<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%--
	1. �α��� �Ŀ� �������� ������
	   => �α����� �� �� ���, loginForm.jsp ������ �̵��ϱ�
--%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������</title>
</head>
<body>

<%  // �α��� ���� Ȯ��
	String login = (String)session.getAttribute("login");

	if(login == null || login.trim().equals("")) { // login.trim().equals("") ����ִ� ���� �ƹ��͵� ����
		
		// �α����� �Ǿ����� ������,
		// alertâ�� �����, script�� ����ϴµ� �׷��� �����ʰ�
		// �ٷ� loginForm �������� ������ ���
		response.sendRedirect("loginForm.jsp"); // ���û
	} else {
%>		
		<h3><%=login %>(��)�� �α��� �Ǿ����ϴ�</h3>

		<h3><a href="logout.jsp">�α׾ƿ�</a></h3>

		<h3><a href="info.jsp?id=<%=login %>">ȸ����������</a></h3>
		<%--
			info.jsp���� id��� �Ķ���Ͱ� �پ
			info.jsp�� DB�κ��� ����
		--%>
		<h3><a href="list.jsp"></a></h3>
<%
		if(login.equals("admin")) {
%>
			<h3><a href="list.jsp">ȸ����Ϻ���</a></h3>
<%		}
	}
%>

</body>
</html>