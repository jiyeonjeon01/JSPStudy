package co.kh.dev.accountMyTest;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.kh.dev.common.DBUtility;

//@WebServlet("/memberListServlet.do")
public class MemberListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html; charset=UTF-8");

        final String SELECT_SQL = "SELECT NO, ID, PASS FROM LOGIN";

        try (Connection con = DBUtility.dbCon();
             PreparedStatement pstmt = con.prepareStatement(SELECT_SQL);
             ResultSet rs = pstmt.executeQuery();
             PrintWriter out = response.getWriter()) {

            out.println("<h1 align=\"center\">회원정보 리스트</h1>");
            out.println("<table align=\"center\" width=\"600\" border=\"1\">");
            out.println("<tr><th>번호</th><th>아이디</th><th>비밀번호</th></tr>");

            while (rs.next()) {
                int no = rs.getInt("NO");
                String id = rs.getString("ID");
                String pass = rs.getString("PASS");

                out.println("<tr>");
                out.println("<td align='center'>" + no + "</td>");
                out.println("<td align='center'>" + id + "</td>");
                out.println("<td align='center'>" + pass + "</td>");
                out.println("</tr>");
            }

            out.println("</table>");
            out.println("<div align=\"center\"><a href='/jspStudy/mypageServlet.do'><input type='button' value='뒤로가기'></a></div>");

        } catch (SQLException | IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        processRequest(request, response);
    }
}



