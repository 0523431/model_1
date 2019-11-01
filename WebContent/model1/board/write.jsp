<%@page import="model.BoardDao"%>
<%@page import="model.Board"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%--
	1. �Ķ���� ���� model.Board ��ü�� ����
	   - useBean �׼��ױ� ��� �Ұ�
	   - -------------: request ������ �Ķ���Ϳ� �� Ŭ������ ������Ƽ ���ϴ� ��
	   -                �ٵ� multipart/form-data�� ���ͼ� request��ü�� ����� �� ����

	2. �Խù� ��ȣ num�� ���� ��ϵ� num�� �ִ밪�� ��ȸ �� +1
	   => ��ϵ� �Խù��� ��ȣ : �ִ밪 +1
	   => db���� maxnum�� ���ؼ� 1�� ���� ������ num�� ����
	   
	3. board����(�Էµ� ����)�� db�� ����ϱ�
	   - ��ϼ��� : �޽��� ��� => list.jsp ������ �̵�
	   - ��Ͻ��� : �޽��� ��� => writeForm.jsp ������ �̵�
--%>

<%
	String uploadpath = application.getRealPath("/") + "model1/board/file/";
	File f = new File(uploadpath);
	
	if(!f.exists()) { // uploadpath������ ���� ���,
		f.mkdirs(); // make dirs => ���� �ܰ��� ������ ����� ��
	}
	
	int size = 10*1024*1024;
	MultipartRequest multi = new MultipartRequest(request,uploadpath,size,"euc-kr"); // ���ε� �Ϸ�
	
	// useBean�׼��ױ׸� ����� �� ���⶧����, ������ �־���
	Board board = new Board();
	board.setName(multi.getParameter("name"));
	board.setPass(multi.getParameter("pass"));
	board.setTitle(multi.getParameter("title"));
	board.setContent(multi.getParameter("content"));
	board.setFile1(multi.getFilesystemName("file1"));
	
	BoardDao dao = new BoardDao();
	int num = dao.maxnum(); // db�� ��ϵ� �Խù� ��ȣ �� �ִ밪�� �Ѿ��ְ� ������(BoardDao���� ����)

	String msg = "�Խù� ��� ���� �Ф�"; // insert()�� return���� false�� ���
	String url = "writeForm.jsp";
	board.setNum(++num); // num�� �ִ밪 +1
	board.setGrp(num); // group, �Խù� �׷��ȣ(�Խù� ��ȣ)
	
	if(dao.insert(board)) { // board insert// insert()�� return���� true�� ���
		msg = "�Խù� ��� ���� !!";
		url = "list.jsp";
	}
%>

<script type="text/javascript">
	alert("<%=msg %>");
	location.href="<%=url %>";
</script>
