<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%--
	1. 파라미터 정보를 Member 객체에 저장
	2. Member 객체를 DB에 저장 --------------------------- (Model 담당)
	3. 회원가입이 성공 => loginForm.jsp 페이지로 이동
	4. 회원가입이 실패 => (아이디 중복시) joinForm.jsp 페이지 이동

	=> 자기 페이지가 필요없음
--%>

<% request.setCharacterEncoding("euc-kr"); %>

<jsp:useBean id="m" class="model.Member" />
<%--
	Member m = new Member();
--%>
<jsp:setProperty name="m" property="*" /> <%-- 모든 프로퍼티값을 저장 --%>

<%
	MemberDao dao = new MemberDao(); // dao 객체 생성
	int result = dao.insert(m); // MemberDao에 있는 메서드 호출 (m : Member 객체)
	/*
		insert()
		- 접근제어자 : public
		- 리턴타입 : int
		- 이름 : insert
		- 매개변수 : Member m
	*/
	
	String msg = null;
	String url = null;
	
	if(result > 0) {
		msg = m.getName() + "님 회원 가입 완료";
		url = "loginForm.jsp";
	} else {
		msg = "회원 가입 실패";
		url = "joinForm.jsp";
	}
%>

<script type="text/javascript">
	alert("<%=msg %>");
	location.href="<%=url %>";
</script>
