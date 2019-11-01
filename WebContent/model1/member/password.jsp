<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%--
	1. 로그아웃 상태인 경우 => "로그인하세요" 메시지 출력
	   - 다른 사용자의 비밀번호 변경 불가
	   - opener페이지를 loginForm.jsp페이지로 이동
		
	2. old_pass와 new_pass 파라미터 값 저장 (new_pass와 con_pass와 동일)
	
	3. old_pass 비밀번호가 db에 저장된 비밀번호와 틀리면, 비밀번호 오류 메시지 출력
	   => passwordForm.jsp 페이지로 이동
	   
	4. old_pass 비밀번호가 db에 저장된 비밀번호와 같으면 비밀번호 수정
	   - opener페이지를 update.jsp페이지로 이동
	   - 현재 페이지 닫기
--%>

<% request.setCharacterEncoding("euc-kr"); %>

<%
	String login = (String)session.getAttribute("login"); //에 있는 정보는 "id"만 있어
	
	System.out.print(login);
	
	String old_pass = request.getParameter("old_pass"); // 입력한 비번
	String new_pass = request.getParameter("new_pass"); // 변경 비번

	if(login == null || login.trim().equals("")) { // 로그인이 되어있지 않으면,
%>
		<script>
			alert("로그인하세요");
			opener.location.href = "loginForm.jsp";
		</script>
<%
	} else { // 로그인 상태
		MemberDao dao = new MemberDao(); // db에 관련된 객체를 만듦
		Member dbmem = dao.selectOne(login);
	    // db로부터 해당 아이디의 정보를 Member 객체로 리턴
	    // selectOne(id) : 사용자 id에 해당하는 db정보를 
	    // dbmem : 변경 전 원래있던 정보를 Member객체로 저장
	  
	    // 객체?
/* 	    dbmem.setPass();

		System.out.print(dbmem.setPass());
 */
	    
	    if(!old_pass.equals(dbmem.getPass())) {
%>
			<script>
				alert("비밀번호 오류입니다. 확인해주세요");
				location.href="passwordForm.jsp?id=<%=login %>";
			</script>
<%
	    } else { // 비밀번호가 맞음
	    	int result = dao.updatepass(login, new_pass); // db에 회원 정보 변경기능 . 결과 정수값 리턴
	    	if(result >0) {	
%>
	    		<script>
	    			alert("변경되었습니다");
	    			opener.location.href = "updateForm.jsp?id=<%=login %>";
	    			self.close();
	    		</script>
<%
	    	}
	    }
	}
%>