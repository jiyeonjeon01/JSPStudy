package co.kh.dev.account;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.kh.dev.account.model.AccountDAO;
import co.kh.dev.account.model.AccountVO;
import co.kh.dev.common.DBUtility;

@WebServlet("/memberUpdateSurvlet.do")
public class MemberUpdateSurvlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("memberUpdateSurvlet.do start");
		// 객체참조변수 선언
		Connection con = null;
		PreparedStatement pstmt = null;
		// 1. 사용자정보를 가져온다, 3 화면에 보여준다.
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		// 자신의 정보와 체크하기 위함이다.
		HttpSession session = request.getSession(false);
		try {
			if (session == null) {
				// 로그인을 하지않고 불법적으로 수정페이지롤 들어온것이기 때문에 경고창준다.
				System.out.println("세션값이 없습니다.");
				response.sendRedirect("myPageServlet.do");
			} else {
				// 2. curd
				System.out.println("세션값이 있습니다.");
				String sid = (String) session.getAttribute("id");
				if (!(sid.equals(id))) {
					System.out.println("세션 아디값이 일치하지 않습니다.");
					response.sendRedirect("myPageServlet.do");
				} else {
					// 2. 데이타베이스처리한다
					AccountDAO ad = new AccountDAO(); 
					AccountVO avo = new AccountVO(name, id, pwd);
					boolean returnFlag = ad.updateDB(avo); 
					if ( returnFlag == true) {
						session.setAttribute("pwd", pwd);
						session.setAttribute("name", name);
						response.sendRedirect("myPageServlet.do");
					}else {
						System.out.println("입력실패");
						PrintWriter out = null;
						response.setContentType("text/html;charSet=UTF-8");
						out = response.getWriter();
						out.println("<html>");
						out.println("<head>");
						out.println("<meta charset='UTF-8'>");
						out.println("<title>Insert title here</title>");
						out.println("</head>"); 
						out.println("<body>");
						out.println("<h1 align= 'center'>회원수정이 실패되었습니다.</h1>");
						out.println("<table align='center' width='300' border='1'>");
						out.println("<tr>");
						out.println("<td align=\"center\">");
						out.println("<a href='/jspStudy/loginServlet.do'><input type=\"button\" value=\"로그인\"></a>");
						out.println("</td>");
						out.println("</tr>");
						out.println("</table>");
						out.println("</body>");
						out.println("</html>");
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtility.dbClose(con, pstmt);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		processRequest(request, response);
	}
}
