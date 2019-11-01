<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%--
	1. �Ķ���� ������ Member ��ü�� ����
	2. Member ��ü�� DB�� ���� --------------------------- (Model ���)
	3. ȸ�������� ���� => loginForm.jsp �������� �̵�
	4. ȸ�������� ���� => (���̵� �ߺ���) joinForm.jsp ������ �̵�

	=> �ڱ� �������� �ʿ����
--%>

<% request.setCharacterEncoding("euc-kr"); %>

<jsp:useBean id="m" class="model.Member" />
<%--
	Member m = new Member();
--%>
<jsp:setProperty name="m" property="*" /> <%-- ��� ������Ƽ���� ���� --%>

<%
	MemberDao dao = new MemberDao(); // dao ��ü ����
	int result = dao.insert(m); // MemberDao�� �ִ� �޼��� ȣ�� (m : Member ��ü)
	/*
		insert()
		- ���������� : public
		- ����Ÿ�� : int
		- �̸� : insert
		- �Ű����� : Member m
	*/
	
	String msg = null;
	String url = null;
	
	if(result > 0) {
		msg = m.getName() + "�� ȸ�� ���� �Ϸ�";
		url = "loginForm.jsp";
	} else {
		msg = "ȸ�� ���� ����";
		url = "joinForm.jsp";
	}
%>

<script type="text/javascript">
	alert("<%=msg %>");
	location.href="<%=url %>";
</script>
