<%@page import="co.kr.dev.board.model.BoardVO"%>
<%@page import="co.kr.dev.board.model.BoardDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

// 요청 파라미터에서 데이터 가져오기
int num = Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("pageNum");
String pass = request.getParameter("pass");

// BoardVO 객체 생성 및 값 설정
BoardVO vo = new BoardVO();
vo.setNum(num);
vo.setPass(pass);

// DAO를 사용해 삭제 처리
BoardDAO bdao = BoardDAO.getInstance();
boolean flag = bdao.deleteDB(vo);

if (flag) { // 삭제 성공
%>
<meta http-equiv="Refresh" content="0;url=list.jsp?pageNum=<%=pageNum%>">
<%
} else { // 삭제 실패
%>
<script language="JavaScript">
    alert("비밀번호가 맞지 않습니다.");
    history.go(-1);
</script>
<%
}
%>
