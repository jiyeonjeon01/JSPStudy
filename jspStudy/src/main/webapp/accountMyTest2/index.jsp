<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="co.kh.dev.common.DBUtility" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리 시스템</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
%>
<%
    String action = request.getParameter("action");

    if (action == null || "register".equals(action)) {
%>
    <!-- 회원가입 화면 -->
    <h1 align="center">회원가입</h1>
    <form method="post" action="index.jsp?action=registerSubmit">
        <table align="center" width="465" border="1">
            <tr>
                <th>이름</th>
                <td><input type="text" name="name" required></td>
            </tr>
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
                    <input type="submit" value="회원가입">
                </td>
            </tr>
        </table>
    </form>
<%
    } else if ("registerSubmit".equals(action)) {
        // 회원가입 처리
        String name = request.getParameter("name");
        String id = request.getParameter("id");
        String pwd = request.getParameter("pwd");

        Connection con = null;
        PreparedStatement pstmt = null;
        boolean isSuccess = false;

        try {
            con = DBUtility.dbCon();
            String sql = "INSERT INTO ACCOUNT (NO, NAME, ID, PWD, REGDATE) VALUES ((SELECT NVL(MAX(NO), 0) + 1 FROM ACCOUNT), ?, ?, ?, SYSDATE)";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, id);
            pstmt.setString(3, pwd);
            int result = pstmt.executeUpdate();
            isSuccess = (result > 0);
        } catch (SQLException e) {
            out.println("<h3>SQL Error: " + e.getMessage() + "</h3>");
        } finally {
            DBUtility.dbClose(con, pstmt);
        }

        if (isSuccess) {
%>
    <h1 align="center">회원가입이 완료되었습니다!</h1>
    <table align="center" width="300" border="1">
        <tr>
            <td align="center">이름 = <%= name %></td>
        </tr>
        <tr>
            <td align="center">id = <%= id %></td>
        </tr>
        <tr>
            <td align="center">비밀번호 = <%= pwd %></td>
        </tr>
        <tr>
            <td align="center">
                <a href="index.jsp?action=login"><input type="button" value="로그인"></a>
            </td>
        </tr>
    </table>
<%
        } else {
%>
    <h1 align="center">회원가입 실패</h1>
    <p align="center">
        <a href="index.jsp?action=register"><input type="button" value="다시 시도"></a>
    </p>
<%
        }
    } else if ("login".equals(action)) {
%>
    <!-- 로그인 화면 -->
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
        // 로그인 처리
        String id = request.getParameter("id");
        String pwd = request.getParameter("pwd");

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String name = null;

        try {
            con = DBUtility.dbCon();
            String sql = "SELECT NAME FROM ACCOUNT WHERE ID = ? AND PWD = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, pwd);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                name = rs.getString("NAME");
                session.setAttribute("id", id);
                session.setAttribute("name", name);
                session.setAttribute("pwd", pwd);
            }
        } catch (SQLException e) {
            out.println("<h3>SQL Error: " + e.getMessage() + "</h3>");
        } finally {
            DBUtility.dbClose(con, pstmt, rs);
        }

        if (name != null) {
%>
    <h1 align="center"><%= name %> 님 로그인 되었습니다.</h1>
    <table align="center" width="300" border="1">
        <tr>
            <td align="center">
                <a href="index.jsp?action=mypage">회원정보</a>
                &nbsp;&nbsp;
                <a href="index.jsp?action=logout">로그아웃</a>
            </td>
        </tr>
    </table>
<%
        } else {
%>
    <h1 align="center">로그인 실패</h1>
    <p align="center">
        <a href="index.jsp?action=login"><input type="button" value="다시 시도"></a>
    </p>
<%
        }
    } else if ("mypage".equals(action)) {
        String id = (String) session.getAttribute("id");
        String name = (String) session.getAttribute("name");
        String pwd = (String) session.getAttribute("pwd");

        if (id == null || name == null || pwd == null) {
%>
    <h1 align="center">마이페이지</h1>
    <table align="center" width="300" border="1">
        <tr>
            <td align="center">이름 = null</td>
        </tr>
        <tr>
            <td align="center">id = null</td>
        </tr>
        <tr>
            <td align="center">비밀번호 = null</td>
        </tr>
        <tr>
            <td align="center">
                <a href="index.jsp?action=login"><input type="button" value="로그인으로가기"></a>
            </td>
        </tr>
    </table>
<%
        } else {
%>
    <h1 align="center">마이페이지</h1>
    <table align="center" width="300" border="1">
        <tr>
            <td align="center">이름 = <%= name %></td>
        </tr>
        <tr>
            <td align="center">id = <%= id %></td>
        </tr>
        <tr>
            <td align="center">비밀번호 = <%= pwd %></td>
        </tr>
        <tr>
            <td align="center">
                <a href="index.jsp?action=login"><input type="button" value="로그인으로가기"></a>
            </td>
        </tr>
    </table>
<%
        }
    } else if ("logout".equals(action)) {
        session.invalidate();
%>
    <h1 align="center">로그아웃 되었습니다.</h1>
    <p align="center">
        <a href="index.jsp?action=login"><input type="button" value="로그인"></a>
    </p>
<%
    }
%>
</body>
</html>
