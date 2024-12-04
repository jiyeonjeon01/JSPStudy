package co.kh.dev;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


//@WebServlet(name = "myFirstServlet", urlPatterns = { "/myFirstServlet" })
@WebServlet("/myFirstServlet")
public class MyFirstServlet extends HttpServlet {
	// serializable 인데 지금은 필요 없음 
	private static final long serialVersionUID = 1L;
       
	// 디폴트 생성자
    public MyFirstServlet() {
        super();
        System.out.println("처음으로 한번만 초기화");
    }

    // 서블릿컨테이너가 만든 request와 response 
    // 3가지 정보(start line, message header, message body)를 갖고 만든게 requset
    // ex. header 정보를 보고싶으면 request 를 뜯어보면 도미 
    // response - 보내는것 (outputstream, writer, 으로 보내줌 (?)
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println("service running");
		doGet(request, response);
//		requestTest(request, response);
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("doGet running");
		// 1. request로 사용자 요청 정보를 받아야 함(원래는 받아야함 )
		// 2.데이터베이스 연동 curd 진행한다. 
		
		// 3-1. 서버에서 클라이언트 문자를 보내기 위한 문자셋을 진행한다.
		response.setCharacterEncoding("UTF-8");
		
		// 3-2. 브라우저에게 (text/html;charset=UTF-8)
		response.setContentType("text/html;charset=UTF-8");
		
		// 3-3. 출력 스트림 결정한다. (1byte, 2byte)
		PrintWriter out = response.getWriter();
		Date date = new Date(); // sql util이 디폴트 생성자가 잇음 
        out.println("<html>");
        out.println("<body>");
        out.println("<h1>My First Servlet Program !</h1>");
        out.println("<br>");
        out.println(date.toString()); 
        // out.println(new Date()); 랑 같음 
        // out.println(new java.util.Date())); 랑 같음 
        out.println("</body>");
        out.println("</html>");
		
	}

	protected void requestTest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet running");
		// 1. request로 사용자 요청 정보를 받아야 함(원래는 받아야함 )
		// 2.데이터베이스 연동 curd 진행한다. 
		
		// 3-1. 서버에서 클라이언트 문자를 보내기 위한 문자셋을 진행한다.
		response.setCharacterEncoding("UTF-8");
		
		// 3-2. 브라우저에게 (text/html;charset=UTF-8)
		response.setContentType("text/html;charset=UTF-8");
		
		// 3-3. 출력 스트림 결정한다. (1byte, 2byte)
		PrintWriter out = response.getWriter();
		Date date = new Date(); // sql util이 디폴트 생성자가 잇음 
        out.println("<html>");
        out.println("<body>");
        out.println("<h1>My First Servlet Program !</h1>");
        out.println("<br>");
        out.println(date.toString()); 
        // out.println(new Date()); 랑 같음 
        // out.println(new java.util.Date())); 랑 같음 
        out.println("</body>");
        out.println("</html>");
		
	}

}
