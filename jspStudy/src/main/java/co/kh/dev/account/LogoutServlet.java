package co.kh.dev.account;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logoutServlet.do")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response) {
		//1. 사용자정보가져온다(세션에서 가져온다), 2. 데이타베이스 , 3. 화면을 설계한다.(페이지이동 Redirect, forward)
		//1.1 request.getSession(false) 세션값이 없으면 null 리턴한다.
		try {
			HttpSession session = request.getSession(false);
			if (session != null) {
				session.invalidate();
			}
			response.sendRedirect("loginServlet.do");
		} catch (IOException e) {
			//에러메세지를 보고 처리하면된다.
			e.printStackTrace();
		} finally {
			
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
		processRequest(request, response);
	}

}
