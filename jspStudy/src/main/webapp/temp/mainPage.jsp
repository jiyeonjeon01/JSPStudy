<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	request.setAttribute("PAGETITLE", "지연이의 웹사이트");
	request.setAttribute("CONTENTPAGE", "info_view.jsp");

	RequestDispatcher rd = request.getRequestDispatcher("/temp/template/template.jsp");
	rd.forward(request,response);
%>	