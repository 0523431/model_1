<%@page import="model.Board"%>
<%@page import="java.util.List"%>
<%@page import="model.BoardDao"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%--
	1. �������� �� 10���� �Խù� ���
	   - pageNum �Ķ���Ͱ��� ���� / ���� ��� 1�� ����(����)

	2. �ֱ� ��ϵ� �Խù��� ���� ���� ��ġ
	   - list����

	3. ȸ�鿡 ���
	   - �Խù� ���
	   - ������ ���� ���
--%>

<%
	int pageNum =1;
	try {
		pageNum = Integer.parseInt(request.getParameter("pageNum"));
	} catch (NumberFormatException e) {
	}
	/*
		pageNum = Integer.parseInt(request.getParameter("pageNum"));
		??????????
	*/
	
	int limit =10; // ���������� ����� �Խù� �Ǽ�

	BoardDao dao = new BoardDao();
	int boardcount = dao.boardCount(); // ��ϵ� ��ü �Խù��� �Ǽ� 
	
	/* 	ȭ�鿡 ��µ� �Խù� ������
		pageNum�� �ش��ϴ� limit=10�Ǹ� ������
		List db���� ���� ������� ������ �־�
		list
	*/
	List<Board> list = dao.list(pageNum, limit);
	
	/* 	maxpage : �������� ����
		��ü �Խù� �Ǽ� : 21�� => 3������ => pageNum=3
			---> 21.0/10 + 0.95 = (int)(3.05) = 3;
			---> 101.0/10 + 0.95 = (int)(10.1+0.95) = (int)(11.05) = 11;
	 */
	int maxpage = (int)((double)boardcount/limit + 0.95);
	
	/* 	startpage : ȭ�鿡 ǥ�õ� ù��° ������
	
		���� 34�������� ���� ������, startpage�� [31]�� �ǰ� endpage�� [40]
				
		pageNum : 2 => 1������
			---> (2/10.0 + 0.9) = ((int)(1.1) *10) +1 = ������������ 1����
		pageNum : 10 => 1������
			---> (10/10.0 +0.9) = ((int)(1.9) -1) *10 = 1���� statpage�� ǥ��
		pageNum : 101 => 11
			---> (11/10.0 +0.9) = ((int))
	 */ 
	int startpage = ((int)(pageNum/10.0 + 0.9) -1) *10 +1; // ���� ������ ��ȣ
	int endpage = startpage + 9; // ���� ������ ��ȣ
	
	if(endpage > maxpage) {
		endpage=maxpage;
	}
	
	// �Խù� ��ȣ�� ����� ������ ������� ���ʷ� ��Ÿ������ �� ��,
	int boardnum = boardcount - (pageNum -1) * limit;
	
	/*
		26 - (1-1) *10;
	*/
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խù� ��� ����</title>
<link rel="stylesheet" href="/jsp_study1/css/main.css">

</head>
<body>

<table>
	<caption>�Խ��� ���</caption>
	<% if(boardcount ==0) { %>
		<tr><td colspan="5">��ϵ� �Խñ��� �����ϴ�</td></tr>
	<% } else { // �Խñ���  ������, %>
		<tr><td colspan="5" style="text-align:right">�۰��� : <%=boardcount %></td></tr>
		<tr><th width="8%">��ȣ</th>
			<th width="50%">����</th>
			<th width="14%">�ۼ���</th>
			<th width="17%">�����</th>
			<th width="11%">��ȸ��</th></tr>
		<% for(Board b : list) { %>
			<tr><td><%=boardnum-- %></td><%--<%=b.getNum() %> --%>
				<td style="text-align:left">
					<%--
						null : ��ü 
						"" : ���ڿ�
					--%>
					<% if(b.getFile1() != null && !b.getFile1().equals("")) { %>
							<a href="file/<%=b.getFile1() %>"
							 style="text-decoration:none;">[÷��]</a>
							<%--
								write.jsp���� ������ ���ε� �Ҷ�,
								model1/board/file/�� ���ε� ����
								
								list.jsp�� board�ؿ� �����ϱ�,
								file/<%=���ε�� ���ϸ� %> ��η� ���� �� �� �ְ� ��
								
								-------------------------------------
								style="text-decoration:none;"
								===> a�±� ���� ���ִ� css
							--%>
					<% } else { %>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<% } %>
					
					<%  // ������ grplevel���� �ٸ��� ǥ���ϴ� ���
						if(b.getGrplevel() >0) { 
							for(int i=1; i<b.getGrplevel(); i++) {%>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<% } %>
							��>
					<%} %>
					
					<a href="info.jsp?num=<%=b.getNum() %>"><%=b.getTitle() %></a></td>
				<td><%=b.getName() %></td>
				<td><%=b.getRegdate() %></td>
				<td><%=b.getReadcnt() %></td></tr>
		<% } // for���� ���� %>

		
		<%-- ����� �κ� --%> 
		<tr><td colspan="5">
		<% if(pageNum <= 1) { %>
				[����]
		<% } else { %>
				<a href="list.jsp?pageNum=<%=pageNum -1 %>">[����]</a>
		<% } %>
		
		<% for(int a=startpage; a<=endpage; a++) { %>
				<% if(a==pageNum) { %>
					[<%=a %>]
				<% } else {%>
						<a href="list.jsp?pageNum=<%=a %>">[<%=a %>]</a>
				<% } %>
		<% } %>
		
		<% if(pageNum >= maxpage) { %>
				[����]
		<% } else { %>
				<a href="list.jsp?pageNum=<%=pageNum +1 %>">[����]</a>
		<% } %>
		</td></tr>
		<% } %>
		
		<tr><td colspan="5" style="text-align:right">
			<a href="writeForm.jsp">[�۾���]</a></td></tr>
</table>

</body>
</html>