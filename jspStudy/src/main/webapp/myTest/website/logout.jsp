<%@ page contentType="text/html; charset=UTF-8"%>
<!--  session="false" 서블릿에서 Session 객체를 가져오지 않는다.-->
<%@ page session="false"%>
<%
// 세션 객체를 새로 가져와야 된다. 
HttpSession session = request.getSession(false);

// 세션이 존재하면 세션을 무효화합니다.
if (session != null) {
	session.invalidate();
}
// 로그인 페이지로 리다이렉트
response.sendRedirect("login_main.jsp");
%>