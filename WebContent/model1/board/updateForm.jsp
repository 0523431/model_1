<%@page import="model.Board"%>
<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%--
	1. num값의 게시물을 DB에서 조회하여 화면에 출력하기
--%>

<%
	int num = Integer.parseInt(request.getParameter("num"));

	BoardDao dao = new BoardDao();
	Board b = dao.selectOne(num);
	// Board b = new BoardDao().selectOne(num);
	// b : num에 해당하는 게시물의 db의 정보를 저장하고 있는 객체
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시물 수정 화면</title>
<link rel="stylesheet" href="/jsp_study1/css/main.css">

<script type="text/javascript">
	function file_delete() { // 첨부파일이 있을때, 실행하는 메서드
		document.f.file2.value =""; // hidden값을 통해서 db와 연결을 끊고 (file과 db관계를 끊음)
		file_desc.style.display ="none"; // display="none" ===> 보이지않게 만듦
	}
</script>

</head>
<body>

<form action="update.jsp" name="f" method="post" enctype="multipart/form-data">
	<input type="hidden" name="num" value="<%=b.getNum() %>"> <%-- 이걸 받아야 update.jsp로 갈 수 있어 --%>
	<input type="hidden" name="file2" value="<%=b.getFile1()==null? "":b.getFile1() %>">
	<table>
		<caption>게시글 수정 화면</caption>
		<tr><th>글쓴이</th>
			<td><input type="text" name="name" value="<%=b.getName() %>"></td></tr>
		<tr><th>비밀번호</th>
			<td><input type="password" name="pass"></td></tr>
		<tr><th>제목</th>
			<td><input type="text" name="title" value="<%=b.getTitle() %>"></td></tr>
		<tr><th>내용</th>
			<td><textarea rows="15" name="content"><%=b.getContent() %></textarea></td></tr>
		<tr><td>첨부파일</td>
			<td style="text-align : left">
				<% if(b.getFile1() !=null && (!b.getFile1().equals(""))) { %>
						<div id="file_desc">
							<%=b.getFile1() %>
							<a href="javascript:file_delete()">[첨부파일삭제]</a>
						</div>
				<% } %>
				<input type="file" name="file1"></td></tr>
		<tr><td colspan="2">
			<a href="javascript:document.f.submit()">[게시물수정]</a></td></tr>
	</table>
</form>

</body>
</html>