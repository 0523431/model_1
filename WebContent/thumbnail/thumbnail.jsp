<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.io.File"%>
<%@page import="java.awt.Graphics2D"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="javax.media.jai.JAI"%>
<%@page import="javax.media.jai.RenderedOp"%>
<%@page import="java.awt.image.renderable.ParameterBlock"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>원본이미지와 썸네일 이미지 보기</title>
</head>
<body>

<%
	String path = application.getRealPath("/") + "thumbnail/"; // 폴더 지정(상대경로)
	// path : 이미지 업로드 위치 (서버의 위치)
	// 썸네일 이미지가 저장되는 위치
	
	// application.getRealPath("/")
	// D:\20190901_P\html\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\jsp_study1
	// \thumbnail
	
	// 최대 업로드 크기
	int size = 10*1024*1024;
	
	/*
		form파일에서 enctype="multipart/form-data"이 설정되야 사용이 가능함
		
		request : 요청객체. 파라미터정보, 파일정보, 파일 내용 => 데이터정보
		path : 업로드되는 파일의 폴더 정보
		size : 최대 업로드 가능한 파일의 크기
		"euc-kr" : (파라미터 정보가 있다면) 인코딩 정보
		
		MultipartRequest 객체만 만들면 ====> 파일 업로드 완료
	*/
	MultipartRequest multi = new MultipartRequest(request, path, size, "euc-kr");
	
	// fname : 업로드 된 파일의 이름	
	String fname = multi.getFilesystemName("picture");
	
/* 	ParameterBlock pb = new ParameterBlock();
	pb.add(path + fname);

	RenderedOp rop = JAI.create("fileload", pb);
	BufferedImage bi = rop.getAsBufferedImage(); */

	// new File(path + fname) : 업로드된 이미지
	// BufferedImage : 이미지를 읽어서 메모리에 로드
	// bi : 원본 이미지의 메모리 로드 데이터 정보
	BufferedImage bi = ImageIO.read(new File(path + fname));
	int width = bi.getWidth()/5;
	int height = bi.getHeight()/5;
	
	// thumb : 원본이미지의 1/5크기의 이미지 버퍼를 생성
	// BufferedImage.TYPE_INT_RGB : 색상은 컬러로 지정 (black : 흑백)
	// 줄어든 이미지가 옮겨질 빈 공간(도화지)를 준비한 것
	BufferedImage thumb = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
	
	// g : 그리기 도구 객체
	//drawImage() : 이미지 그리기 / 이미지버퍼에 원본의 1/5 크기의 이미지 생성
	Graphics2D g = thumb.createGraphics();
	g.drawImage(bi, 0, 0, width, height, null);
	
	File f = new File(path + "sm_" + fname);
	// 이미지버퍼의 내용을 파일로 생성
	ImageIO.write(thumb, "jpg", f);
%>

<h3>원본 이미지</h3>
<img src="<%=fname %>"><p>
<h3>썸네일 이미지</h3>
<img src="sm_<%=fname %>"><p>

</body>
</html>