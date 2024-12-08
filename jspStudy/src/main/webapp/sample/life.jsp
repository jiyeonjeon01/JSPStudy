<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
// 멤버변수, 멤버함수, 오버라이딩
private int globalNumber = 0;
// 멤버함수 
public int getGlobalNumber(){
	return this.globalNumber;
}
// 오버라이딩 함수
public void jspInit(){
	System.out.println("jspInit() 오버라이딩된 함수 호출됨");
}
public void jspDestroy(){
	System.out.println("jspDestroy() 오버라이딩된 함수 호출됨");
}
%>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//자바코드실행문(제어문, 반복문): 서비스 함수에서 작동된다.
	// 지역변수
	int localNumber = 0;
	// 서비스 실행할때마다. 매번 클라이언트 요청할때마다
	localNumber++;
	this.globalNumber++;
%>
	<ul>
		<li>globalNumber = <%= this.getGlobalNumber() %></li>
		<li>localNumber = <%= localNumber %> </li>
	
	</ul>


</body>
</html>