<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>방명록 내용 보기</title>
</head>
<body>

<% request.setCharacterEncoding("euc-kr"); %>

<%--
	useBean을 사용하지 않는다면,
	
	String writer = request.getParameter("writer");
	...
--%>

<%--
	<useBean 액션의 기능>

	1. Book book = new Book(); 객체생성
	2. pageContext.setAttribute("book",book); 속성등록
	   - scope : 사용범위
	   - scope="page" 생략가능 (page영역=pageContext)
	   
	   request.setAttribute("book",book); 속성등록
	   - scope="request"
	   
--%>
<jsp:useBean id="book" class="chap07.Book" scope="page" />

<%--
	book.setWriter(request.getParameter("writer");
	book.setTitle(request.getParameter("title");
	...
	
	<프로퍼티와 파라미터의 이름이 같으면 다 set됨>
	
	프로퍼티property의 이름은..
		set프로퍼티
		setXxxx => property의 이름은 xxxx
		get프로퍼티
		getXxxx => property의 이름은 xxxx
--%>
<jsp:setProperty property="*" name="book" />

<%--
	book.setWriter(request.getParameter("name"))
	writer를 name으로 바꿨을 경우, 찾아다니면서 바꾸는게 아니라 아래처럼 적용시켜주면 됨
	
	<프로퍼티의 이름이랑 파라미터의 이름이 다른 경우>
--%>
<jsp:setProperty property="writer" name="book" param="name" />


<table border="1" style="border-collapse: collapse;">
	<caption>방명록 조회</caption>
	
	<tr><td>작성자</td>
		<%-- book.getWriter() 메서드 호출 --%>
		<td><jsp:getProperty name="book" property="writer" />
		,<%=book.getWriter() %>
		</td>
	</tr>
	
	<tr><td>제목</td>
		<%-- book.getTitle() 메서드 호출 --%>
		<td><jsp:getProperty name="book" property="title" />
		,<%=book.getTitle() %>
		</td>
	</tr>
	
	<tr><td>내용</td>
		<%-- book.getContext() 메서드 호출 --%>
		<td><jsp:getProperty name="book" property="context" />
		,<%=book.getContext() %>
		</td>
	</tr>
</table>

</body>
</html>