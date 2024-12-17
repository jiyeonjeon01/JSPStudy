package co.kh.dev.account;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.kh.dev.account.model.AccountDAO;
import co.kh.dev.account.model.AccountVO;
import co.kh.dev.common.DBUtility;

@WebServlet("/memberInsert.do")
public class MemberInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MemberInsert() {
		super();
	}
	
	//3가지 방식 1. 사용자요청데이타를 읽어온다. 2.curd  3.화면을 설계한다.
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 1. 값을 읽어온다
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = null;
		
		try {
			String name = request.getParameter("name");
			String uid = request.getParameter("id");
			String pwd = request.getParameter("pwd");

			// 2. 데이타베이스처리한다
			AccountDAO ad = new AccountDAO(); 
			AccountVO avo = new AccountVO(name, uid, pwd);
			boolean returnFlag = ad.insertDB(avo);
			
			// 3. 출력한다.
			response.setContentType("text/html;charSet=UTF-8");
			out = response.getWriter();
			if (returnFlag) {
				System.out.println("입력성공");
				out.println("<html>");
				out.println("<head>");
				out.println("<meta charset='UTF-8'>");
				out.println("<title>Insert title here</title>");
				out.println("</head>"); 
				out.println("<body>");
				out.println("<h1 align= 'center'>회원가입이 완료되었습니다.</h1>");
				out.println("<table align='center' width='300' border='1'>");
				out.println("<tr>");
				out.println("<td align='center'>");
				out.println("이름 = " + name);
				out.println("</td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<tr>");
				out.println("<td align=\"center\">");
				out.println("id = " + uid);
				out.println("</td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<td align=\"center\">");
				out.println("비밀번호 = " + pwd);
				out.println("</td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<td align=\"center\">");
				out.println("<a href='loginServlet.do'><input type=\"button\" value=\"로그인\"></a>");
				out.println("</td>");
				out.println("</tr>");
				out.println("</table>");
				out.println("</body>");
				out.println("</html>");

			} else {
				System.out.println("입력실패");
				out.println("<html>");
				out.println("<head>");
				out.println("<meta charset='UTF-8'>");
				out.println("<title>Insert title here</title>");
				out.println("</head>"); 
				out.println("<body>");
				out.println("<h1 align= 'center'>회원가입이 실패되었습니다.</h1>");
				out.println("<table align='center' width='300' border='1'>");
				out.println("<tr>");
				out.println("<td align=\"center\">");
				out.println("<a href='/jspStudy/member/member.html'><input type=\"button\" value=\"회원가입\"></a>");
				out.println("</td>");
				out.println("</tr>");
				out.println("</table>");
				out.println("</body>");
				out.println("</html>");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(out != null) {
				out.close();
			}
		}
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		processRequest(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		processRequest(request, response);
	}

}
