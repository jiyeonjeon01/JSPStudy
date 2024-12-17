지피티 ver 




<%@ page import="java.io.File" %>
<%@ page import="java.io.IOException" %>
<%@ page import="org.apache.commons.fileupload.FileItem" %>
<%@ page import="org.apache.commons.fileupload.DiskFileUpload" %>
<%@ page import="org.apache.commons.fileupload.FileUpload" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
request.setCharacterEncoding("UTF-8");

// 1. 사용자가 전송할 때 form에 enctype="multipart/form-data" 확인
if (FileUpload.isMultipartContent(request)) {
    // 2. 임시 파일 저장 디렉토리 설정
    String temporaryDir = "C:\\Temp";
    
    String uploadDir = application.getRealPath("/upload"); // 업로드 파일 저장 경로

    // 디렉토리 생성 (경로가 없을 경우 대비)
    File uploadPath = new File(uploadDir);
    if (!uploadPath.exists()) {
        uploadPath.mkdirs(); // 디렉토리 생성
    }

    // 3. DiskFileUpload 객체 생성
    DiskFileUpload fileUpload = new DiskFileUpload();
    
    fileUpload.setRepositoryPath(temporaryDir); // 임시 저장소
    
    fileUpload.setSizeMax(10 * 1024 * 1024); // 최대 업로드 크기: 10MB
    
    fileUpload.setSizeThreshold(1024 * 100); // 100KB까지는 메모리에 저장

    // 4. 파일 업로드 및 폼 필드 처리
    java.util.List fileItemList = fileUpload.parseRequest(request);
    for (int i = 0; i < fileItemList.size(); i++) {
    	
        FileItem fileItem = (FileItem) fileItemList.get(i);

        // 4.1. 폼 필드 처리 (파일이 아닌 파라미터)
        if (fileItem.isFormField()) {
            out.println("폼 파라미터: ");
            out.println(fileItem.getFieldName() + " = " + fileItem.getString("UTF-8") + "<br>");
        } 
        // 4.2. 파일 처리
        else {
            out.println("파일 업로드 정보: ");
            out.println("필드명: " + fileItem.getFieldName() + "<br>");
            out.println("파일명: " + fileItem.getName() + "<br>");
            out.println("파일 크기: " + fileItem.getSize() + " bytes<br>");

            // 업로드된 파일이 존재하는지 확인
            if (fileItem.getSize() > 0) {
                // 파일명에서 경로 제거 (윈도우/리눅스 호환)
                String fileName = new File(fileItem.getName()).getName();

                // 저장할 경로와 파일명 설정
                File uploadedFile = new File(uploadDir, fileName);

                try {
                    // 파일 저장
                    fileItem.write(uploadedFile);
                    out.println("파일 저장 완료: " + uploadedFile.getAbsolutePath() + "<br>");

                    // 업로드된 파일을 브라우저에 표시 (이미지의 경우)
                    if (fileName.toLowerCase().endsWith(".png") || 
                    	    fileName.toLowerCase().endsWith(".jpg") || 
                    	    fileName.toLowerCase().endsWith(".jpeg") || 
                    	    fileName.toLowerCase().endsWith(".gif")) {

                    	    // 웹 경로로 이미지 출력
                    	    out.println("<img src='" + request.getContextPath() + "/upload/" + fileName + 
                    	                "' alt='업로드된 이미지' style='max-width:300px;'><br>");
                    	}

                } catch (Exception e) {
                    out.println("파일 저장 실패: " + e.getMessage() + "<br>");
                }
            }
        }
    }
} else {
    // enctype이 multipart/form-data가 아닌 경우
    out.println("인코딩 타입이 multipart/form-data가 아님.");
}
%>
