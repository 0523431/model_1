<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="EUC-KR">
<title>���Գ��� Ȯ��</title>
<link rel="stylesheet" href="../css/main.css">

</head>
<body>

<% request.setCharacterEncoding("euc-kr"); %>

<jsp:useBean id="join" class="chap07.Member" />
<%--
	joinForm�� �Ķ���Ͱ� join���� �Ѿ����,
	�׷��� �ѱۺκ��� ���ڵ����ְ�
	
	<jsp:useBean id="join" class="chap07.Member" />
	��ü�ϳ� ���� �̸��� join�̶�� ���ذž�

	�ڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡ�
	<jsp:setProperty property="*" name="join" />
	�Ķ���Ϳ� 	setProperty�� ���� ��.
	�ڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡ�
	
	<jsp:getProperty property="id" name="join" />
	join��ü�� �ִ� getId()�� ȣ���

--%>
<jsp:setProperty property="*" name="join" />

<table border="1" style="border-collapse: collapse;" >
	<caption>ȸ������ ��ȸ</caption>
	<tr><td>���̵�</td>
		<td><jsp:getProperty property="id" name="join" /></td></tr>
	<tr><td>��й�ȣ</td>
		<td><jsp:getProperty property="pass" name="join" /></td></tr>
	<tr><td>�̸�</td>
		<td><jsp:getProperty property="name" name="join" /></td></tr>
	<tr><td>����</td>
		<td><jsp:getProperty property="gender2" name="join" /></td></tr>
		<%-- gender2�� join�� ���(MemberŬ������ getter)�� ������� �� �־� --%>
<%-- 	<td><jsp:getProperty property="gender" name="join" /></td></tr> --%>
<%--	<td><(join.getGender()==1)? "��":"��"></td></tr> --%>
	<tr><td>����</td>
		<td><jsp:getProperty property="age" name="join" /></td></tr>
	<tr><td>�̸���</td>
		<td><jsp:getProperty property="email" name="join" /></td></tr>
</table>


</body>
</html>