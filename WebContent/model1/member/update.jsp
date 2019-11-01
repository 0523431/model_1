<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%--
	1. ��� �Ķ���� ���� Member ��ü�� ����
	2. �Էµ� ��й�ȣ�� db�� ����� ��й�ȣ�� ���� ������,
	   "��й�ȣ�� Ʋ�Ƚ��ϴ�"�޽��� ��� �� => updateForm.jsp�������� �̵�
	3. ��й�ȣ�� ������, 1���� ������ db�� ����
	   - int MemberDao.update(Member ��ü)
	   - ����� 0���� ũ��, "���� ����" �޽��� ��� => info.jsp�������� �̵�
	   - ����� 0���ϸ�, "���� ����" �޽��� ��� => main.jsp�������� �̵�
	   
	=> �ڱ� �������� �ʿ����.
--%>

<% request.setCharacterEncoding("euc-kr"); %>

<%--
	updateForm�� �Ķ���Ͱ� update�� �Ѿ����,
	�׷��� �ѱۺκ��� ���ڵ����ְ�
	
	<useBean �׼��� ���>
	- �ڹ� ��ü�� �����ϰų� ������ �̹� ������� ��ü�� ����
	- (id=update)�� ����Ǵ� ������ 
	
	Member update = new Member();
--%>
<jsp:useBean id="update" class="model.Member" />
<%--
	update.setId(request.getParameter("id"))
--%>
<jsp:setProperty name="update" property="*" /> <%-- 1. ��� �Ķ���Ͱ��� Member ��ü�� ���� --%>

<%
    MemberDao dao = new MemberDao(); // db�� ���õ� ��ü�� ����
	Member dbmem = dao.selectOne(update.getId());
    // db�κ��� �ش� ���̵��� ������ Member ��ü�� ����
    // selectOne(id) : ����� id�� �ش��ϴ� db������ 
    // dbmem : ���� �� Member ���� ����
    
    String login = (String)session.getAttribute("login");

	String msg = null;
    String url = null;
    
    if(!login.equals("admin") && !update.getPass().equals(dbmem.getPass())) {
    	msg="��й�ȣ�� Ʋ�Ƚ��ϴ�";
    	url="updateForm.jsp?id=" + update.getId();
    } else {
    	int result = dao.update(update); // db�� ȸ�� ���� ������ . ��� ������ ����
    	if(result >0) {
    		msg = "�����Ϸ�";
    		url = "main.jsp";
    	}
    }
%>

<script>
	alert("<%=msg %>");
	location.href="<%=url %>";
</script>