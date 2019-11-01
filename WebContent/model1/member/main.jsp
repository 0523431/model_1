<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%--
	1. 로그인 후에 보여지는 페이지
	   => 로그인이 안 된 경우, loginForm.jsp 페이지 이동하기
--%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원관리</title>
</head>
<body>

<%  // 로그인 정보 확인
	String login = (String)session.getAttribute("login");

	if(login == null || login.trim().equals("")) { // login.trim().equals("") 들어있는 값이 아무것도 없어
		
		// 로그인이 되어있지 않으면,
		// alert창을 띄울라면, script를 써야하는데 그렇게 하지않고
		// 바로 loginForm 페이지로 보내는 방법
		response.sendRedirect("loginForm.jsp"); // 재요청
	} else {
%>		
		<h3><%=login %>(으)로 로그인 되었습니다</h3>

		<h3><a href="logout.jsp">로그아웃</a></h3>

		<h3><a href="info.jsp?id=<%=login %>">회원정보보기</a></h3>
		<%--
			info.jsp옆에 id라는 파라미터가 붙어감
			info.jsp에 DB로부터 받은
		--%>
		<h3><a href="list.jsp"></a></h3>
<%
		if(login.equals("admin")) {
%>
			<h3><a href="list.jsp">회원목록보기</a></h3>
<%		}
	}
%>

</body>
</html>