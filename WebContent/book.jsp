<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ���� ����</title>
</head>
<body>

<% request.setCharacterEncoding("euc-kr"); %>

<%--
	useBean�� ������� �ʴ´ٸ�,
	
	String writer = request.getParameter("writer");
	...
--%>

<%--
	<useBean �׼��� ���>

	1. Book book = new Book(); ��ü����
	2. pageContext.setAttribute("book",book); �Ӽ����
	   - scope : ������
	   - scope="page" �������� (page����=pageContext)
	   
	   request.setAttribute("book",book); �Ӽ����
	   - scope="request"
	   
--%>
<jsp:useBean id="book" class="chap07.Book" scope="page" />

<%--
	book.setWriter(request.getParameter("writer");
	book.setTitle(request.getParameter("title");
	...
	
	<������Ƽ�� �Ķ������ �̸��� ������ �� set��>
	
	������Ƽproperty�� �̸���..
		set������Ƽ
		setXxxx => property�� �̸��� xxxx
		get������Ƽ
		getXxxx => property�� �̸��� xxxx
--%>
<jsp:setProperty property="*" name="book" />

<%--
	book.setWriter(request.getParameter("name"))
	writer�� name���� �ٲ��� ���, ã�ƴٴϸ鼭 �ٲٴ°� �ƴ϶� �Ʒ�ó�� ��������ָ� ��
	
	<������Ƽ�� �̸��̶� �Ķ������ �̸��� �ٸ� ���>
--%>
<jsp:setProperty property="writer" name="book" param="name" />


<table border="1" style="border-collapse: collapse;">
	<caption>���� ��ȸ</caption>
	
	<tr><td>�ۼ���</td>
		<%-- book.getWriter() �޼��� ȣ�� --%>
		<td><jsp:getProperty name="book" property="writer" />
		,<%=book.getWriter() %>
		</td>
	</tr>
	
	<tr><td>����</td>
		<%-- book.getTitle() �޼��� ȣ�� --%>
		<td><jsp:getProperty name="book" property="title" />
		,<%=book.getTitle() %>
		</td>
	</tr>
	
	<tr><td>����</td>
		<%-- book.getContext() �޼��� ȣ�� --%>
		<td><jsp:getProperty name="book" property="context" />
		,<%=book.getContext() %>
		</td>
	</tr>
</table>

</body>
</html>