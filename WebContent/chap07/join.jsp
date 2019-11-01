<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="EUC-KR">
<title>가입내용 확인</title>
<link rel="stylesheet" href="../css/main.css">

</head>
<body>

<% request.setCharacterEncoding("euc-kr"); %>

<jsp:useBean id="join" class="chap07.Member" />
<%--
	joinForm의 파라미터가 join으로 넘어오지,
	그래서 한글부분을 인코딩해주고
	
	<jsp:useBean id="join" class="chap07.Member" />
	객체하나 만들어서 이름을 join이라고 해준거야

	★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
	<jsp:setProperty property="*" name="join" />
	파라미터와 	setProperty의 값과 비교.
	★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
	
	<jsp:getProperty property="id" name="join" />
	join객체에 있는 getId()가 호출됨

--%>
<jsp:setProperty property="*" name="join" />

<table border="1" style="border-collapse: collapse;" >
	<caption>회원가입 조회</caption>
	<tr><td>아이디</td>
		<td><jsp:getProperty property="id" name="join" /></td></tr>
	<tr><td>비밀번호</td>
		<td><jsp:getProperty property="pass" name="join" /></td></tr>
	<tr><td>이름</td>
		<td><jsp:getProperty property="name" name="join" /></td></tr>
	<tr><td>성별</td>
		<td><jsp:getProperty property="gender2" name="join" /></td></tr>
		<%-- gender2는 join의 멤버(Member클래스의 getter)로 만들어줄 수 있어 --%>
<%-- 	<td><jsp:getProperty property="gender" name="join" /></td></tr> --%>
<%--	<td><(join.getGender()==1)? "남":"여"></td></tr> --%>
	<tr><td>나이</td>
		<td><jsp:getProperty property="age" name="join" /></td></tr>
	<tr><td>이메일</td>
		<td><jsp:getProperty property="email" name="join" /></td></tr>
</table>


</body>
</html>