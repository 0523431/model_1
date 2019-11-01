<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시판 글쓰기</title>
<link rel="stylesheet" href="/jsp_study1/css/main.css">

<script type="text/javascript">
	function inputcheck() {
		ff = document.f;
		if(ff.name.value=="") {
			alert("글쓴이를 입력하세요");
			ff.name.focus();
			return;
		}
		if(ff.pass.value=="") {
			alert("비밀번호를 입력하세요0");
			ff.pass.focus();
			return;
		}
		if(ff.title.value=="") {
			alert("제목을 입력하세요");
			ff.title.focus();
			return;
		}
		if(ff.content.value=="") {
			alert("내용을 입력하세요");
			ff.content.focus();
			return;
		}
		ff.submit(); // write.jsp로 이동
	}
</script>

</head>
<body>

<form action="write.jsp" method="post" enctype="multipart/form-data" name="f">
	
	<table>
		<caption>게시판 글쓰기</caption>
		<tr><th>글쓴이</th><td><input type="text" name="name"></td></tr>
		<tr><th>비밀번호</th><td><input type="password" name="pass"></td></tr>
		<tr><th>제목</th><td><input type="text" name="title"></td></tr>
		<tr><th>내용</th><td><textarea rows="15" name="content"></textarea></td></tr>
		<tr><th>첨부파일</th><td><input type="file" name="file1"></td></tr>
		<tr><td colspan="2">
			<a href="javascript:inputcheck()">[게시물등록]</a></td></tr>
	</table>
</form>

</body>
</html>