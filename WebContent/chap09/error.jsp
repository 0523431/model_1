<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%--
	현재 페이지가 오류 처리 페이지임을 알려줌
	: exception 객체 전달
--%>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>오류 페이지</title>
</head>
<body>

<h1>파라미터 name을 입력해주세요</h1>
<h1>계속 오류 발생시, 전사부로 전화 요망</h1>
<h1>담당자 길동홍, 전화 1234</h1>

<%= exception.getClass().getName() %>
<% exception.printStackTrace(response.getWriter()); %>
<!-- 
	html 주석을 사용하여, 페이지 용량을 늘림
	왜? 오류페이지의 출력 용량이 500byte 미만인 경우 explore에서 출력이 안됨
	500byte가 넘어야 브라우저에서 현재 페이지가 아닌 "http 오류 페이지"를 출력할 수 있음
	500byte를 넘기기위한 의미없는 작업
-->
<!-- 
	html 주석을 사용하여, 페이지 용량을 늘림
	왜? 오류페이지의 출력 용량이 500byte 미만인 경우 explore에서 출력이 안됨
	500byte가 넘어야 브라우저에서 현재 페이지가 아닌 "http 오류 페이지"를 출력할 수 있음
	500byte를 넘기기위한 의미없는 작업
-->
<!-- 
	html 주석을 사용하여, 페이지 용량을 늘림
	왜? 오류페이지의 출력 용량이 500byte 미만인 경우 explore에서 출력이 안됨
	500byte가 넘어야 브라우저에서 현재 페이지가 아닌 "http 오류 페이지"를 출력할 수 있음
	500byte를 넘기기위한 의미없는 작업
-->
<!-- 
	html 주석을 사용하여, 페이지 용량을 늘림
	왜? 오류페이지의 출력 용량이 500byte 미만인 경우 explore에서 출력이 안됨
	500byte가 넘어야 브라우저에서 현재 페이지가 아닌 "http 오류 페이지"를 출력할 수 있음
	500byte를 넘기기위한 의미없는 작업
-->
<!-- 
	html 주석을 사용하여, 페이지 용량을 늘림
	왜? 오류페이지의 출력 용량이 500byte 미만인 경우 explore에서 출력이 안됨
	500byte가 넘어야 브라우저에서 현재 페이지가 아닌 "http 오류 페이지"를 출력할 수 있음
	500byte를 넘기기위한 의미없는 작업
-->
<!-- 
	html 주석을 사용하여, 페이지 용량을 늘림
	왜? 오류페이지의 출력 용량이 500byte 미만인 경우 explore에서 출력이 안됨
	500byte가 넘어야 브라우저에서 현재 페이지가 아닌 "http 오류 페이지"를 출력할 수 있음
	500byte를 넘기기위한 의미없는 작업
-->
<!-- 
	html 주석을 사용하여, 페이지 용량을 늘림
	왜? 오류페이지의 출력 용량이 500byte 미만인 경우 explore에서 출력이 안됨
	500byte가 넘어야 브라우저에서 현재 페이지가 아닌 "http 오류 페이지"를 출력할 수 있음
	500byte를 넘기기위한 의미없는 작업
-->
</body>
</html>