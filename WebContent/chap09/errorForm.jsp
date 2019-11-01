<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%--
	현재 페이지에서 오류발생시, error.jsp 제어 이동
--%>
<%@ page errorPage="error.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>예외 발생 페이지</title>
</head>
<body>

<%=request.getParameter("name").trim() %>
<%--
	name이라는 파라미터가 없는데, 거기에 trim()메서드를 실행시키면 NullPointerException 발생
--%>

</body>
</html>