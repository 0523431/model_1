<%@page import="model.Board"%>
<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%--
	1. num �Ķ���� ������ ����
	2. num�� �̿��Ͽ� db���� �Խù� ������ ��ȸ
	   Board BoardDao.selectOne(num)
	
	3. ��ȸ�� ������Ű��
	   void BoardDao.readcntadd(num)
	
	4. ��ȸ�� �Խù� ȭ�鿡 ���
--%>



<%
	// int num = request.getParameter("num");
	
	int num = 1;
	try {
		num = Integer.parseInt(request.getParameter("num"));
	} catch (NumberFormatException e) {
	}
	
	
	BoardDao dao = new BoardDao();
	Board info = dao.selectOne(num); // num�� �ش��ϴ� �Խù� ��ȸ
	dao.readcntadd(num); // num�� �ش��ϴ� �Խù� ��ȸ�� ����
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խù� �� ����</title>
<link rel="stylesheet" href="/jsp_study1/css/main.css">
</head>
<body>

<table>
	<caption>�Խù� �� ����</caption>
	<tr><th width="20%">�۾���</th>
		<td style="text-align:left"><%=info.getName() %></td></tr>
	<tr><th>����</th>
		<td style="text-align:left"><%=info.getTitle() %></td></tr>
	<tr><th>����</th>
		<td><table style="width:100%; height:250px;">
				<tr>
					<td style="border-width:0px; vertical-align:top; text-align:left">
					<%=info.getContent() %>
					</td>
				</tr>
			</table></td></tr>
	<tr><th>÷������</th>
		<%-- <td><%=(info.getFile1() ==null)? "":info.getFile1() %></td> --%>
		<td>
			<% if(info.getFile1()==null || info.getFile1().trim().equals("")) { %>
				&nbsp;
			<% } else { %>
					<a href="file/<%=info.getFile1() %>"><%=info.getFile1() %></a>
			<% } %>
		</td>
	</tr>
	<tr><td colspan="2">
		<a href="replyForm.jsp?num=<%=num %>">[�亯]</a>
		<a href="updateForm.jsp?num=<%=num %>">[����]</a>
		<a href="deleteForm.jsp?num=<%=num %>">[����]</a>
		<a href="list.jsp">[���]</a>
		</td></tr>
</table>

</body>
</html>