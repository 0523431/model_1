<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
	String dateout = (String)session.getAttribute("date");

	if(dateout == null) {
%>
	<script type="text/javascript">
		alert("날짜 등록 후 거래하세요. date01.jsp로 이동합니다");
		location.href="date01.jsp"
	</script>
<%
	} else {
%>	
		바보바보바보 : <%=dateout %>
<%
	}
	session.removeAttribute("date");
%>

</body>
</html>