<%@page import="model.BoardDao"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@page import="model.Board"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%--
	1. �Ķ������������ Board ��ü�� ����
	
	2. ��й�ȣ ����
	   - ��ġ�ϴ� ��� => �Ķ������ �������� �ش� �Խù��� ������ ����
	              => ÷�������� ������ ���� ��� file2 �Ķ������ ������ �ٽ� ����
	   - ����ġ�ϴ� ��� : �����޽��� ��� & updateForm.jsp�� �̵�
	
	3. - �������� : �������� �޽��� ��� �� info.jsp �̵�
	   - �������� : �������� �޽��� ��� �� updateForm.jsp �̵�
--%>

<%
	// useBean�׼��ױ׸� ����� �� �����ϱ�
	// Board��ü�� �Ķ���� ������ ������ ��������
	Board board = new Board();
	String uploadpath = application.getRealPath("/") + "model1/board/file/";
	MultipartRequest multi = new MultipartRequest(request, uploadpath, 10*1024*1024, "euc-kr");

	board.setNum(Integer.parseInt(multi.getParameter("num")));
	board.setName(multi.getParameter("name"));
	board.setPass(multi.getParameter("pass"));
	board.setTitle(multi.getParameter("title"));
	board.setContent(multi.getParameter("content"));
	board.setFile1(multi.getFilesystemName("file1"));
	
	// => ÷�������� ������ ���� ��� file2 �Ķ������ ������ �ٽ� ����
	// ���ϼ����� ���� ���� - �׷��� multi.getParameter("file2")�� ������ setFile1 ����
	if(board.getFile1()==null || board.getFile1().equals("")) {
		board.setFile1(multi.getParameter("file2"));
	}
	
	// ��й�ȣ ���� ��û ------------------------------------------ �ƴ�
	// String pass = request.getParameter("pass");
	
	// 2. ��й�ȣ ����
	BoardDao dao = new BoardDao();
	Board dbBoard = dao.selectOne(board.getNum());
	
	System.out.println(board.getPass());
	System.out.println("NUM"+board.getNum());
	System.out.println(dbBoard.getPass());
	System.out.println(dbBoard.getNum());
	
	
	String msg = "��й�ȣ�� Ʋ�Ƚ��ϴ� == ��������";
	String url = "updateForm.jsp?num=" + board.getNum();
	
	// ��й�ȣ ����
	if(board.getPass().equals(dbBoard.getPass())) { // ��й�ȣ ��ġ
		if(dao.update(board)) { // true | false
			msg = "��������";
			url = "info.jsp?num=" + board.getNum();
		} else {
			msg = "�Խù� ���� ����";
		}
	}
%>

<script>
	alert("<%=msg %>");
	location.href="<%=url %>";
</script>