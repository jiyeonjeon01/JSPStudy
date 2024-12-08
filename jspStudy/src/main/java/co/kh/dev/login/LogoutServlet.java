//package co.kh.dev.login;
//
//import java.io.IOException;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//@WebServlet("/logoutServlet.do")
//public class LogoutServlet extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//
//	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		// 1. 세션값만 있으면 세션값을 해제한다. 없으면 아무것도 할 필요갑 없다.
//		HttpSession session = request.getSession(false);
//		if (session != null) {
//			session.invalidate();
//		}
//		response.sendRedirect("/jspStudy/loginServlet.do");
//	}
//
//	protected void doGet(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		processRequest(request, response);
//	}
//
//	protected void doPost(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		processRequest(request, response);
//	}
//}