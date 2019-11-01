<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%--
	1. session에 로그인 정보 제거
	2. -----님이 로그아웃되었습니다 => 메시지 출력 후 loginForm.jsp 페이지로 이동하기
--%>

<% 
	String login = (String)session.getAttribute("login");
	session.invalidate();
	// 기존에 사용되던 session객체를 강제로 유효하지않은 상태로 만듦, 그리고 새로운 session객체를 만들어줌
	
	// session.removeAttribute("login"); // login속성만 제거
%>

<script>
	alert("<%=login %>님이 로그아웃되었습니다");
	location.href="loginForm.jsp";
</script>