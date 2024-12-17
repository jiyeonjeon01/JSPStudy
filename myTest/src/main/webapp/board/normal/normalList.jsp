<%@page import="co.kr.dev.student.model.StudentVO"%>
<%@page import="co.kr.dev.student.model.StudentDAO"%>
<%@page import="co.kr.dev.board.model.BoardVO"%>
<%@page import="co.kr.dev.board.model.BoardDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>

<%
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

		<!-- 섹션 -->
		<section>
			<article>
				<div class="boardTitle">
					<h2>
						게시판 목록 (전체 글:
						<%=count%>)
					</h2>
				</div>
				<div class="boardHref"
					style="text-align: right; margin-bottom: 10px;">
					<a href="<%= request.getContextPath() %>/board/write/writeForm.jsp" class="btn">글쓰기</a>
				</div>

				<%
				if (count == 0) {
				%>
				<table class="boardTable">
					<tr>
						<td align="center">게시판에 저장된 글이 없습니다.</td>
					</tr>
				</table>
				<%
				} else {
				%>
				<table class="boardTable">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회</th>
							<th>IP</th>
						</tr>
					</thead>
					<tbody>
						<%
						for (BoardVO article : boardList) {
						%>
						<tr>
							<td align="center"><%=number--%></td>
							<td><a href="<%= request.getContextPath() %>/board/boardShow.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage%>"> <%

 int wid = article.getDepth() * 5;
 %> <img src="images/level.gif" width="<%=wid%>" height="16"> <%
 if (article.getDepth() > 0) {
 %> <img src="images/re.gif"> <%
 }
 %> <%=article.getSubject()%>
							</a></td>
							<td align="center"><%=article.getWriter()%></td>
							<td align="center">
    <% if (article.getRegdate() != null) { %>
        <%=sdf.format(article.getRegdate())%>
    <% } else { %>
        <span>등록 날짜 없음</span>
    <% } %>
</td>

							<td align="center"><%=article.getReadcount()%></td>
							<td align="center"><%=article.getIp()%></td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
				<%
				}
				%>


				<!-- 페이징 처리 -->
				<div class="pagination"
					style="text-align: center; margin-top: 20px;">
					<%
					if (count > 0) {
						int pageBlock = 3; // 한 번에 보여줄 페이지 수
						int imsi = count % pageSize == 0 ? 0 : 1;
						int pageCount = count / pageSize + imsi; // 총 페이지 수
						int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
						int endPage = startPage + pageBlock - 1;
						if (endPage > pageCount)
							endPage = pageCount;

						// 가장 첫 페이지로 이동 <<
						if (currentPage > 1) {
					%>
					<a href="normalList.jsp?pageNum=1"><<</a>
					<%
					}
					%>

					<!-- 이전 페이지 블록으로 이동 < -->
					<%
					if (startPage > pageBlock) {
					%>
					<a href="normalList.jsp?pageNum=<%=startPage - pageBlock%>"><</a>
					<%
					}
					%>

					<!-- 현재 페이지 블록의 페이지 번호 출력 -->
					<%
					for (int i = startPage; i <= endPage; i++) {
						if (currentPage == i) {
					%>
					<strong>[<%=i%>]
					</strong>
					<%
					} else {
					%>
					<a href="normalList.jsp?pageNum=<%=i%>">[<%=i%>]
					</a>
					<%
					}
					}
					%>

					<!-- 다음 페이지 블록으로 이동 > -->
					<%
					if (endPage < pageCount) {
					%>
					<a href="normalList.jsp?pageNum=<%=startPage + pageBlock%>">></a>
					<%
					}
					%>

					<!-- 가장 마지막 페이지로 이동 >> -->
					<%
					if (currentPage < pageCount) {
					%>
					<a href="normalList.jsp?pageNum=<%=pageCount%>">>></a>
					<%
					}
					%>
					<%
					}
					%>
				</div>

			</article>
		</section>
	</main>





	<!-- 푸터 -->
	<footer>
		<div>푸터입니다</div>
	</footer>


</body>
</html>