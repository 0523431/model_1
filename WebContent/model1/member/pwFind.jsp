<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	String id = request.getParameter("id");
	String email = request.getParameter("email");
	String tel = request.getParameter("tel");

	MemberDao dao = new MemberDao();
	String pass = dao.findPass(id, email, tel);

	/* System.out.println(email + tel);
	System.out.println(mem);
	System.out.println(mem.getEmail());
	System.out.println(mem.getTel()); */

	if (pass == null || pass.equals("")) { // pass가 없다면
		//mem.getId().equals(null)
		//mem.getEmail().equals(null) || mem.getTel().equals(null)
%>
<script>
   alert("해당 정보가 없습니다");
   location.href="pwForm.jsp";
  </script>
<%  } else { %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>비밀번호 찾기</title>

<script type="text/javascript">
	function closePass() {
		opener.document.f.pass.value = ""; // 전달안함
		opener.document.f.pass.focus();
		self.close();
	}
</script>

</head>

<body>
<form name="f" <%--onsubmit="return checkinput(this)" --%>>
 <h3 id="passcut">비밀번호 <%="**"+ pass.substring(2, id.length()-1) %></h3>
 <!-- <input type="submit" name="sub" value="닫기"> -->
 <input type="button" value="닫기" onclick="closePass()">
</form>

</body>
</html>

<% } %>