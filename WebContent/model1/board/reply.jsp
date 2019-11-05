<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%--
	<답글 달기>
	
	1. 파라미터 값을 Board 객체에 저장하기 ======================> useBean액션태크 사용
	   - 원글 정보 : num / grp / grplevel / grpstep
	   - 답글 정보 : name / pass / title / content  ======> 수정 정보
	
	2. 같은 grp값을 사용하는 게시물들의 grpstep 값을 1증가하기
	   - void BoardDao.grpStepAdd(grp, grpstep)

	3. Board 객체를 db에 insert하기
	   - num : maxnum+1
	   - grp : 원글과 동일하게 유지
	   - grplevel : 원글 +1 (답글 단계)
	   - grpstep : 원급 +1
	
	4. - 등록 성공시 : "답변등록 완료" 메시지 출력 => list.jsp로 이동
	   - 등록 실패시 : "답변등록 오류발생" 메시지 출력 => replyForm.jsp로 이동
--%>

<% request.setCharacterEncoding("euc-kr"); %>

<jsp:useBean id="re" class="model.Board" />
<jsp:setProperty name="re" property="*" />
<%--
	객체 re에 모든 정보가 들어가 있어
--%>
<%
	BoardDao dao = new BoardDao();

	// 2번내용 : 같은 grp값을 사용하는 게시물들의 grpstep 값을 1증가하기
	// 원글의 정보 grp, grpstep를 가지고
	dao.grpStepAdd(re.getGrp(), re.getGrpstep());

	System.out.print(re.getGrp()); // value값이 없으면 받는게 없으니까 0이됨

	// 3번내용
	int grplevel = re.getGrplevel();
	int grpstep = re.getGrpstep();
	int num = dao.maxnum(); // num의 최대값 저장
	
	String msg = "답변 등록시 오류 발생";
	String url = "replyForm.jsp?num="+re.getNum();
	
	re.setNum(++num);
	re.setGrplevel(grplevel +1); // 원글보다 증가
	re.setGrpstep(grpstep +1); // 원글 바로 밑으로 들어갈 수 있게 만들어줌
	
	if(dao.insert(re)) {
		msg = "답변 등록 완료";
		url = "list.jsp";
	}
%>

<script type="text/javascript">
	alert("<%=msg %>");
	location.href="<%=url %>";
</script>