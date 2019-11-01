<%@page import="java.io.IOException"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%--
	1. 파일업로드			: java 영역
	2. opener 화면에 결과	: javaScript 영역
	3. 현재화면 close()		: javaScript 영역
--%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%  // 1. 파일 업로드 = java 영역
	String path = application.getRealPath("") + "model1/member/picture";
	String fname = null;

	try {
		File f = new File(path);
		
		if (!f.exists()) { // 해당 위치가 없으면
			f.mkdirs(); // 폴더를 만들어
		}
		
		int size = 10 * 1024 * 1024; // 10M 설정

		MultipartRequest multi = new MultipartRequest(request, path, size, "euc-kr");
		fname = multi.getFilesystemName("picture");
	} catch (IOException e) {
		e.printStackTrace();
	}
%>

<script type="text/javascript">
	img = opener.document.getElementById("pic");
	img.src = "picture/<%=fname %>";
	
	opener.document.f.picture.value="<%=fname%>";
	self.close();
</script>

</body>
</html>