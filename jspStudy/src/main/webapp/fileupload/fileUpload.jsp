<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%
request.setCharacterEncoding("UTF-8");
// String uploadPath = request.getSession().getServletContext().getRealPath("/upload");
// 1. 서버에서 업로드 진행해야 할 순서 (업ㄷ로드 경로를 적는다 )
String uploadPath = request.getRealPath("upload"); // upload경로
// 2. 업로드할 최대 사이즈를 설정한다 
int size = 10 * 1024 * 1024;
String name = "";
String subject = "";
String filename1 = "";
String filename2 = "";
String origfilename1 = "";
String origfilename2 = "";
try {
	// 3.MultiPartRequest 객체 생성을하고 매개변수 (request, 업로드 위치, 최대사이즈, encoding, 이름 재정의 정책)
	MultipartRequest multiRequest = new MultipartRequest(request, uploadPath, size, "utf-8",
	new DefaultFileRenamePolicy());
	name = multiRequest.getParameter("name");
	subject = multiRequest.getParameter("subject");
	// 4. Enumeration files = multiRequest.getFileNames();
	Enumeration files = multiRequest.getFileNames();
	String file1 = (String) files.nextElement(); // String file1= fileName2
	// 5. 업로드된 서버에서 저장된 이름 가져온다 (테이블 저장되어야 됨 )
	filename1 = multiRequest.getFilesystemName(file1); // 서버에서 저장된 이름(DefaultFileRenamePolicy()) 이름+번호 증가시킴 
	// 6.업로드된 사용자가 사용한 진짜이름을 가져온다 (테이블 저장되어야 됨 )
	origfilename1 = multiRequest.getOriginalFileName(file1); // orange.png(사용자가 작명 이름 )

	String file2 = (String) files.nextElement(); // String file2= fileName1
	filename2 = multiRequest.getFilesystemName(file2);
	origfilename2 = multiRequest.getOriginalFileName(file2);

	System.out.println(file1);
	System.out.println(file2);
	System.out.println(uploadPath);
} catch (Exception e) {
	e.printStackTrace();
}
%>
<!DOCTYPE html>
<html>
<body>
	<form name="filecheck" action="fileCheck.jsp" method="post">
		<input type="hidden" name="name" value="<%=name%>"> <input
			type="hidden" name="subject" value="<%=subject%>"> <input
			type="hidden" name="filename1" value="<%=filename1%>"> <input
			type="hidden" name="filename2" value="<%=filename2%>"> <input
			type="hidden" name="origfilename1" value="<%=origfilename1%>">
		<input type="hidden" name="origfilename2" value="<%=origfilename2%>">
	</form>
	<a href="#" onclick="javascript:filecheck.submit()"> 업로드 확인 및 다운로드
		페이지 이동</a>
</body>
</html>