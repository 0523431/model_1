<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������ �α��� ȭ��</title>
<%--
	http://localhost:8080/jsp_study1/model1/member/loginForm.jsp
--%>
<link rel="stylesheet" href="/jsp_study1/css/main.css">
<%--
	.. �������� : (model1)
	
	href="../../css/main.css" 		: url ����� ���
	href="/jsp_study1/css/main.css" : url ������ ���
--%>

<script type="text/javascript">
	function win_findid() {
		var op = "width=500, height=250, munubar=no, top=300, left=400";
		open("idForm.jsp","",op);
	}
	
	function win_findpass() {
		var op = "width=500, height=250, munubar=no, top=300, left=400";
		open("pwForm.jsp","",op);
	}
	
</script>

</head>
<body>

<form action="login.jsp" name="f" method="post">
	<table>
		<caption>�α���</caption>
		<tr><th>���̵�</th><td><input type="text" name="id"></td></tr>
		<tr><th>��й�ȣ</th><td><input type="password" name="pass"></td></tr>
		<tr><td colspan="2">
			<input type="submit" value="�α���"> <%-- login.jsp�� �̵� --%>
			<input type="button" value="ȸ������" onclick="location.href='joinForm.jsp'">
			<input type="button" value="���̵� ã��" onclick="win_findid()">
			<input type="button" value="��й�ȣ ã��" onclick="win_findpass()"></td>
		</tr>
	</table>
</form>

</body>
</html>