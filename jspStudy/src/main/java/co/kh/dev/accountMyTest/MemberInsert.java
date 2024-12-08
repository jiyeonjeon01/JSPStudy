package co.kh.dev.accountMyTest;

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

import co.kh.dev.common.DBUtility;

//@WebServlet(name = "memberInsert", urlPatterns = { "/memberInsert.do" })
public class MemberInsert extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public MemberInsert() {
        super();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // 1. 값을 읽어온다
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        String uid = request.getParameter("id");
        String pwd = request.getParameter("pwd");

        // 2. 데이타베이스처리한다
        String MEMBER_INSERT = "INSERT INTO ACCOUNT VALUES((select NVL(max(no),0)+1 from ACCOUNT),?,?,?,SYSDATE)";
        // 2. 테이블에 저장한다.(프로토콜)
        Connection con = null;
        boolean flag = false;
        PreparedStatement pstmt = null; // 오라클에서 작업할 쿼리문 사용할게 하는 명령문
        try {
            con = DBUtility.dbCon();
            pstmt = con.prepareStatement(MEMBER_INSERT);
            pstmt.setString(1, name);
            pstmt.setString(2, uid);
            pstmt.setString(3, pwd);
            int count = pstmt.executeUpdate();
            flag = (count != 0) ? true : false;
        } catch (SQLException e) {
            System.out.println(e.toString());
        } finally {
            DBUtility.dbClose(con, pstmt);
        } // finally

        // 3. 출력한다.
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        if (flag) {
            System.out.println("입력성공");
            out.println("<html>");
            out.println("<head>");
            out.println("<meta charset=\"UTF-8\">");
            out.println("<title>Insert title here</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1 align= 'center'>회원가입이 완료되었습니다.</h1>");
            out.println("<table align='center' width='300' border='1'>");
            out.println("<tr>");
            out.println("<td align=\"center\">");
            out.println("이름 = " + name);
            out.println("</td>");
            out.println("</tr>");
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
            out.println("<a href='/jspStudy/loginServlet.do'><input type=\"button\" value=\"로그인\"></a>");
            out.println("</td>");
            out.println("</tr>");
            out.println("</table>");
            out.println("</body>");
            out.println("</html>");

        } else {
            System.out.println("입력실패");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        processRequest(request, response);
    }
}
