<%@page import="java.io.IOException"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="org.apache.commons.fileupload.FileUpload"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
//1. 사용자가 전송할 때 form에 enctype="multipart/form-data" 확인
if (FileUpload.isMultipartContent(request)) {
	// 2. 임시 파일 저장 디렉토리 설정
	String temporaryDir = "C:\\Temp";
	/// upload 파일 위치를알려준다 
		String filepath = application.getRealPath("/upload"); 

	// 디렉토리 생성 (경로가 없을 경우 대비)
	File uploadPath = new File(filepath);
	if (!uploadPath.exists()) {
		uploadPath.mkdirs(); // 디렉토리 생성
	}
	
	// 3. DiskFileUpload 객체 생성
	// 3. MultipartRequest(request, 위치, 사이즈, encode, 이름 정책 ) 객체가 같은 기능 
	DiskFileUpload fileUpload = new DiskFileUpload();
	// 3. 1) 위치 
	fileUpload.setRepositoryPath(temporaryDir);
	// 3. 2)최대 10메가까지 업로드 가능 
	fileUpload.setSizeMax(10 * 1024 * 1024); // 10MB 제한
	// 3. 3) 내부 메모리에 들어올 사이즈 결정, 한번에 100K 까지는 메모리에 저장.
	fileUpload.setSizeThreshold(1024 * 100);
	/* 4. Enumeration files = multiRequest.getFileNames(); FileItem의 리스트 */
	// 4. (String) files.nextElement(); 와 비슷함 
	java.util.List fileItemList = fileUpload.parseRequest(request);
	for (int i = 0; i < fileItemList.size(); i++) {
		// 4. 1) 해당된느 파일정보 
		FileItem fileItem = (FileItem) fileItemList.get(i);
		// 4. 2) 폼 파라미터 보내온 <input type="file"> 아닌것만 찾음 
		if (fileItem.isFormField()) {// 파일 이외의 파라미터
			out.println("폼 파라미터:");
			out.println(fileItem.getFieldName() + " = " + fileItem.getString("UTF-8") + "<br>");
		} else { // <input type="file" > 파일인 경우
			out.println("파일:");
			out.println(
			fileItem.getFieldName() + " = " + fileItem.getString() + "(" + fileItem.getSize() + "bytes) <br>");
				// 메모리에 저장되어 있는 파일, 디스크에 저장되어 있는 파일 
				if (fileItem.isInMemory()) {
					out.println("메모리에 저장 <br>");
				} else {
					out.println("디스크에 저장 <br>");
				}
				
				// 업로드한 파일이 사이즈가 있는(존재하는) 것인가 ? 
				if (fileItem.getSize() > 0) {
					// C:\\Temp\\asd\\orange.png  \\없으먄 위치는 -1
					int idx = fileItem.getName().lastIndexOf("\\");
					if (idx == -1) {
						// C:/Temp/asd/orange.png  \\없으먄 위치는 -1
						idx = fileItem.getName().lastIndexOf("/");
					}
					// 썰어. orange.png
					String fileName = fileItem.getName().substring(idx + 1);
					try {
						// filepath String filepath = application.getRealPath("upload");
						// new file(upload/orange.png);
						File uploadedFile = new File(filepath, fileName);
						// C://Temp/orange.png -> /jspStudy/upload/orange.png
						fileItem.write(uploadedFile);
						
						// 이미지 파일일 경우 출력
						if (fileName.toLowerCase().endsWith(".png") || 
							fileName.toLowerCase().endsWith(".jpg") || 
							fileName.toLowerCase().endsWith(".jpeg") || 
							fileName.toLowerCase().endsWith(".gif")) {

							out.println("<img src='upload/" + fileName + "' alt='업로드된 이미지' style='max-width:300px;'><br>");
						}
						
						
					} catch (IOException ex) {
						// 예외 처리
					}

	
	} // 업로드한 파일이 존재하는 경우
		} // 파일인 경우
	} //end of for
} else { //1.사용자가 전송할때 form에 enctype="multipart/form-data"
	out.println("인코딩 타입이 multipart/form-data가 아님.");
}
%>