<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%--
	1. id파라미터 조회
	2. login 정보 조회
	   - 로그인 안 된 경우 : "로그인하세요" 메세지 출력 => loginForm.jsp 페이지 이동
	3. login 된 경우 : 로그인이 admin이 아닌데, 다른사람의 정보를 조회하면
					"내 정보 수정만 가능합니다" 메시지 출력 => main.jsp 페이지 이동

	4. id의 정보를 db에서 읽어서 Member객체에 저장
	5. Member 객체를 화면에 출력
--%>

<%
	// id, login 조회
	String id = request.getParameter("id");
	String login = (String)session.getAttribute("login");
	
	if(login == null || login.equals("")) { // 로그인이 안 된 경우
%>
		<script>
			alert("로그인하세요");
			location.href="loginForm.jsp";
		</script>
<%	} else { // 로그인이 된 경우
		if(!login.equals("admin") && !id.equals(login)) {
%>
			<script>
				alert("내 정보 수정만 가능합니다");
				location.href="main.jsp";
			</script>
<%		} else { // 4. id의 정보를 db에서 읽어서 Member객체에 저장
			Member info = new MemberDao().selectOne(id);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>정보 수정</title>
<link rel="stylesheet" href="/jsp_study1/css/main.css">

<script type="text/javascript">
	function win_upload() {
		var op = "width=600, height=200,munubar=no,top=200,left=200";
		open("pictureForm.jsp","window`s name",op);
	}
	
	function inputcheck(check) {
		<% if(!login.equals("admin")) {%>
			if(check.pass.value == "") {
				alert("비밀번호를 입력하세요");
				check.pass.focus();
				return false;
			}
		<% } %>
	}
	
	function win_modify() {
		var op = "width=500, height=250, munubar=no, top=300, left=400";
		open("passwordForm.jsp","",op);
		// 강제로 submit()을 해줘야해 f.submit()?
	}
</script>

</head>
<body>

<form action="update.jsp" name="f" method="post"
	  onsubmit="return inputcheck(this)">
	<input type="hidden" name="picture" value="<%=info.getPicture() %>">
	<table>
		<caption>회원 정보 수정</caption>
		<tr><td rowspan="4" valign="bottom">
			<img src="picture/<%=info.getPicture() %>" width="100" height="120" id="pic"><br>
			<%--picture/ 이 뒤에 주소를 붙여주게 되는 거 --%>
			<font size ="1"><a href="javascript:win_upload()">사진수정</a></font></td>
			<th>아이디</th><td><input type="text" name="id" readonly value="<%=info.getId() %>"></td></tr>
													  <%--readonly : 수정할 수 없음 --%>
		<tr><th>비밀번호</th><td><input type="password" name="pass"></td></tr>
		<tr><th>이름</th><td><input type="text" name="name" value="<%=info.getName() %>"></td></tr>
		<tr><th>성별</th><td><input type="radio" name="gender" value="1"<%=info.getGender()==1? "checked":"" %>>남
							<input type="radio" name="gender" value="2"<%=info.getGender()==2? "checked":"" %>>여</td></tr>
		<tr><th>전화번호</th><td colspan="2"><input type="text" name="tel" value="<%=info.getTel() %>"></td></tr>
		<tr><th>이메일</th><td colspan="2"><input type="text" name="email" value="<%=info.getEmail() %>"></td></tr>
		<tr><td colspan="3">
			<input type="submit" value="회원수정">
			<input type="button" value="비밀번호수정" onclick="win_modify()"></td></tr>
	</table>
</form>

</body>
</html>
<%
		}
	}
%>