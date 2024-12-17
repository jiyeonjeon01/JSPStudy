
<%@page import="co.kr.dev.board.model.BoardVO"%>
<%@page import="co.kr.dev.board.model.BoardDAO"%>
<%@page import="co.kr.dev.student.model.StudentVO"%>
<%@page import="co.kr.dev.student.model.StudentDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>

<%-- <%
    // DAO 인스턴스 생성
    StudentDAO studentDAO = StudentDAO.getInstance();

    // 세션에서 studentId 가져오기
    String studentId = (String) session.getAttribute("studentId");

    // studentId가 null이 아닐 때만 Student 정보 가져오기
    StudentVO student = null;
    if (studentId != null) {
        student = studentDAO.getStudentById(studentId);
    }

    // 페이징 설정
    int pageSize = 5;
    String pageNum = request.getParameter("pageNum");
    if (pageNum == null) {
        pageNum = "1";
    }
    int currentPage = Integer.parseInt(pageNum);
    int start = (currentPage - 1) * pageSize + 1;
    int end = currentPage * pageSize;

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    // 게시판 데이터 가져오기
    ArrayList<BoardVO> boardList = null;
    BoardDAO bdao = BoardDAO.getInstance();
    int count = bdao.selectCountDB();
    int number = count - (currentPage - 1) * pageSize;

    if (count > 0) {
        boardList = bdao.selectStartEndDB(start, end);
    }
%> --%>
<%

//DAO 인스턴스 생성
StudentDAO studentDAO = StudentDAO.getInstance();

// 세션에서 studentId 가져오기
String studentId = (String) session.getAttribute("studentId");

// studentId가 null이 아닐 때만 Student 정보 가져오기
StudentVO student = null;
if (studentId != null) {
    student = studentDAO.getStudentById(studentId);
}



// SimpleDateFormat 선언
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

// 요청 파라미터로부터 게시글 번호 가져오기
String numParam = request.getParameter("num");
int num = 0; // 기본값 설정
if (numParam != null && !numParam.trim().isEmpty()) {
    try {
        num = Integer.parseInt(numParam);
    } catch (NumberFormatException e) {
        out.println("<script>alert('잘못된 요청입니다.'); history.back();</script>");
        return;
    }
} else {
    out.println("<script>alert('글 번호가 없습니다.'); history.back();</script>");
    return;
}

// DAO를 사용해 게시글 데이터 가져오기
BoardDAO boardDAO = BoardDAO.getInstance();
BoardVO board = boardDAO.selectBoardByNum(num);


// 요청 파라미터에서 pageNum 가져오기
String pageNum = request.getParameter("pageNum");
if (pageNum == null || pageNum.trim().isEmpty()) {
    pageNum = "1"; // 기본값 설정 (필요에 따라 수정 가능)
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시판 - 일반 게시판</title>

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
                    <a href="<%= (studentId != null) ? "../../../main/indexLogin.jsp" : "../../../main/indexLogout.jsp" %>">
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

		<!-- 섹션 -->
		<section>
			 <article>
            <table class="boardTable" width="80%" align="center" cellpadding="10" cellspacing="0" border="1">
                <tr>
                    <th>글번호</th>
                    <td><%= board.getNum() %></td>
                    <th>조회수</th>
                    <td><%= board.getReadcount() %></td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td><%= board.getWriter() %></td>
                    <th>작성일</th>
                    <td>
    <% if (board.getRegdate() != null) { %>
        <%= sdf.format(board.getRegdate()) %>
    <% } else { %>
        <span>등록 날짜 없음</span>
    <% } %>
</td>

                </tr>
                <tr>
                    <th>글제목</th>
                    <td colspan="3"><%= board.getSubject() %></td>
                </tr>
                <tr>
                    <th>글내용</th>
                    <td colspan="3">
                        <pre><%= board.getContent() %></pre>
                    </td>
                </tr>
<tr>
    <td colspan="4" align="center">
        <!-- 글 수정 버튼 -->
        <button onclick="location.href='/myTest/board/updateForm.jsp?num=<%= num %>&pageNum=<%= pageNum %>'">
            글수정
        </button>
        <!-- 글 삭제 버튼 -->
        <button onclick="location.href='/myTest/board/deleteForm.jsp?num=<%= num %>&pageNum=<%= pageNum %>'">
            글삭제
        </button>
        <!-- 답글 버튼 -->
        <button onclick="location.href='/myTest/board/write/writeForm.jsp?num=<%= num %>&ref=<%= board.getRef() %>&step=<%= board.getStep() %>&depth=<%= board.getDepth() %>'">
            답글쓰기
        </button>
        <!-- 목록으로 버튼 -->
        <button onclick="location.href='/myTest/board/normal/normalList.jsp?pageNum=<%= pageNum %>'">
            글목록
        </button>
    </td>
</tr>

            </table>
        </article>
		</section>
	</main>





	<!-- 푸터 -->
	<footer>
		<div>푸터입니다</div>
	</footer>


</body>
</html>