<%@page import="model.Board"%>
<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
	1. 원글의 num을 파라미터로 받음
	2. 원글의 num, grp, grplevel, grpstep 정보를 저장
	3. 입력 화면 표시 (RE:원글 제목)
--%>

<%
	// 원글의 num값
	int num = Integer.parseInt(request.getParameter("num")); // num 파라미터값 읽기
	
	BoardDao dao = new BoardDao();
	Board board = dao.selectOne(num); // 게시물 조회
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시판 답글 쓰기</title>
<link rel="stylesheet" href="/jsp_study1/css/main.css">
</head>
<body>

<form action="reply.jsp" name="f" method="post">
	<%--
		원글에 대한 정보가 hidden값으로 들어옴
		--> 따라서, num과 grp의 값은 동일  & grplevel과 grpstep은 0
	--%>
	<input type="hidden" name="num" value="<%=board.getNum() %>">
	<input type="hidden" name="grp" value="<%=board.getGrp() %>">
	<input type="hidden" name="grplevel" value="<%=board.getGrplevel() %>">
	<input type="hidden" name="grpstep" value="<%=board.getGrpstep() %>">
	
	<table>
		<caption>게시판 답글 등록</caption>
		<tr><th>글쓴이</th>
			<td><input type="text" name="name"></td></tr>
		<tr><th>비밀번호</th>
			<td><input type="password" name="pass"></td></tr>
		<tr><th>제목</th>
			<td><input type="text" name="title"
				 value="RE:<%=board.getTitle()%>"></td></tr> <%--제목을 원글에서 가져옴 --%>
		<tr><th>내용</th>
			<td><textarea name="content" rows="15"></textarea></td></tr>
		<tr><td colspan="2"><a href="javascript:document.f.submit()">[답변글등록]</a></td></tr>
	</table>
</form>

</body>
</html>