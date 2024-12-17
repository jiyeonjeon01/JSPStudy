<%@page import="co.kr.dev.board.model.BoardVO"%>
<%@page import="co.kr.dev.board.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>

<%
// DB에서 글 10개만 가져오기
BoardDAO boardDAO = BoardDAO.getInstance();
List<BoardVO> boardList = boardDAO.selectStartEndDB(1, 10); // 1번부터 10번까지 가져오기
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
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
            <!-- 로고: 클릭 시 새로고침 -->
            <td class="logoTd">
                <a href="javascript:location.reload();"> <!-- 새로고침 -->
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
						<a href="<%= request.getContextPath() %>/board/normal/normalList.jsp"><span>게시판</span>
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

            <!-- 로그인 버튼 -->
            <td class="loginBtnTd">
                <div>
<a href="<%= request.getContextPath() %>/student/login.jsp"><button class="loginBtn">로그인</button>

                        
                    </a>
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

		<section>
			<!-- 왼쪽 사이드바 -->
			<aside>
				<div class="aside">
					<span> 로그아웃된 상태입니다 </span><a href="/myTest/student/login.jsp">
    <button>로그인</button>
</a>
				</div>
			</aside>
			<!-- 게시판 리스트.....말고 다른걸 넣으먄 안될까 ?ㄴ -->


			<!-- 게시판 리스트 -->
			<article>
				<div class="boardTitle">
					<h4>최근 게시판</h4>
				</div>

				<br>

				<div>
					<table class="boardTable" cellpadding="0" cellspacing="0">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody>
							<tbody>
    <%
    if (boardList != null && !boardList.isEmpty()) {
        for (BoardVO board : boardList) {
            // depth에 따른 들여쓰기 너비 설정
            int indentWidth = board.getDepth() * 10; // depth마다 10px씩 들여쓰기
    %>
    <tr>
        <td align="center"><%=board.getNum()%></td>
        <td>
            <!-- 답변 여부에 따라 들여쓰기와 아이콘 추가 -->
            <div style="padding-left: <%=indentWidth%>px; display: flex; align-items: center;">
                <%
                if (board.getDepth() > 0) {
                %>
                <img src="images/re.gif" alt="답변" style="margin-right: 5px;">
                <%
                }
                %>
                <a href="/myTest/board/boardShow.jsp?num=<%=board.getNum()%>"><%=board.getSubject()%></a>
            </div>
        </td>
        <td align="center"><%=board.getWriter()%></td>
        <td align="center">
    <% if (board.getRegdate() != null) { %>
        <%=sdf.format(board.getRegdate())%>
    <% } else { %>
        <span>날짜 없음</span>
    <% } %>
</td>

    </tr>
    <%
        }
    } else {
    %>
    <tr>
        <td colspan="4" align="center">게시글이 없습니다.</td>
    </tr>
    <%
    }
    %>
</tbody>

					</table>
				</div>

				<br>

				<!-- 자세히 보기 -->
				<div class="boardHref" style="text-align: right; margin-top: 10px;">
					<a href="../board/normal/normalList.jsp"
						style="text-decoration: none; color: #007bff;"> 자세히 보기 &gt; </a>
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