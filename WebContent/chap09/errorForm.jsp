<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%--
	���� ���������� �����߻���, error.jsp ���� �̵�
--%>
<%@ page errorPage="error.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� �߻� ������</title>
</head>
<body>

<%=request.getParameter("name").trim() %>
<%--
	name�̶�� �Ķ���Ͱ� ���µ�, �ű⿡ trim()�޼��带 �����Ű�� NullPointerException �߻�
--%>

</body>
</html>