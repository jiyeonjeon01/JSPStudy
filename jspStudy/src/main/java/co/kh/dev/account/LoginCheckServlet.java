package co.kh.dev.account;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import co.kh.dev.account.model.AccountDAO;
import co.kh.dev.account.model.AccountVO;


@WebServlet("/loginCheckServlet.do")
public class LoginCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginCheckServlet() {
		super();
	}

	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 1. 사용자정보를 얻는다
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		//2. curd
		AccountDAO ad = new AccountDAO(); 
		AccountVO avo = new AccountVO(null, id, pwd); 
		AccountVO ravo = ad.selectLoginCheckDB(avo); 
		if(ravo == null ) {
			//아이디와 패스워드가 잘못된경우이다.
		}else {
			HttpSession session = request.getSession();
			session.setAttribute("id", ravo.getId());
			session.setAttribute("pwd", ravo.getPwd());
			session.setAttribute("name", ravo.getName());
		}
		//3.화면처리
		response.sendRedirect("loginServlet.do");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		processRequest(request, response);
	}

}
