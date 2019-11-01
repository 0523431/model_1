<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%--
	<이 페이지 login.jsp의 기능>
	1. id에 해당하는 정보를 db에서 조회
	2. 내용이 존재하면, 비밀번호를 체크 (검증)
	   db의 비밀번호와 입력된 비밀번호를 확인
	     ->맞는 경우 : session 로그인 정보 등록 & 확인 메시지 출력
	                main.jsp로 페이지 이동
	     ->틀린 경우 : '비밀번호가 틀립니다' 메시지 출력

	   vs id가 없으면, 화면에 '아이디를 확인하세요' 메시지 출력
	      loginForm.jsp로 페이지 이동
--%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인 가능여부 확인</title>
</head>
<body>

<%	// model1 ver
	
	// 2개의 파라미터가 들어와
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	
	// MemberDao() : model의 역할을 하는 클래스
	// Model : dbms와 연관있는 기능을 가진 클래스(connection 등등)
	// (DB로부터 정보를 가져올 때, 보통 Dao를 붙여서 사용함)
	// (멤버객체 mem가 전달 됨)
	Member mem = new MemberDao().selectOne(id); // 접근제어자 : public, 리턴타입 : Member
	
	if(mem != null) { // id가 존재하는 경우
		if(pass.equals(mem.getPass())) { // 비밀번호가 맞는 경우, 검증
			// pass : 입력한 pass
			// mem.getPass() : DB에 있는 Pass
			session.setAttribute("login", id); // 로그인 정보 등록, id정보만 가지고 있음
%>
			<script type="text/javascript">
				alert("<%=mem.getName() %>님이 로그인 하셨습니다");
				// mem.getName() : DB에 저장된 Name
				location.href='main.jsp';
			</script>
<%
		} else { // 비밀번호가 틀린 경우
%>
			<script type="text/javascript">
				alert("비밀번호가 틀립니다");
				location.href='loginForm.jsp'; // 제어가 넘어가는 곳
			</script>
<%		}
	} else { // id가 없는 경우
%>
		<script type="text/javascript">
			alert("아이디를 확인하세요");
			location.href='loginForm.jsp'; // 제어가 넘어가는 곳
		</script>
<%	} %>

</body>
</html>