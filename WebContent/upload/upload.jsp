<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ���ε� ���</title>
</head>
<body>

<%
	String uploadPath = application.getRealPath("/") + "upload/";
	int size = 10*1024*1024; // 10M ����
	/*
		new MultipartRequest(request, uploadPath, size, "euc-kr")
		- request : ��û��ü. �Ķ���� ���� + ��������
		- uploadPath : ���Ͼ��ε�Ǵ� ������ ��ġ ����
		- size : �ִ� ���ε� ���� ũ�⸦ ����Ʈ�� ����
		- euc-kr : �Ķ������ ���ڵ� ����(�ѱ�)
		
		===> ��ü ������ ���ÿ�  ���� ���ε尡 �Ϸ�� (��)
	*/
	MultipartRequest multi = new MultipartRequest(request,uploadPath,size,"euc-kr");
	String name = multi.getParameter("name");
	String title =multi.getParameter("title");
	String fname = multi.getFilesystemName("file1");
%>

���ε� ��ġ : <%=uploadPath %><br>
�ø���� : <%=name %><br>
���� :<%=title %><br>
���� : <a href="<%=fname %>"><%=fname %></a><br>
</body>
</html>