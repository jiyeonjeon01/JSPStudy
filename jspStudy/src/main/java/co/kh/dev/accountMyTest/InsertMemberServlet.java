package co.kh.dev.accountMyTest;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.kh.dev.common.DBUtility;


//@WebServlet("/insertMember")
public class InsertMemberServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html; charset=UTF-8");

        String id = request.getParameter("id");
        String pass = request.getParameter("pass");

        final String INSERT_SQL = "INSERT INTO LOGIN (NO, ID, PASS) VALUES (NO_SEQ.NEXTVAL, ?, ?)";
        boolean isInserted = false;

        try (Connection con = DBUtility.dbCon();
             PreparedStatement pstmt = con.prepareStatement(INSERT_SQL)) {

            pstmt.setString(1, id);
            pstmt.setString(2, pass);

            int rows = pstmt.executeUpdate();
            isInserted = rows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        try (PrintWriter out = response.getWriter()) {
            if (isInserted) {
                out.println("<h1>회원가입 성공!</h1>");
            } else {
                out.println("<h1>회원가입 실패!</h1>");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        processRequest(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        processRequest(request, response);
    }
}

