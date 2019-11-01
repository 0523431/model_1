<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>

<%--
	* 들어오는 경로에 따라 파라미터가 2개가 됨
	
	1. 로그아웃 상태 : "로그인하세요" 메시치 출력 => login.jsp 페이지 이동

	2. 로그인 상태
	   - 관리자가 아니고, id와 login이 다른 경우
	     "본인만 탈퇴가 가능합니다" 메세지 출력 => main.jsp 페이지로 이동
	   - id가 관리자인 경우,
	     "관리자는 탈퇴가 불가능합니다" 메세지 출력 => list.jsp 페이지 이동
	   --------------------------------------------------------- 유효성 검증
	   - 일반 사용자  :(1) 아이디, 비밀번호 정보를 파라미터로 전송
	   			  (2) 비밀번호 불일치, 입력된 비밀번호와 db의 비밀번호를 검증
	   			      "비밀번호가 틀립니다.=>메시지 출력 deleteForm 페이지 이동
	   - 관리자 : (1) id 정보를 파라미터로 전송

	3. 관리자 로그인, 또는 비밀번호가 일치하는 경우 db에서 회원정보 삭제하기
	   - 삭제 성공 : 일반사용자 : 로그아웃 후, "탈퇴" 메세지출력 => loginForm.jsp로 페이지 이동
	   		            관리자 : "탈퇴" 메세지출력 => list.jsp로 페이지 이동
	   - 삭제 실패 : 일반사용자, "삭제실패" 메시지 출력 => info.jsp 페이지 이동
	     		   관리자 : "삭제실패 " 메시지 출력 => list.jsp 페이지 이동

	=> 자기 페이지 필요없음
--%>

<% request.setCharacterEncoding("euc-kr"); %>

<%
	String login = (String)session.getAttribute("login"); //에 있는 정보는 "id"만 있어
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	
	String msg =null;
	String url =null;
	
	if(login == null || login.trim().equals("")) { // 로그인이 되어있지 않으면,
		msg ="로그인하세요";
		url ="loginForm.jsp";
	} else { // 로그인 상태
		if(!login.equals(id) && !login.equals("admin")) {
			// 관리자가 아니고, id와 login이 다른 경우
			msg ="본인만 탈퇴가 가능합니다";
			url ="main.jsp";
		} else if(id.equals("admin")) {
			// request의 id와 비교 확인
			// 관리자는 탈퇴 대산이 되는 회원이 될 수 없음
			msg ="관리자는 탈퇴가 불가능합니다";
			url ="list.jsp";
		} else { // 비밀번호 검증
			MemberDao dao = new MemberDao();
			Member dbmem = dao.selectOne(id);
		    // db로부터 해당 아이디의 정보를 Member 객체로 리턴
		    // selectOne(id) : 사용자 id에 해당하는 db정보를 가져옴
			
		    if(login.equals("admin") || pass.equals(dbmem.getPass())) {
		    	// login.equals("admin")이면,
		    	// pass.equals(dbmem.getPass())이 null이 되도 상관없어 ||or조건이니까
				int result = dao.delete(id);
				if(result >0) { // 성공
					if(login.equals("admin")) { // 관리자인 경우
						msg = id + "사용자 강제 탈퇴 성공";
						url = "list.jsp";
					} else { // 본인 탈퇴
						msg = id +"님의 회원 탈퇴가 완료되었습니다";
						url = "loginForm.jsp";
						session.invalidate(); // 로그인 정보 삭제
					}
				} else { // 실패
					msg = id + "님의 탈퇴시 오류 발생 => 실패";
					if(login.equals("admin")) {		// 관리자인 경우
						url ="list.jsp";
					} else {						// 일반 사용자인 경우
						url ="info.jsp?id="+id;
					}
				}
			} else { // admin이 아닌데, 비밀번호가 틀린사람 
				msg = id +"님의 비밀번호가 틀립니다";
				url = "deleteForm.jsp?id="+id;
			}
		}
	}
%>

<script>
	alert("<%=msg %>")
	location.href="<%= url%>";
</script>
