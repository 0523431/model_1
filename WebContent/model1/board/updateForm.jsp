<%@page import="model.Board"%>
<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%--
	1. num���� �Խù��� DB���� ��ȸ�Ͽ� ȭ�鿡 ����ϱ�
--%>

<%
	int num = Integer.parseInt(request.getParameter("num"));

	BoardDao dao = new BoardDao();
	Board b = dao.selectOne(num);
	// Board b = new BoardDao().selectOne(num);
	// b : num�� �ش��ϴ� �Խù��� db�� ������ �����ϰ� �ִ� ��ü
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խù� ���� ȭ��</title>
<link rel="stylesheet" href="/jsp_study1/css/main.css">

<script type="text/javascript">
	function file_delete() { // ÷�������� ������, �����ϴ� �޼���
		document.f.file2.value =""; // hidden���� ���ؼ� db�� ������ ���� (file�� db���踦 ����)
		file_desc.style.display ="none"; // display="none" ===> �������ʰ� ����
	}
</script>

</head>
<body>

<form action="update.jsp" name="f" method="post" enctype="multipart/form-data">
	<input type="hidden" name="num" value="<%=b.getNum() %>"> <%-- �̰� �޾ƾ� update.jsp�� �� �� �־� --%>
	<input type="hidden" name="file2" value="<%=b.getFile1()==null? "":b.getFile1() %>">
	<table>
		<caption>�Խñ� ���� ȭ��</caption>
		<tr><th>�۾���</th>
			<td><input type="text" name="name" value="<%=b.getName() %>"></td></tr>
		<tr><th>��й�ȣ</th>
			<td><input type="password" name="pass"></td></tr>
		<tr><th>����</th>
			<td><input type="text" name="title" value="<%=b.getTitle() %>"></td></tr>
		<tr><th>����</th>
			<td><textarea rows="15" name="content"><%=b.getContent() %></textarea></td></tr>
		<tr><td>÷������</td>
			<td style="text-align : left">
				<% if(b.getFile1() !=null && (!b.getFile1().equals(""))) { %>
						<div id="file_desc">
							<%=b.getFile1() %>
							<a href="javascript:file_delete()">[÷�����ϻ���]</a>
						</div>
				<% } %>
				<input type="file" name="file1"></td></tr>
		<tr><td colspan="2">
			<a href="javascript:document.f.submit()">[�Խù�����]</a></td></tr>
	</table>
</form>

</body>
</html>