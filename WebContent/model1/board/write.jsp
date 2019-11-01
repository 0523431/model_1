<%@page import="model.BoardDao"%>
<%@page import="model.Board"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%--
	1. 파라미터 값을 model.Board 객체에 저장
	   - useBean 액션테그 사용 불가
	   - -------------: request 정보의 파라미터와 빈 클래스의 프로퍼티 비교하는 것
	   -                근데 multipart/form-data로 들어와서 request객체를 사용할 수 없어

	2. 게시물 번호 num은 현재 등록된 num의 최대값을 조회 후 +1
	   => 등록된 게시물의 번호 : 최대값 +1
	   => db에서 maxnum을 구해서 1을 더한 값으로 num을 설정
	   
	3. board내용(입력된 내용)을 db에 등록하기
	   - 등록성공 : 메시지 출력 => list.jsp 페이지 이동
	   - 등록실패 : 메시지 출력 => writeForm.jsp 페이지 이동
--%>

<%
	String uploadpath = application.getRealPath("/") + "model1/board/file/";
	File f = new File(uploadpath);
	
	if(!f.exists()) { // uploadpath폴더가 없는 경우,
		f.mkdirs(); // make dirs => 여러 단계의 폴더를 만들어 줌
	}
	
	int size = 10*1024*1024;
	MultipartRequest multi = new MultipartRequest(request,uploadpath,size,"euc-kr"); // 업로드 완료
	
	// useBean액션테그를 사용할 수 없기때문에, 일일히 넣어줌
	Board board = new Board();
	board.setName(multi.getParameter("name"));
	board.setPass(multi.getParameter("pass"));
	board.setTitle(multi.getParameter("title"));
	board.setContent(multi.getParameter("content"));
	board.setFile1(multi.getFilesystemName("file1"));
	
	BoardDao dao = new BoardDao();
	int num = dao.maxnum(); // db에 등록된 게시물 번호 중 최대값을 넘어주게 설정함(BoardDao에서 설정)

	String msg = "게시물 등록 실패 ㅠㅠ"; // insert()의 return값이 false인 경우
	String url = "writeForm.jsp";
	board.setNum(++num); // num의 최대값 +1
	board.setGrp(num); // group, 게시물 그룹번호(게시물 번호)
	
	if(dao.insert(board)) { // board insert// insert()의 return값이 true인 경우
		msg = "게시물 등록 성공 !!";
		url = "list.jsp";
	}
%>

<script type="text/javascript">
	alert("<%=msg %>");
	location.href="<%=url %>";
</script>
