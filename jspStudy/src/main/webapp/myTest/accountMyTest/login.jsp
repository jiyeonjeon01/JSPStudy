<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="co.kh.dev.common.DBUtility" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<%
    String action = request.getParameter("action");

    if ("login".equals(action)) {
%>
    <h1 align="center">로그인</h1>
    <form method="post" action="index.jsp?action=loginSubmit">
        <table align="center" width="300" border="1">
            <tr>
                <th>아이디</th>
                <td><input type="text" name="id" required></td>
            </tr>
            <tr>
                <th>비밀번호</th>
                <td><input type="password" name="pwd" required></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="로그인">
                </td>
            </tr>
        </table>
    </form>
<%
    } else if ("loginSubmit".equals(action)) {
        String id = request.getParameter("id");
        String pwd = request.getParameter("pwd");

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean isValidUser = false;
        String name = null;

        try {
            con = DBUtility.dbCon();
            String sql = "SELECT NAME FROM ACCOUNT WHERE ID = ? AND PWD = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, pwd);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                isValidUser = true;
                name = rs.getString("NAME");
            }
        } catch (SQLException e) {
            out.println("<h3>SQL Error: " + e.getMessage() + "</h3>");
        } finally {
            DBUtility.dbClose(con, pstmt, rs);
        }

        if (isValidUser) {
%>
    <h1 align="center"><%= name %>님, 환영합니다!</h1>
    <p align="center">
        <a href="index.jsp?action=mypage"><input type="button" value="마이페이지"></a>
        <a href="index.jsp?action=logout"><input type="button" value="로그아웃"></a>
    </p>
<%
        } else {
%>
    <h1 align="center">로그인 실패</h1>
    <p align="center">
        <a href="index.jsp?action=login"><input type="button" value="다시 시도"></a>
    </p>
<%
        }
    }
%>
</body>
</html>
