<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="/jsp_study1/css/main.css">

</head>
<body>

<form action="pwFind.jsp" name="f" method="post">
	
	<table>
		<caption>비밀번호찾기</caption>
		<tr><th>아이디</th>
			<td><input type="text" name="id"></td></tr>
		<tr><th>이메일</th>
			<td><input type="text" name="email"></td></tr>
		<tr><th>전화번호</th>
			<td><input type="text" name="tel"></td></tr>
		<tr><td colspan="2"><input type="submit" value="비밀번호 찾기"></td></tr>
	</table>
</form>

</body>
</html>