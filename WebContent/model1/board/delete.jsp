<%@page import="model.Board"%>
<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
	1. num, pass �Ķ���͸� ������ ����
	
	2. �Էµ� ��й�ȣ�� db ��й�ȣ ����
	   - Ʋ�� ���, ��й�ȣ ���� �޽��� ��� & deleteForm.jsp�� �̵�
	
	3. ��й�ȣ�� �´� ���,
	   - ���� ���� : ���� ���� �޽��� ��� ��, list.jsp�� �̵�
	   - ���� ���� : ���� ���� �޽��� ��� ��, info.jsp�� �̵�
--%>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pass = request.getParameter("pass");
		
	Board b = new BoardDao().selectOne(num);
	
	//System.out.println(num);
	//System.out.println(pass);
	System.out.println(b);
	
	if(b == null) { // ������ ���� �ٽ� �����Ϸ��� �� ��,
%>		
		<script>
			alert("���� �Խñ��Դϴ�");
			location.href="list.jsp";
		</script>		
<%	} else {
	if(!pass.equals(b.getPass()) || pass.equals("")) {
%>
		<script>
			alert("��й�ȣ�� ���� �ʽ��ϴ�");
			location.href="deleteForm.jsp?num=" +<%=num %>;
		</script>
<%	} else { // ��й�ȣ�� �¾�
		if(new BoardDao().deleteB(b)) {
%>
			<script>
				alert("�Խñ� ���� ����");
				location.href="list.jsp";
			</script>
<%		} else {
%>
			<script>
				alert("�Խñ� ���� ����");
				location.href="info.jsp?num="+<%=num %>;
			</script>
<%		}
	} }
%>
