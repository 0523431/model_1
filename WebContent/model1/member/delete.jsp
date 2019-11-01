<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>

<%--
	* ������ ��ο� ���� �Ķ���Ͱ� 2���� ��
	
	1. �α׾ƿ� ���� : "�α����ϼ���" �޽�ġ ��� => login.jsp ������ �̵�

	2. �α��� ����
	   - �����ڰ� �ƴϰ�, id�� login�� �ٸ� ���
	     "���θ� Ż�� �����մϴ�" �޼��� ��� => main.jsp �������� �̵�
	   - id�� �������� ���,
	     "�����ڴ� Ż�� �Ұ����մϴ�" �޼��� ��� => list.jsp ������ �̵�
	   --------------------------------------------------------- ��ȿ�� ����
	   - �Ϲ� �����  :(1) ���̵�, ��й�ȣ ������ �Ķ���ͷ� ����
	   			  (2) ��й�ȣ ����ġ, �Էµ� ��й�ȣ�� db�� ��й�ȣ�� ����
	   			      "��й�ȣ�� Ʋ���ϴ�.=>�޽��� ��� deleteForm ������ �̵�
	   - ������ : (1) id ������ �Ķ���ͷ� ����

	3. ������ �α���, �Ǵ� ��й�ȣ�� ��ġ�ϴ� ��� db���� ȸ������ �����ϱ�
	   - ���� ���� : �Ϲݻ���� : �α׾ƿ� ��, "Ż��" �޼������ => loginForm.jsp�� ������ �̵�
	   		            ������ : "Ż��" �޼������ => list.jsp�� ������ �̵�
	   - ���� ���� : �Ϲݻ����, "��������" �޽��� ��� => info.jsp ������ �̵�
	     		   ������ : "�������� " �޽��� ��� => list.jsp ������ �̵�

	=> �ڱ� ������ �ʿ����
--%>

<% request.setCharacterEncoding("euc-kr"); %>

<%
	String login = (String)session.getAttribute("login"); //�� �ִ� ������ "id"�� �־�
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	
	String msg =null;
	String url =null;
	
	if(login == null || login.trim().equals("")) { // �α����� �Ǿ����� ������,
		msg ="�α����ϼ���";
		url ="loginForm.jsp";
	} else { // �α��� ����
		if(!login.equals(id) && !login.equals("admin")) {
			// �����ڰ� �ƴϰ�, id�� login�� �ٸ� ���
			msg ="���θ� Ż�� �����մϴ�";
			url ="main.jsp";
		} else if(id.equals("admin")) {
			// request�� id�� �� Ȯ��
			// �����ڴ� Ż�� ����� �Ǵ� ȸ���� �� �� ����
			msg ="�����ڴ� Ż�� �Ұ����մϴ�";
			url ="list.jsp";
		} else { // ��й�ȣ ����
			MemberDao dao = new MemberDao();
			Member dbmem = dao.selectOne(id);
		    // db�κ��� �ش� ���̵��� ������ Member ��ü�� ����
		    // selectOne(id) : ����� id�� �ش��ϴ� db������ ������
			
		    if(login.equals("admin") || pass.equals(dbmem.getPass())) {
		    	// login.equals("admin")�̸�,
		    	// pass.equals(dbmem.getPass())�� null�� �ǵ� ������� ||or�����̴ϱ�
				int result = dao.delete(id);
				if(result >0) { // ����
					if(login.equals("admin")) { // �������� ���
						msg = id + "����� ���� Ż�� ����";
						url = "list.jsp";
					} else { // ���� Ż��
						msg = id +"���� ȸ�� Ż�� �Ϸ�Ǿ����ϴ�";
						url = "loginForm.jsp";
						session.invalidate(); // �α��� ���� ����
					}
				} else { // ����
					msg = id + "���� Ż��� ���� �߻� => ����";
					if(login.equals("admin")) {		// �������� ���
						url ="list.jsp";
					} else {						// �Ϲ� ������� ���
						url ="info.jsp?id="+id;
					}
				}
			} else { // admin�� �ƴѵ�, ��й�ȣ�� Ʋ����� 
				msg = id +"���� ��й�ȣ�� Ʋ���ϴ�";
				url = "deleteForm.jsp?id="+id;
			}
		}
	}
%>

<script>
	alert("<%=msg %>")
	location.href="<%= url%>";
</script>
