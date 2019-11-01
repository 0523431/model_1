<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>방명록 작성</title>
</head>
<body>

<form action="book.jsp" method="post">
	<table border="1" style="border-collapse: collapse;">
		<tr><td>작성자</td>
			<td><input type="text" name="name"></td>
		</tr>
		<tr><td>제목</td>
			<td><input type="text" name="title"></td>
		</tr>
		<tr><td>내용</td>
			<td><textarea row="5" cols="60" name="content"></textarea></td>
		</tr>
		<tr><td colspan="2" align="center">
			<input type="submit" value="방명록 등록"></td>
		</tr>
	</table>
</form>

</body>
</html>