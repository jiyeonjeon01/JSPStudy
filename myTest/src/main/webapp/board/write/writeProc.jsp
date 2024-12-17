<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="co.kr.dev.board.model.BoardDAO" %>
<%@ page import="co.kr.dev.board.model.BoardVO" %>
<%
    try {
        // 게시글 데이터 설정
        String writer = request.getParameter("writer");
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String content = request.getParameter("content");
        String pass = request.getParameter("pass");
        String ip = request.getRemoteAddr();

        // 부모 글 정보 (답글인 경우만 설정)
        int num = Integer.parseInt(request.getParameter("num"));
        int ref = Integer.parseInt(request.getParameter("ref"));
        int step = Integer.parseInt(request.getParameter("step"));
        int depth = Integer.parseInt(request.getParameter("depth"));

        BoardVO vo = new BoardVO();
        vo.setWriter(writer);
        vo.setEmail(email);
        vo.setSubject(subject);
        vo.setContent(content);
        vo.setPass(pass);
        vo.setIp(ip);
        vo.setNum(num); // 0이면 새 글, 값이 있으면 답글
        vo.setRef(ref);
        vo.setStep(step);
        vo.setDepth(depth);

        BoardDAO dao = BoardDAO.getInstance();
        if (dao.insertDB(vo)) {
        	response.sendRedirect(request.getContextPath() + "/board/boardShow.jsp");

        } else {
            out.println("<script>alert('글쓰기 실패!'); history.back();</script>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<script>alert('오류 발생: " + e.getMessage() + "'); history.back();</script>");
    }
%>
