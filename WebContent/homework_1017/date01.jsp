<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>session에 날짜 등록하기</title>
</head>
<body>

<%
	Date today = new Date();
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss a");
	
	String datedate = "등록된 날짜 : " + df.format(today);
%>

<%=datedate %>

<%
	//String dateout = (String)session.getAttribute("date");
	session.setAttribute("date", datedate);
%>

</body>
</html>