<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%--
	1. 모든 파라미터 값을 Member 객체에 저장
	2. 입력된 비밀번호와 db에 저장된 비밀번호가 같지 않으면,
	   "비밀번호가 틀렸습니다"메시지 출력 후 => updateForm.jsp페이지로 이동
	3. 비밀번호가 맞으면, 1번의 내용을 db에 수정
	   - int MemberDao.update(Member 객체)
	   - 결과가 0보다 크면, "수정 성공" 메시지 출력 => info.jsp페이지로 이동
	   - 결과가 0이하면, "수정 실패" 메시지 출력 => main.jsp페이지로 이동
	   
	=> 자기 페이지가 필요없음.
--%>

<% request.setCharacterEncoding("euc-kr"); %>

<%--
	updateForm의 파라미터가 update로 넘어오지,
	그래서 한글부분을 인코딩해주고
	
	<useBean 액션의 기능>
	- 자바 객체를 생성하거나 기존에 이미 만들어진 객체를 리턴
	- (id=update)는 변경되는 내용을 
	
	Member update = new Member();
--%>
<jsp:useBean id="update" class="model.Member" />
<%--
	update.setId(request.getParameter("id"))
--%>
<jsp:setProperty name="update" property="*" /> <%-- 1. 모든 파라미터값을 Member 객체에 저장 --%>

<%
    MemberDao dao = new MemberDao(); // db에 관련된 객체를 만듦
	Member dbmem = dao.selectOne(update.getId());
    // db로부터 해당 아이디의 정보를 Member 객체로 리턴
    // selectOne(id) : 사용자 id에 해당하는 db정보를 
    // dbmem : 변경 전 Member 정보 저장
    
    String login = (String)session.getAttribute("login");

	String msg = null;
    String url = null;
    
    if(!login.equals("admin") && !update.getPass().equals(dbmem.getPass())) {
    	msg="비밀번호가 틀렸습니다";
    	url="updateForm.jsp?id=" + update.getId();
    } else {
    	int result = dao.update(update); // db에 회원 정보 변경기능 . 결과 정수값 리턴
    	if(result >0) {
    		msg = "수정완료";
    		url = "main.jsp";
    	}
    }
%>

<script>
	alert("<%=msg %>");
	location.href="<%=url %>";
</script>