package co.kr.dev.common;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class DBUtility {

	public static Connection dbCon() {
	    Properties properties = new Properties();
	    Connection con = null;

	    try {
	        // Load DB properties
	        properties.load(new FileReader("C:\\dev\\eclipseWorkspace\\jspStudy\\src\\main\\java\\co\\kh\\dev\\common\\db.properties"));
	        String url = properties.getProperty("url");
	        String id = properties.getProperty("id");
	        String pw = properties.getProperty("pw");

	        // Load JDBC driver and establish connection
	        Class.forName("oracle.jdbc.driver.OracleDriver");
	        con = DriverManager.getConnection(url, id, pw);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return con;
	}


	
	
	public static void dbClose(Connection con, ResultSet rs, Statement... stmts) {
		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				System.out.println(e.toString());
			}
		}
		for (Statement data : stmts) {
			if (data != null) {
				try {
					data.close();
				} catch (SQLException e) {
					System.out.println(e.toString());
				}
			}
		}

		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				System.out.println(e.toString());
			}
		}
	}

	public static void dbClose(Connection con, Statement... stmts) {
		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				System.out.println(e.toString());
			}
		}
		for (Statement data : stmts) {
			if (data != null) {
				try {
					data.close();
				} catch (SQLException e) {
					System.out.println(e.toString());
				}
			}
		}

	}

	public static void dbClose(Connection con, PreparedStatement pstmt, ResultSet rs) {
		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				System.out.println(e.toString());
			}
		}
			if ( pstmt != null) {
				try {
					 pstmt.close();
				} catch (SQLException e) {
					System.out.println(e.toString());
				}
			}

		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				System.out.println(e.toString());
			}
		}
	}

	public static void dbClose(Connection con, Statement stmt, ResultSet rs) {
		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				System.out.println(e.toString());
			}
		}
			if ( stmt != null) {
				try {
					 stmt.close();
				} catch (SQLException e) {
					System.out.println(e.toString());
				}
			}

		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				System.out.println(e.toString());
			}
		}
		
		
	}
}
