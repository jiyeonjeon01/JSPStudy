<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 1.사용자정보를 가져온다  -->
<!-- 2.curd  -->
<!-- 3.화면설계(자바코드에 해야되는데 - > jsp service함수에서 진행한다.  redirect, forward-->
<% 
	request.setAttribute("PAGETITLE","정보보기"); 
	request.setAttribute("CONTENTPAGE","info_view.jsp"); 

	RequestDispatcher rd = request.getRequestDispatcher("/temp/template/template.jsp");
	rd.forward(request, response); 
%>

<%-- <jsp:forward page="/temp/template/template.jsp">
    <jsp:param name="CONTENTPAGE" value="info_view.jsp" />
</jsp:forward> --%>