<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="EUC-KR">
<title>회원가입</title>
<link rel="stylesheet" href="../css/main.css">

</head>
<body>

<%--
	입력된 내용이 join.jsp에서 출력되게 만들자
	단,
	  1. useBean, setProperty를 이용
	  2. Bean 클래스의 이름은 chap07.Member로 하기
--%>

<form action="join.jsp" method="post">
	<table>
		<caption>회원가입</caption>
		<tr><td>아이디</td>
			<td><input type="text" name="id"></td></tr>
		<tr><td>비밀번호</td>
			<td><input type="password" name="pass"></td></tr>
		<tr><td>이름</td>
			<td><input type="text" name="name"></td></tr>
		<tr><td>성별</td>
			<td><input type="radio" name="gender" value="1">남
				<input type="radio" name="gender" value="2">여</td></tr>
		<tr><td>나이</td>
			<td><input type="text" name="age"></td></tr>
		<tr><td>이메일</td>
			<td><input type="text" name="email"></td></tr>
		<tr><td colspan="2">
			<input type="submit" value="회원가입"></td></tr>
	</table>
</form>

</body>
</html>