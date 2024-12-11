<%@page import="java.util.Map"%>
<%@page import="java.util.Enumeration"%>
<%@ page  contentType="text/html; charset=UTF-8" %>
<!-- 1.사용자정보를 가져온다  -->
<%
request.setCharacterEncoding("utf-8");
String name = request.getParameter("name");
String address = request.getParameter("address");
//checkbox 에서 체크한것만 가져온다. 4개에서 2개를 체크한다. String[] 사이즈는 2개다. 
String[] values = request.getParameterValues("pet");

System.out.println("name="+name); 
System.out.println("name="+address);
for(int i=0;i<values.length;i++){
	System.out.println("values["+i+"]="+values[i]);
}
//====================================================


Enumeration enumData = request.getParameterNames();
//enum 데이가 존재하니.enumData.hasMoreElements()
while(enumData.hasMoreElements()) {
    String enumName = (String)enumData.nextElement();
    System.out.println("enumName="+enumName); 
}
//====================================================
//키값 value 값으로 분류해서 나누어 버린다. 
Map parameterMap = request.getParameterMap();
String[] nameParam = (String[])parameterMap.get("pet"); 
System.out.println("name="+nameParam[1]);
%>
<!-- 2.curd  -->
<!-- 3.화면설계(자바코드에 해야되는데 - > jsp service함수에서 진행한다. -->

