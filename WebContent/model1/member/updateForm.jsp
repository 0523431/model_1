<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%--
	1. id�Ķ���� ��ȸ
	2. login ���� ��ȸ
	   - �α��� �� �� ��� : "�α����ϼ���" �޼��� ��� => loginForm.jsp ������ �̵�
	3. login �� ��� : �α����� admin�� �ƴѵ�, �ٸ������ ������ ��ȸ�ϸ�
					"�� ���� ������ �����մϴ�" �޽��� ��� => main.jsp ������ �̵�

	4. id�� ������ db���� �о Member��ü�� ����
	5. Member ��ü�� ȭ�鿡 ���
--%>

<%
	// id, login ��ȸ
	String id = request.getParameter("id");
	String login = (String)session.getAttribute("login");
	
	if(login == null || login.equals("")) { // �α����� �� �� ���
%>
		<script>
			alert("�α����ϼ���");
			location.href="loginForm.jsp";
		</script>
<%	} else { // �α����� �� ���
		if(!login.equals("admin") && !id.equals(login)) {
%>
			<script>
				alert("�� ���� ������ �����մϴ�");
				location.href="main.jsp";
			</script>
<%		} else { // 4. id�� ������ db���� �о Member��ü�� ����
			Member info = new MemberDao().selectOne(id);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ����</title>
<link rel="stylesheet" href="/jsp_study1/css/main.css">

<script type="text/javascript">
	function win_upload() {
		var op = "width=600, height=200,munubar=no,top=200,left=200";
		open("pictureForm.jsp","window`s name",op);
	}
	
	function inputcheck(check) {
		<% if(!login.equals("admin")) {%>
			if(check.pass.value == "") {
				alert("��й�ȣ�� �Է��ϼ���");
				check.pass.focus();
				return false;
			}
		<% } %>
	}
	
	function win_modify() {
		var op = "width=500, height=250, munubar=no, top=300, left=400";
		open("passwordForm.jsp","",op);
		// ������ submit()�� ������� f.submit()?
	}
</script>

</head>
<body>

<form action="update.jsp" name="f" method="post"
	  onsubmit="return inputcheck(this)">
	<input type="hidden" name="picture" value="<%=info.getPicture() %>">
	<table>
		<caption>ȸ�� ���� ����</caption>
		<tr><td rowspan="4" valign="bottom">
			<img src="picture/<%=info.getPicture() %>" width="100" height="120" id="pic"><br>
			<%--picture/ �� �ڿ� �ּҸ� �ٿ��ְ� �Ǵ� �� --%>
			<font size ="1"><a href="javascript:win_upload()">��������</a></font></td>
			<th>���̵�</th><td><input type="text" name="id" readonly value="<%=info.getId() %>"></td></tr>
													  <%--readonly : ������ �� ���� --%>
		<tr><th>��й�ȣ</th><td><input type="password" name="pass"></td></tr>
		<tr><th>�̸�</th><td><input type="text" name="name" value="<%=info.getName() %>"></td></tr>
		<tr><th>����</th><td><input type="radio" name="gender" value="1"<%=info.getGender()==1? "checked":"" %>>��
							<input type="radio" name="gender" value="2"<%=info.getGender()==2? "checked":"" %>>��</td></tr>
		<tr><th>��ȭ��ȣ</th><td colspan="2"><input type="text" name="tel" value="<%=info.getTel() %>"></td></tr>
		<tr><th>�̸���</th><td colspan="2"><input type="text" name="email" value="<%=info.getEmail() %>"></td></tr>
		<tr><td colspan="3">
			<input type="submit" value="ȸ������">
			<input type="button" value="��й�ȣ����" onclick="win_modify()"></td></tr>
	</table>
</form>

</body>
</html>
<%
		}
	}
%>