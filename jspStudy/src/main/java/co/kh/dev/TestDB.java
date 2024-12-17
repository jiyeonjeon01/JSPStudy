package co.kh.dev;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.kh.dev.common.DBUtility;

@WebServlet("/testDB.do")
public class TestDB extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public TestDB() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con = null; 
		con = DBUtility.dbCon();
		
		if(con != null) {
			System.out.println("데이타베이스 연결성공");
		}else {
			System.out.println("데이타베이스 연결성공");
		}
	}

}
