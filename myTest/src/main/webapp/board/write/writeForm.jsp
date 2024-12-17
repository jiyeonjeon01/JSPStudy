<%@page import="co.kr.dev.student.model.StudentVO"%>
<%@page import="co.kr.dev.student.model.StudentDAO"%>
<%@page import="co.kr.dev.board.model.BoardVO"%>
<%@page import="co.kr.dev.board.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.SQLException"%>

<%

//DAO 인스턴스 생성
StudentDAO studentDAO = StudentDAO.getInstance();
String studentId = (String) session.getAttribute("studentId"); // 세션에서 ID 가져오기
StudentVO student = null;

if (studentId != null) {
	student = studentDAO.getStudentById(studentId);
}



%>
<%
    // num, ref, step, depth 기본값 설정
    int num = 0, ref = 0, step = 0, depth = 0;
    try {
        if (request.getParameter("num") != null) {
            num = Integer.parseInt(request.getParameter("num"));
            ref = Integer.parseInt(request.getParameter("ref"));
            step = Integer.parseInt(request.getParameter("step"));
            depth = Integer.parseInt(request.getParameter("depth"));
        }
    } catch (Exception e) {
        e.printStackTrace(); // 오류 로그 출력
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>JY Web</title>

<script src="https://kit.fontawesome.com/abb02b8c73.js"
	crossorigin="anonymous"></script>
<script language="javascript" src="script.js"></script>
<link rel="stylesheet" href="style.css">
</head>

<body>

	<!-- 헤더 -->
	<header>
		<!-- 한줄의 테이블 형식, 세부 내용은 div로 나누기 -->
		<table>
			<tr>
<!-- 로고: 클릭 시 로그인 상태에 따라 페이지 이동 -->
 <!-- 로고 -->
                <td class="logoTd">
                    <a href="<%= (studentId != null) ? "../../main/indexLogin.jsp" : "../../main/indexLogout.jsp" %>">
                        <div class="logoPic">
                            <i class="fa-solid fa-house" width="10%"></i>
                        </div>
                        <div class="logoLetter">
                            <span>JY Site</span>
                        </div>
                    </a>
                </td>

				<!-- 빈공간 -->
				<td class="emptyTd"></td>

				<!-- 메뉴 -->
				<td class="menuTd">
					<!-- 공지사항 -->
					<div class="notiMenu">
						<a href="<%= request.getContextPath() %>/board/noti/notiList.jsp"> <span>공지사항</span>
						</a>
					</div> <!-- 게시판 -->
					<div class="normalMenu">
						<a href="<%= request.getContextPath() %>/board/normal/normalList.jsp"> <span>게시판</span>
						</a>
					</div> <!-- 자료실 -->
					<div class="contentMenu">
						<a href="<%= request.getContextPath() %>/board/content/contentList.jsp"> <span>자료실</span>
						</a>
					</div> <!-- Q&A -->
					<div class="qnaMenu">
						<a href="<%= request.getContextPath() %>/board/qna/qnaList.jsp"> <span>Q&A</span>
						</a>
					</div>
				</td>

				<!-- 빈공간 -->
				<td class="emptyTd"></td>

				<!-- 사용자 정보 -->
				<td class="userTd">
					<div>
						<%
						if (student != null) {
						%>
						<span><%=student.getName()%>님</span>
						<%
						} else {
						%>
						<a href="<%= request.getContextPath() %>/student/login.jsp">
							<button class="loginBtn">로그인</button>
						</a>
						<%
						}
						%>
					</div>
				</td>
			</tr>
		</table>
	</header>



	<!-- 메인: 회전목마, 왼쪽사이드, 내용 -->
	<main>

		<!-- 회전목마: 사진, 왼.오버튼, 섹션버튼 -->
		<div class="slideShow">
			<div class="slidePic">
				<a href="#"> <img src="./media/slidePic1.png"></a> <a href="#">
					<img src="./media/slidePic2.png">
				</a> <a href="#"> <img src="./media/slidePic3.png"></a> <a
					href="#"> <img src="./media/slidePic4.png"></a> <a href="#">
					<img src="./media/slidePic5.png">
				</a>
			</div>
			<div class="slideSideIcon">
				<a href="#" class="prev"><i
					class="fa-solid fa-circle-chevron-left"></i></a> <a href="#"
					class="next"><i class="fa-solid fa-circle-chevron-right"></i></a>
			</div>
			<div class="slideFooterIcon">
				<a href="#" class="active"><i class="fa-solid fa-circle-dot"></i></a>
				<a href="#"><i class="fa-solid fa-circle-dot"></i></a> <a href="#"><i
					class="fa-solid fa-circle-dot"></i></a> <a href="#"><i
					class="fa-solid fa-circle-dot"></i></a> <a href="#"><i
					class="fa-solid fa-circle-dot"></i></a>
			</div>
		</div>

		<!-- 글쓰기 섹션 -->
        <section>
            <form method="post" name="writeForm" action="writeProc.jsp" onsubmit="return writeSave()">
        <input type="hidden" name="num" value="<%= num %>">
        <input type="hidden" name="ref" value="<%= ref %>">
        <input type="hidden" name="step" value="<%= step %>">
        <input type="hidden" name="depth" value="<%= depth %>">
        <table width="500" border="1" cellpadding="10" cellspacing="0" align="center" >
            <tr>
                <td align="right" colspan="2" >
                    <a href="list.jsp">글목록</a>
                </td>
            </tr>
            <tr>
                <td width="100" align="center" >이름</td>
                <td>
                    <input type="text" name="writer" maxlength="12" required>
                </td>
            </tr>
            <tr>
                <td align="center" >이메일</td>
                <td>
                    <input type="email" name="email" maxlength="50" required>
                </td>
            </tr>
            <tr>
                <td align="center" >제목</td>
                <td>
                    <% if (num == 0) { %>
                        <input type="text" name="subject" maxlength="50" required>
                    <% } else { %>
                        <input type="text" name="subject" value="[답변]" maxlength="50" required>
                    <% } %>
                </td>
            </tr>
            <tr>
                <td align="center" >내용</td>
                <td>
                    <textarea name="content" rows="10" cols="50" required></textarea>
                </td>
            </tr>
            <tr>
                <td align="center" >비밀번호</td>
                <td>
                    <input type="password" name="pass" maxlength="10" required>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center" >
                    <input type="submit" value="글쓰기">
                    <input type="reset" value="다시작성">
                    <input type="button" value="목록" onclick="location.href='list.jsp'">
                </td>
            </tr>
        </table>
    </form>
        </section>
	</main>





	<!-- 푸터 -->
	<footer>
		<div>푸터입니다</div>
	</footer>


</body>
</html>

