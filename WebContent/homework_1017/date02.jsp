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
		alert("��¥ ��� �� �ŷ��ϼ���. date01.jsp�� �̵��մϴ�");
		location.href="date01.jsp"
	</script>
<%
	} else {
%>	
		�ٺ��ٺ��ٺ� : <%=dateout %>
<%
	}
	session.removeAttribute("date");
%>

</body>
</html>