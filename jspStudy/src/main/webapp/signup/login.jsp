<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*, java.util.*"%>
<%@ page import="java.io.FileReader, java.io.IOException"%>
<!-- 1.사용자정보를 가져온다  -->
<!-- 2.curd  -->
<!-- 3.화면설계(자바코드에 해야되는데 - > jsp service함수에서 진행한다. -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인</title>
<link rel="stylesheet" href="../css/login.css">
</head>
<body>
	<form action="loginCheck.jsp" method="post">
		<table>
			<thead>
				<tr>
					<th colspan="2">로그인</th>
				</tr>
			</thead>
			<tr>
				<th class="title">아이디:</th>
				<td><label for="id"><input type="text" name="id"
						id="id" required></label></td>
			</tr>
			<tr>
				<th class="title">비밀번호:</th>
				<td><label for="pwd"><input type="password" name="pass"
						id="pwd" required></label></td>
			</tr>
		</table>

		<footer>
			<hr>
			<button type="submit">로그인</button>
			<button type="button" onclick="location.href='signup.jsp'">회원가입</button>
		</footer>
	</form>
</body>
</html>
