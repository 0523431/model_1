<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
 String email = request.getParameter("email");
 String tel = request.getParameter("tel");
 
 MemberDao dao = new MemberDao();
 String id = dao.findId(email, tel);
 
 /* System.out.println(email + tel);
 System.out.println(mem);
 System.out.println(mem.getEmail());
 System.out.println(mem.getTel()); */
  
 if(id==null || id.equals("")) { // id�� ���ٸ�
  //mem.getId().equals(null)
  //mem.getEmail().equals(null) || mem.getTel().equals(null)
%>
  <script>
   alert("�ش� ������ �����ϴ�");
   location.href="idForm.jsp";
  </script>
<%  } else { %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���̵� ã��</title>

<script type="text/javascript">
	function sendId() {
		opener.document.f.id.value = "<%=id.substring(0, id.length()-2) %>";
		opener.document.f.id.focus();
  		self.close();
  	}

  	function checkinput(f) {
		// opener : loginForm.jsp
		opener.document.getElementById("id").value = f.idcut.value;
  		self.close();
  		return false;
 }
</script>

</head>

<body>
<form name="f">
	<h3 id="idcut">���̵� <%=id.substring(0, id.length()-2) +"**" %></h3>
	<input type="button" value="���̵� ����" onclick="sendId()">
</form>

</body>
</html>

<% } %>