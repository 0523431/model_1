<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>간략한 로그인 화면</title>
<%--
	http://localhost:8080/jsp_study1/model1/member/loginForm.jsp
--%>
<link rel="stylesheet" href="/jsp_study1/css/main.css">
<%--
	.. 상위폴더 : (model1)
	
	href="../../css/main.css" 		: url 상대경로 방식
	href="/jsp_study1/css/main.css" : url 절대경로 방식
--%>

<script type="text/javascript">
	function win_findid() {
		var op = "width=500, height=250, munubar=no, top=300, left=400";
		open("idForm.jsp","",op);
	}
	
	function win_findpass() {
		var op = "width=500, height=250, munubar=no, top=300, left=400";
		open("pwForm.jsp","",op);
	}
	
</script>

</head>
<body>

<form action="login.jsp" name="f" method="post">
	<table>
		<caption>로그인</caption>
		<tr><th>아이디</th><td><input type="text" name="id"></td></tr>
		<tr><th>비밀번호</th><td><input type="password" name="pass"></td></tr>
		<tr><td colspan="2">
			<input type="submit" value="로그인"> <%-- login.jsp로 이동 --%>
			<input type="button" value="회원가입" onclick="location.href='joinForm.jsp'">
			<input type="button" value="아이디 찾기" onclick="win_findid()">
			<input type="button" value="비밀번호 찾기" onclick="win_findpass()"></td>
		</tr>
	</table>
</form>

</body>
</html>