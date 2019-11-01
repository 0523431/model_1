<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="EUC-KR">
<title>회원 사진 등록</title>
<link rel="stylesheet" href="/jsp_study1/css/main.css">
</head>

<body>

<h3>사진 업로드</h3>
<form action="picture.jsp" method="post" enctype="multipart/form-data">
	<input type="file" name="picture">
	<input type="submit" value="사진등록">
</form>

</body>

</html>