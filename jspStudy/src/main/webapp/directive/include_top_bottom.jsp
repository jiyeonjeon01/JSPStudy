<%@ page contentType="text/html; charset=UTF-8"%>

<!-- 헤더영역 -->
<%@ include file="top.jsp"%>
<%
//지역변수
String name = "kim dong jin";
%>
<!-- 바디영역 -->
<h2>body 영역입니다.</h2>
<form method="post" action="/jspStudy/memberInsert.do">
	<table align="center" width="465" border="1">
		<tr>
			<th style="padding: 10px 3px;">이름</th>
			<td><input type="text" name="name" size="48"
				style="height: 23px;"></td>
		</tr>
		<tr>
			<th style="padding: 10px 3px;">아이디</th>
			<td><input type="text" name="id" size="48" style="height: 23px;"></td>
		</tr>
		<tr>
			<th style="padding: 10px 3px;">비밀번호</th>
			<td><input type="password" name="pwd" size="48"
				style="height: 23px;"></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="submit" value="회원가입">&nbsp;&nbsp;
				<input type="reset" value="취소"></td>
		</tr>
	</table>
</form>
<!-- 푸터영역  -->
<%@ include file="bottom.jsp"%>

