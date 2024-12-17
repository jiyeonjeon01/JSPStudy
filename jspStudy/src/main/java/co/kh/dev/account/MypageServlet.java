package co.kh.dev.account;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet({ "/myPageServlet.do" })
public class MypageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    private void processRequest(HttpServletRequest request, HttpServletResponse response) {
    	//1. 사용자정보가져온다. 
    	HttpSession session = request.getSession(false);
    	if(session == null) {
    		//세션이  등록이 되지 않아서 보여줄 정보가 없습니다. (페이지 이동)
    	}else {
    		String name = (String) session.getAttribute("name");
        	String id = (String) session.getAttribute("id");
        	String pwd = (String) session.getAttribute("pwd");
        	//2.curd 
        	//3.화면출력
        	PrintWriter out = null;
        	response.setContentType("text/html; charSet=UTF-8");
    		try {
    			out = response.getWriter();
    			out.println("<h1 align=\"center\">마이페이지</h1>");
    			out.println("<table align=\"center\" width=\"300\" border=\"1\">");
    			out.println("<tr>");
    			out.println("<td align=\"center\">");
    			out.println("이름 = "+ name);
    			out.println("</td>");
    			out.println("</tr>");
    			out.println("<tr>");
    			out.println("<tr>");
    			out.println("<td align=\"center\">");
    			out.println("id = "+ id);
    			out.println("</td>");
    			out.println("</tr>");
    			out.println("<tr>");
    			out.println("<td align=\"center\">");
    			out.println("비밀번호 = "+ pwd);
    			out.println("</td>");
    			out.println("</tr>");
    			out.println("<tr>");
    			out.println("<td align=\"center\">");
    			out.println("<a href='loginServlet.do'><input type=\"button\" value=\"로그인으로가기\"></a>");
    			out.println("</td>");
    			out.println("</tr>");
    			out.println("</table>");	
    		} catch (IOException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		}
    	}
    	
   
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) {
		processRequest(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
		processRequest(request, response);
	}

}
