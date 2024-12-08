package co.kh.dev;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


//@WebServlet(
//		name = "hello.do", 
//		urlPatterns = { "/hello.do" }, 
//		initParams = { 
//				@WebInitParam(name = "phone", value = "010-1234-5678", description = "전화번호"), 
//				@WebInitParam(name = "id", value = "id1234", description = "아이디")
//		})
public class Hello extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private String phone;
    private String id;

    public Hello() {
        super();
        this.phone = null;
        this.id = null;
    }
    
    @Override
    public void init() throws ServletException {
    	ServletConfig sc = getServletConfig();
    	phone = sc.getInitParameter("phone");
    	id = sc.getInitParameter("id");
    	
    	System.out.println("init() phone =" + phone);
    	System.out.println("init() id =" + id);

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8"); 
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Date date = new Date();
        out.println("<html>");
        out.println("<body>");
        out.println("<h1>My First Servlet Program jy </h1>");
        out.println("<br>");
        out.println(date.toString());
        out.println("<br>");
        out.println("<li>전화번호 : " + phone + "</li>");
        out.println("<li>아이디 : " + id + "</li>");
        out.println("</body>");
        out.println("</html>");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	

}