<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%--
	1. �α׾ƿ� ������ ��� => "�α����ϼ���" �޽��� ���
	   - �ٸ� ������� ��й�ȣ ���� �Ұ�
	   - opener�������� loginForm.jsp�������� �̵�
		
	2. old_pass�� new_pass �Ķ���� �� ���� (new_pass�� con_pass�� ����)
	
	3. old_pass ��й�ȣ�� db�� ����� ��й�ȣ�� Ʋ����, ��й�ȣ ���� �޽��� ���
	   => passwordForm.jsp �������� �̵�
	   
	4. old_pass ��й�ȣ�� db�� ����� ��й�ȣ�� ������ ��й�ȣ ����
	   - opener�������� update.jsp�������� �̵�
	   - ���� ������ �ݱ�
--%>

<% request.setCharacterEncoding("euc-kr"); %>

<%
	String login = (String)session.getAttribute("login"); //�� �ִ� ������ "id"�� �־�
	
	System.out.print(login);
	
	String old_pass = request.getParameter("old_pass"); // �Է��� ���
	String new_pass = request.getParameter("new_pass"); // ���� ���

	if(login == null || login.trim().equals("")) { // �α����� �Ǿ����� ������,
%>
		<script>
			alert("�α����ϼ���");
			opener.location.href = "loginForm.jsp";
		</script>
<%
	} else { // �α��� ����
		MemberDao dao = new MemberDao(); // db�� ���õ� ��ü�� ����
		Member dbmem = dao.selectOne(login);
	    // db�κ��� �ش� ���̵��� ������ Member ��ü�� ����
	    // selectOne(id) : ����� id�� �ش��ϴ� db������ 
	    // dbmem : ���� �� �����ִ� ������ Member��ü�� ����
	  
	    // ��ü?
/* 	    dbmem.setPass();

		System.out.print(dbmem.setPass());
 */
	    
	    if(!old_pass.equals(dbmem.getPass())) {
%>
			<script>
				alert("��й�ȣ �����Դϴ�. Ȯ�����ּ���");
				location.href="passwordForm.jsp?id=<%=login %>";
			</script>
<%
	    } else { // ��й�ȣ�� ����
	    	int result = dao.updatepass(login, new_pass); // db�� ȸ�� ���� ������ . ��� ������ ����
	    	if(result >0) {	
%>
	    		<script>
	    			alert("����Ǿ����ϴ�");
	    			opener.location.href = "updateForm.jsp?id=<%=login %>";
	    			self.close();
	    		</script>
<%
	    	}
	    }
	}
%>