<%@page import="co.kh.dev.signup.model.SignupVO"%>
<%@page import="co.kh.dev.signup.model.SignupDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*, java.util.*"%>
<%@ page import="java.io.FileReader"%>
<%@ page import="java.io.IOException"%>
<!-- request, response, servletContext: Application, Session  -->
<!-- 1.사용자정보를 가져온다  -->
<%
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
String pwdTest = request.getParameter("pwdtest");
String email = request.getParameter("email");
String name = request.getParameter("name");
int birth = Integer.parseInt(request.getParameter("birth"));
String message = "";
boolean isSuccess = false;
boolean returnFlag = false; 

if (id != null && pwd != null && email != null && name != null && pwdTest != null) {
	if (!pwd.equals(pwdTest)) {
		message = "비밀번호와 비밀번호 확인이 일치하지 않습니다.";
		returnFlag = false; 
	} else {
		/*2.curd*/
		SignupDAO sdao = new SignupDAO(); 
		SignupVO svo = new SignupVO(id, pwd, email, name ,birth);
		returnFlag = sdao.insertDB(svo);
		message = (returnFlag == false)? "회원가입이 실패되었습니다." :"회원가입이 성공되었습니다."; 
	}
}
%>
<!-- 2.curd  -->
<!-- 3.화면설계(자바코드에 해야되는데 - > jsp service함수에서 진행한다. -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인</title>
<link rel="stylesheet" href="../css/login.css">
</head>
<body>
<%
	if(returnFlag == true){
%>
		<h1 align= 'center'><%= message %></h1><br>
		<a href='login.jsp'><input type= button value="로그인"></a>
<%
	}else{
%>
		<h1 align= 'center' style="color: red;"> <%= message %></h1><br>
		<a href='signup.jsp'><input type= button value="회원가입"></a>
<%
	}
%>
</body>
</html>
