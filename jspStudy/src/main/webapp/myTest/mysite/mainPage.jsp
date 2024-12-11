<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	request.setAttribute("PAGETITLE", "정보보기");
	request.setAttribute("CONTENTPAGE", "content.jsp");

	RequestDispatcher rd = request.getRequestDispatcher("/mysite/template/template.jsp");
	rd.forward(request,response);
%>	