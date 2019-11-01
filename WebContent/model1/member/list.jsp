<%@page import="model.Member"%>
<%@page import="java.util.List"%>
<%@page import="model.MemberDao"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%--
	1. 로그아웃상태 : 로그인이 필요합니다. 메시처 출력
				  loginForm.jsp페이지로 이동
	2. 로그인 상태
	   - 일반 사용자 : '관리자만 가능한 거리입니다' 메시지 출력
	   - 관리자 : 정상적인 거래 가능
	3. DB에서 모든 회원 정보를 조회하여, LIST<Member> 객체로 리턴
	   List<Member> list - new MemberDao().list();
--%>

<%
	String login = (String)session.getAttribute("login");
	// login 정보 : 누가 이 정보를 볼 수 있는지, 회원정보를 조회하는 사용자 정보

	if(login == null || login.trim().equals("")) { // 로그인이 안 된 경우, (로그아웃 상태)
%>
		<script>
			alert("로그인이 필요합니다");
			location.href="loginForm.jsp";
		</script>
<%
	} else if(!login.equals("admin")) { // 로그인은 되어있으나, admin이 아니면
%>
		<script>
			alert("관리자만 가능한 거래입니다.");
			location.href="main.jsp";
		</script>
<%		} else { // 로그인이 admin으로 된 경우만 (해당 회원목록을 조회할 수 있음)
			List<Member> list = new MemberDao().list();
			// MemberDao()의 list()메서드를 통해서 가져와
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 목록 보기</title>
<link rel="stylesheet" href="../../css/main.css">
</head>
<body>

<table>
	<caption>회원 목록</caption>
	<tr><th>아이디</th><th>이름</th><th>성별</th><th>전화</th><th>&nbsp;</th>
	<%
		for(Member m : list) { // list의 객체 하나하나 m
	%>
			<tr><td><a href="info.jsp?id=<%=m.getId() %>"><%=m.getId() %></a></td>
				<td><%=m.getName() %></td>
				<td><%=m.getGender()==1? "남자":"여자" %></td>
				<td><%=m.getTel() %></td>
				<td><a href="updateForm.jsp?id=<%=m.getId() %>">[수정]</a>
					<%
						if(!m.getId().equals("admin")) {
					%>
							<a href="delete.jsp?id=<%=m.getId() %>">[강제탈퇴]</a>
					<%	} %> </td>
			</tr>
	<%	} %>
</table>

</body>
</html>

<%		} %>