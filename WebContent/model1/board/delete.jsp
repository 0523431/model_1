<%@page import="model.Board"%>
<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
	1. num, pass 파라미터를 변수에 저장
	
	2. 입력된 비밀번호와 db 비밀번호 검증
	   - 틀린 경우, 비밀번호 오류 메시지 출력 & deleteForm.jsp로 이동
	
	3. 비밀번호가 맞는 경우,
	   - 삭제 성공 : 삭제 성공 메시지 출력 후, list.jsp로 이동
	   - 삭제 실패 : 삭제 실패 메시지 출력 후, info.jsp로 이동
--%>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pass = request.getParameter("pass");
		
	Board b = new BoardDao().selectOne(num);
	
	//System.out.println(num);
	//System.out.println(pass);
	System.out.println(b);
	
	if(b == null) { // 삭제한 글을 다시 삭제하려고 할 때,
%>		
		<script>
			alert("없는 게시글입니다");
			location.href="list.jsp";
		</script>		
<%	} else {
	if(!pass.equals(b.getPass()) || pass.equals("")) {
%>
		<script>
			alert("비밀번호가 맞지 않습니다");
			location.href="deleteForm.jsp?num=" +<%=num %>;
		</script>
<%	} else { // 비밀번호가 맞아
		if(new BoardDao().deleteB(b)) {
%>
			<script>
				alert("게시글 삭제 성공");
				location.href="list.jsp";
			</script>
<%		} else {
%>
			<script>
				alert("게시글 삭제 실패");
				location.href="info.jsp?num="+<%=num %>;
			</script>
<%		}
	} }
%>
