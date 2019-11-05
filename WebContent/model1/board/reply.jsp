<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%--
	<��� �ޱ�>
	
	1. �Ķ���� ���� Board ��ü�� �����ϱ� ======================> useBean�׼���ũ ���
	   - ���� ���� : num / grp / grplevel / grpstep
	   - ��� ���� : name / pass / title / content  ======> ���� ����
	
	2. ���� grp���� ����ϴ� �Խù����� grpstep ���� 1�����ϱ�
	   - void BoardDao.grpStepAdd(grp, grpstep)

	3. Board ��ü�� db�� insert�ϱ�
	   - num : maxnum+1
	   - grp : ���۰� �����ϰ� ����
	   - grplevel : ���� +1 (��� �ܰ�)
	   - grpstep : ���� +1
	
	4. - ��� ������ : "�亯��� �Ϸ�" �޽��� ��� => list.jsp�� �̵�
	   - ��� ���н� : "�亯��� �����߻�" �޽��� ��� => replyForm.jsp�� �̵�
--%>

<% request.setCharacterEncoding("euc-kr"); %>

<jsp:useBean id="re" class="model.Board" />
<jsp:setProperty name="re" property="*" />
<%--
	��ü re�� ��� ������ �� �־�
--%>
<%
	BoardDao dao = new BoardDao();

	// 2������ : ���� grp���� ����ϴ� �Խù����� grpstep ���� 1�����ϱ�
	// ������ ���� grp, grpstep�� ������
	dao.grpStepAdd(re.getGrp(), re.getGrpstep());

	System.out.print(re.getGrp()); // value���� ������ �޴°� �����ϱ� 0�̵�

	// 3������
	int grplevel = re.getGrplevel();
	int grpstep = re.getGrpstep();
	int num = dao.maxnum(); // num�� �ִ밪 ����
	
	String msg = "�亯 ��Ͻ� ���� �߻�";
	String url = "replyForm.jsp?num="+re.getNum();
	
	re.setNum(++num);
	re.setGrplevel(grplevel +1); // ���ۺ��� ����
	re.setGrpstep(grpstep +1); // ���� �ٷ� ������ �� �� �ְ� �������
	
	if(dao.insert(re)) {
		msg = "�亯 ��� �Ϸ�";
		url = "list.jsp";
	}
%>

<script type="text/javascript">
	alert("<%=msg %>");
	location.href="<%=url %>";
</script>