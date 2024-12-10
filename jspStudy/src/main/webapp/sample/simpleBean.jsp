<%@page import="co.kh.dev.SimpleVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  1. 사용자 정보를 가져온다 -->    
<%
  request.setCharacterEncoding("UTF-8");
/* 	String message1 = request.getParameter("message1");
	String message2 = request.getParameter("message2");
	SimpleVO simpleVO = new SimpleVO(message1, message1); */
 %>
<%--  <jsp:useBean id="msg" class="co.kh.dev.SimpleVO"/>
 SimpleData msg = new SimpleData();
 <jsp:setProperty name="msg" property="message"/>
 msg.setMessage(?); --%>
 <!-- 주의점 : 기본자료형, String -->
 
 <!--  위의 모든 주석이 아래부분고 ㅏ같음 -->
 <jsp:useBean id="simpleVO" class="co.kh.dev.SimpleVO" />
 <jsp:setProperty name="simpleVO" property ="*" />
 <!--  2. curd -->
 <!--  3. 화면 설계  -->
 <html>
 <body>
 <h1>간단한 빈즈 프로그램 결과</h1>
 <hr color="red"></hr>
 <br></br>
 <h3>메세지1: <%= simpleVO.getMessage1() %></h3>
 <h3>메세지2: <%= simpleVO.getMessage2() %></h3>
 </body>
 </html>