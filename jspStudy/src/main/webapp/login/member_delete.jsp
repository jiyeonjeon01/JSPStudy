<%@ page contentType="text/html; charset=UTF-8"	%>
<%@ page import="co.kh.dev.login.model.LoginDAO"%>
<%@ page import="co.kh.dev.login.model.LoginVO"%>
<!-- 1.사용자정보를 가져온다  -->
<!-- 2.curd  -->
<%
boolean successFlag = false;
String message = ""; 
if (session != null) {
	String id = (String) session.getAttribute("id");
	LoginDAO ldao = new LoginDAO();
	LoginVO lvo = new LoginVO(id);
	successFlag = ldao.deleteLogin(lvo);
	// 탈퇴 성공
	if (successFlag) {
		session.invalidate(); // 세션 무효화
		message ="회원탈퇴 성공하셨습니다.";
	}else{
		message ="회원탈퇴 실패하셨습니다.";
	}
}else{
		message ="세션이 존재하지 않습니다. 다시로그인 해주세요.";
}
%>
<!-- 3.화면설계(자바코드에 해야되는데 - > jsp service함수에서 진행한다. -->
	<script>
		alert(' <%= message %>');
		window.location.href = 'login_main.jsp'; 
	</script>
