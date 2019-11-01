<%@page import="java.io.IOException"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%--
	1. ���Ͼ��ε�			: java ����
	2. opener ȭ�鿡 ���	: javaScript ����
	3. ����ȭ�� close()		: javaScript ����
--%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%  // 1. ���� ���ε� = java ����
	String path = application.getRealPath("") + "model1/member/picture";
	String fname = null;

	try {
		File f = new File(path);
		
		if (!f.exists()) { // �ش� ��ġ�� ������
			f.mkdirs(); // ������ �����
		}
		
		int size = 10 * 1024 * 1024; // 10M ����

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