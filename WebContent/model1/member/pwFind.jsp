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

	if (pass == null || pass.equals("")) { // pass�� ���ٸ�
		//mem.getId().equals(null)
		//mem.getEmail().equals(null) || mem.getTel().equals(null)
%>
<script>
   alert("�ش� ������ �����ϴ�");
   location.href="pwForm.jsp";
  </script>
<%  } else { %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��й�ȣ ã��</title>

<script type="text/javascript">
	function closePass() {
		opener.document.f.pass.value = ""; // ���޾���
		opener.document.f.pass.focus();
		self.close();
	}
</script>

</head>

<body>
<form name="f" <%--onsubmit="return checkinput(this)" --%>>
 <h3 id="passcut">��й�ȣ <%="**"+ pass.substring(2, id.length()-1) %></h3>
 <!-- <input type="submit" name="sub" value="�ݱ�"> -->
 <input type="button" value="�ݱ�" onclick="closePass()">
</form>

</body>
</html>

<% } %>