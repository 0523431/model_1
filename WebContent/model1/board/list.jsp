<%@page import="model.Board"%>
<%@page import="java.util.List"%>
<%@page import="model.BoardDao"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%--
	1. 한페이지 당 10건의 게시물 출력
	   - pageNum 파라미터값을 저장 / 없는 경우 1로 설정(강제)

	2. 최근 등록된 게시물을 가장 위에 배치
	   - list형태

	3. 회면에 출력
	   - 게시물 출력
	   - 페이지 구분 출력
--%>

<%
	int pageNum =1;
	try {
		pageNum = Integer.parseInt(request.getParameter("pageNum"));
	} catch (NumberFormatException e) {
	}
	/*
		pageNum = Integer.parseInt(request.getParameter("pageNum"));
		??????????
	*/
	
	int limit =10; // 한페이지에 출력할 게시물 건수

	BoardDao dao = new BoardDao();
	int boardcount = dao.boardCount(); // 등록된 전체 게시물의 건수 
	
	/* 	화면에 출력된 게시물 데이터
		pageNum에 해당하는 limit=10건만 가져와
		List db에서 읽은 순서대로 가지고 있어
		list
	*/
	List<Board> list = dao.list(pageNum, limit);
	
	/* 	maxpage : 총페이지 개수
		전체 게시물 건수 : 21건 => 3페이지 => pageNum=3
			---> 21.0/10 + 0.95 = (int)(3.05) = 3;
			---> 101.0/10 + 0.95 = (int)(10.1+0.95) = (int)(11.05) = 11;
	 */
	int maxpage = (int)((double)boardcount/limit + 0.95);
	
	/* 	startpage : 화면에 표시될 첫번째 페이지
	
		내가 34페이지를 보고 있으면, startpage는 [31]이 되고 endpage는 [40]
				
		pageNum : 2 => 1페이지
			---> (2/10.0 + 0.9) = ((int)(1.1) *10) +1 = 페이지시작이 1부터
		pageNum : 10 => 1페이지
			---> (10/10.0 +0.9) = ((int)(1.9) -1) *10 = 1부터 statpage를 표시
		pageNum : 101 => 11
			---> (11/10.0 +0.9) = ((int))
	 */ 
	int startpage = ((int)(pageNum/10.0 + 0.9) -1) *10 +1; // 시작 페이지 번호
	int endpage = startpage + 9; // 종료 페이지 번호
	
	if(endpage > maxpage) {
		endpage=maxpage;
	}
	
	// 게시물 번호를 등록한 순서에 상관없이 차례로 나타내고자 할 때,
	int boardnum = boardcount - (pageNum -1) * limit;
	
	/*
		26 - (1-1) *10;
	*/
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시물 목록 보기</title>
<link rel="stylesheet" href="/jsp_study1/css/main.css">

</head>
<body>

<table>
	<caption>게시판 목록</caption>
	<% if(boardcount ==0) { %>
		<tr><td colspan="5">등록된 게시글이 없습니다</td></tr>
	<% } else { // 게시글이  있으면, %>
		<tr><td colspan="5" style="text-align:right">글개수 : <%=boardcount %></td></tr>
		<tr><th width="8%">번호</th>
			<th width="50%">제목</th>
			<th width="14%">작성자</th>
			<th width="17%">등록일</th>
			<th width="11%">조회수</th></tr>
		<% for(Board b : list) { %>
			<tr><td><%=boardnum-- %></td><%--<%=b.getNum() %> --%>
				<td style="text-align:left">
					<%--
						null : 객체 
						"" : 빈문자열
					--%>
					<% if(b.getFile1() != null && !b.getFile1().equals("")) { %>
							<a href="file/<%=b.getFile1() %>"
							 style="text-decoration:none;">[첨부]</a>
							<%--
								write.jsp에서 파일을 업로드 할때,
								model1/board/file/에 업로드 했음
								
								list.jsp가 board밑에 있으니까,
								file/<%=업로드된 파일명 %> 경로로 접근 할 수 있게 됨
								
								-------------------------------------
								style="text-decoration:none;"
								===> a태그 밑줄 없애는 css
							--%>
					<% } else { %>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<% } %>
					
					<%  // 제목을 grplevel별로 다르게 표현하는 방법
						if(b.getGrplevel() >0) { 
							for(int i=1; i<b.getGrplevel(); i++) {%>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<% } %>
							└>
					<%} %>
					
					<a href="info.jsp?num=<%=b.getNum() %>"><%=b.getTitle() %></a></td>
				<td><%=b.getName() %></td>
				<td><%=b.getRegdate() %></td>
				<td><%=b.getReadcnt() %></td></tr>
		<% } // for구문 종료 %>

		
		<%-- 어려운 부분 --%> 
		<tr><td colspan="5">
		<% if(pageNum <= 1) { %>
				[이전]
		<% } else { %>
				<a href="list.jsp?pageNum=<%=pageNum -1 %>">[이전]</a>
		<% } %>
		
		<% for(int a=startpage; a<=endpage; a++) { %>
				<% if(a==pageNum) { %>
					[<%=a %>]
				<% } else {%>
						<a href="list.jsp?pageNum=<%=a %>">[<%=a %>]</a>
				<% } %>
		<% } %>
		
		<% if(pageNum >= maxpage) { %>
				[다음]
		<% } else { %>
				<a href="list.jsp?pageNum=<%=pageNum +1 %>">[다음]</a>
		<% } %>
		</td></tr>
		<% } %>
		
		<tr><td colspan="5" style="text-align:right">
			<a href="writeForm.jsp">[글쓰기]</a></td></tr>
</table>

</body>
</html>