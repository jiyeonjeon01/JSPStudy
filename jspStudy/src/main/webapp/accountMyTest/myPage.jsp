<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="co.kh.dev.common.DBUtility" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
<%
    String action = request.getParameter("action");

    if ("mypage".equals(action)) {
        String id = request.getParameter("id");
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String name = null;
        String pwd = null;

        try {
            con = DBUtility.dbCon();
            String sql = "SELECT NAME, PWD FROM ACCOUNT WHERE ID = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                name = rs.getString("NAME");
                pwd = rs.getString("PWD");
            }
        } catch (SQLException e) {
            out.println("<h3>SQL Error: " + e.getMessage() + "</h3>");
        } finally {
            DBUtility.dbClose(con, pstmt, rs);
        }

        if (name != null) {
%>
    <h1 align="center">마이페이지</h1>
    <table align="center" border="1">
        <tr>
            <th>이름</th>
            <td><%= name %></td>
        </tr>
        <tr>
            <th>아이디</th>
            <td><%= id %></td>
        </tr>
        <tr>
            <th>비밀번호</th>
            <td><%= pwd %></td>
        </tr>
    </table>
    <p align="center">
        <a href="index.jsp?action=logout"><input type="button" value="로그아웃"></a>
    </p>
<%
        } else {
%>
    <h1 align="center">사용자 정보를 찾을 수 없습니다.</h1>
<%
        }
    }
%>
</body>
</html>
