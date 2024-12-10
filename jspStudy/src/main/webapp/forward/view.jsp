<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 1. 사용자 정보를 가져온다. -->
<!-- 2. crud -->
<!-- 3. 화면설계(자바코드에 해야되는데.. -> jsp service함수에서 진행한다.) -->    
<%
		request.setCharacterEncoding("UTF-8");
    String code = request.getParameter("code");
    String viewPageURI = null;    
    
   if (code.equals("A")) {
        viewPageURI = "viewModule/a.jsp";
    } else if (code.equals("B")) {
        viewPageURI = "viewModule/b.jsp";
    } else if (code.equals("C")) {
        viewPageURI = "viewModule/c.jsp";
    }
   
   // 방법1
   RequestDispatcher rd = request.getRequestDispatcher(viewPageURI);
   rd.forward(request, response);
   
 %>
<!-- 방법2  --> 
 <%-- <jsp:forward page="<%= viewPageURI %>" /> --%>