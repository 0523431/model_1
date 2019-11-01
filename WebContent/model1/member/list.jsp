<%@page import="model.Member"%>
<%@page import="java.util.List"%>
<%@page import="model.MemberDao"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%--
	1. �α׾ƿ����� : �α����� �ʿ��մϴ�. �޽�ó ���
				  loginForm.jsp�������� �̵�
	2. �α��� ����
	   - �Ϲ� ����� : '�����ڸ� ������ �Ÿ��Դϴ�' �޽��� ���
	   - ������ : �������� �ŷ� ����
	3. DB���� ��� ȸ�� ������ ��ȸ�Ͽ�, LIST<Member> ��ü�� ����
	   List<Member> list - new MemberDao().list();
--%>

<%
	String login = (String)session.getAttribute("login");
	// login ���� : ���� �� ������ �� �� �ִ���, ȸ�������� ��ȸ�ϴ� ����� ����

	if(login == null || login.trim().equals("")) { // �α����� �� �� ���, (�α׾ƿ� ����)
%>
		<script>
			alert("�α����� �ʿ��մϴ�");
			location.href="loginForm.jsp";
		</script>
<%
	} else if(!login.equals("admin")) { // �α����� �Ǿ�������, admin�� �ƴϸ�
%>
		<script>
			alert("�����ڸ� ������ �ŷ��Դϴ�.");
			location.href="main.jsp";
		</script>
<%		} else { // �α����� admin���� �� ��츸 (�ش� ȸ������� ��ȸ�� �� ����)
			List<Member> list = new MemberDao().list();
			// MemberDao()�� list()�޼��带 ���ؼ� ������
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� ��� ����</title>
<link rel="stylesheet" href="../../css/main.css">
</head>
<body>

<table>
	<caption>ȸ�� ���</caption>
	<tr><th>���̵�</th><th>�̸�</th><th>����</th><th>��ȭ</th><th>&nbsp;</th>
	<%
		for(Member m : list) { // list�� ��ü �ϳ��ϳ� m
	%>
			<tr><td><a href="info.jsp?id=<%=m.getId() %>"><%=m.getId() %></a></td>
				<td><%=m.getName() %></td>
				<td><%=m.getGender()==1? "����":"����" %></td>
				<td><%=m.getTel() %></td>
				<td><a href="updateForm.jsp?id=<%=m.getId() %>">[����]</a>
					<%
						if(!m.getId().equals("admin")) {
					%>
							<a href="delete.jsp?id=<%=m.getId() %>">[����Ż��]</a>
					<%	} %> </td>
			</tr>
	<%	} %>
</table>

</body>
</html>

<%		} %>