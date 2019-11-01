<%@page import="model.BoardDao"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@page import="model.Board"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%--
	1. 파라미터정보들을 Board 객체에 저장
	
	2. 비밀번호 검증
	   - 일치하는 경우 => 파라미터의 내용으로 해당 게시물의 내용을 수정
	              => 첨부파일의 변경이 없는 경우 file2 파라미터의 내용을 다시 저장
	   - 불일치하는 경우 : 오류메시지 출력 & updateForm.jsp로 이동
	
	3. - 수정성공 : 수정성공 메시지 출력 후 info.jsp 이동
	   - 수정실패 : 수정실패 메시지 출력 후 updateForm.jsp 이동
--%>

<%
	// useBean액션테그를 사용할 수 없으니까
	// Board객체에 파라미터 정보를 일일히 저장해줌
	Board board = new Board();
	String uploadpath = application.getRealPath("/") + "model1/board/file/";
	MultipartRequest multi = new MultipartRequest(request, uploadpath, 10*1024*1024, "euc-kr");

	board.setNum(Integer.parseInt(multi.getParameter("num")));
	board.setName(multi.getParameter("name"));
	board.setPass(multi.getParameter("pass"));
	board.setTitle(multi.getParameter("title"));
	board.setContent(multi.getParameter("content"));
	board.setFile1(multi.getFilesystemName("file1"));
	
	// => 첨부파일의 변경이 없는 경우 file2 파라미터의 내용을 다시 저장
	// 파일수정을 하지 않음 - 그래서 multi.getParameter("file2")의 내용을 setFile1 해줌
	if(board.getFile1()==null || board.getFile1().equals("")) {
		board.setFile1(multi.getParameter("file2"));
	}
	
	// 비밀번호 정보 요청 ------------------------------------------ 아님
	// String pass = request.getParameter("pass");
	
	// 2. 비밀번호 검증
	BoardDao dao = new BoardDao();
	Board dbBoard = dao.selectOne(board.getNum());
	
	System.out.println(board.getPass());
	System.out.println("NUM"+board.getNum());
	System.out.println(dbBoard.getPass());
	System.out.println(dbBoard.getNum());
	
	
	String msg = "비밀번호가 틀렸습니다 == 수정실패";
	String url = "updateForm.jsp?num=" + board.getNum();
	
	// 비밀번호 검증
	if(board.getPass().equals(dbBoard.getPass())) { // 비밀번호 일치
		if(dao.update(board)) { // true | false
			msg = "수정성공";
			url = "info.jsp?num=" + board.getNum();
		} else {
			msg = "게시물 수정 실패";
		}
	}
%>

<script>
	alert("<%=msg %>");
	location.href="<%=url %>";
</script>