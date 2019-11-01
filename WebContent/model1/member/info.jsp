<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%--
	1. id파라미터 값을 조회
	2. 반드시 로그인 상태를 검증해야함
	   - 로그아웃 상태라면, '로그인이 필요합니다' 메시지 출력 후 loginForm.jsp로 이동
	3. 로그인 상태라면,
	   - id파라미터 값과 login된 정보의 값이 다른 경우이면서, admin이 아닌 경우
	     '내 정보만 조회 가능합니다' 메시지 출력 후 main.jsp 이동
	4. DB에서 id값에 해당하는 데이터 조회 : selectOne()
	   (login값이면 admin만 조회 가능)
	5. 조회된 내용을 화면 출력하기
	
	유효성 검증
	: 이 페이지를 봐도 되는지 확인
	: 2번 3번 내용
--%>

<%
	String id = request.getParameter("id"); // id : 조회대상인 회원의 정보
	String login = (String)session.getAttribute("login");
	// login 정보 : 누가 이 정보를 볼 수 있는지, 회원정보를 조회하는 사용자 정보

	if(login == null || login.trim().equals("")) { // 로그인이 안 된 경우, (로그아웃 상태)
%>
		<script type="text/javascript">
			alert("로그인이 필요합니다.");
			location.href="loginForm.jsp";
		</script>
<%	} else {
		if(!id.equals(login) && !login.equals("admin")) {
		// id와 login이 같지 않아?
		// admin도 아니면서 다른 사람의 정볼르 보려고한? 안된다ㅏㅏㅏ
%>
			<script type="text/javascript">
				alert("내 정보만 조회 가능합니다");
				location.href="main.jsp";
			</script>
<%		} else { // 정상적인 조회
			Member info = new MemberDao().selectOne(id);
			// System.out.print(info);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 정보 조회</title>
<link rel="stylesheet" href="../../css/main.css">
</head>
<body>

<table> <%-- --%>
	<caption>회원 정보 보기</caption>
	<tr><td rowspan="6">
		<img src="picture/<%=info.getPicture() %>" width="150" height="180"></td>
		<th>아이디</th><td><%=info.getId() %></td>
	</tr>
	<tr><th>이름</th><td><%=info.getName() %></td></tr>
	<tr><th>성별</th><td><%=info.getGender()==1? "남자":"여자" %></td></tr>
	<tr><th>전화</th><td><%=info.getTel() %></td></tr>
	<tr><th>이메일</th><td><%=info.getEmail() %></td></tr>
	<tr><td colspan="2">
		<a href="updateForm.jsp?id=<%=info.getId() %>">[수정]</a>
		<%
			if(!id.equals("admin") && !login.equals("admin")) {
			// admin이 아닌 경우, [탈퇴] 버튼이 생김 (admin 탈퇴 불가)
		%>
				<a href="deleteForm.jsp?id=<%=info.getId() %>">[탈퇴]</a>
		<%	}
		%> </td>
	</tr>
</table>

</body>
</html>

<%		}
	}
%>
