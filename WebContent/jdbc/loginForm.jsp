<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>간략한 로그인 화면</title>
<link rel="stylesheet" href="../css/main.css">
</head>
<body>

<form action="login.jsp" method="post">
	<table>
		<caption>로그인</caption>
		<tr><th>아이디</th><td><input type="text" name="id"></td></tr>
		<tr><th>비밀번호</th><td><input type="password" name="pass"></td></tr>
		<tr><td colspan="2">
			<input type="submit" value="로그인">
			<input type="button" value="회원가입" onclick="location.href='joinForm.jsp'"></td>
		</tr>
	</table>
</form>

</body>
</html>