<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String pageTitle = (String) request.getAttribute("PAGETITLE");
String contentPage = (String) request.getAttribute("CONTENTPAGE");
%>
<html>
<head>
<title><%=pageTitle%></title>
<style>
    body {
        margin: 0;
        padding: 0;
        display: flex;
       /* justify-content: center; /* 가로 방향 중앙 정렬 */
/*         align-items: center; /* 세로 방향 중앙 정렬 (선택사항) */
        /* height: 100vh; /* 선택사항: 화면 전체를 사용 */ 
    }
    table {
        margin: auto; /* 테이블 가로 중앙 정렬 */
        border-collapse: collapse; /* 테이블 경계선 정리 */
    }
</style>
</head>
<body>
	<table width="80%" border="1" cellpadding="2" cellspacing="0">
		<tr>
			<td colspan="2">
			<jsp:include page="../module/top.jsp" flush="false" />
			</td>
		</tr>
		<tr>
			<td width="100" valign="top">
			<jsp:include page="../module/left.jsp" flush="false" />
			</td>
			<td width="300" valign="top">
			<jsp:include page="<%= contentPage %>" flush="false" />
				<!-- 내용 부분: 시작 --> 
				<!-- 내용 부분: 끝 -->
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<jsp:include page="../module/bottom.jsp" flush="false" />
			</td>
		</tr>
	</table>
</body>
</html>
