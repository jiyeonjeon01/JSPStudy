<%@ page contentType="text/html; charset=UTF-8"%>
<!-- 1.사용자정보를 가져온다  -->
<!-- 2.curd  -->
<!-- 3.화면설계(자바코드에 해야되는데 - > jsp service함수에서 진행한다. -->
<html>
<head>
<title>옵션 선택 화면</title>
</head>
<body>
	<form action="<%=request.getContextPath()%>/forward/view.jsp" method="get">
		보고 싶은 페이지 선택: <select name="code">
			<option value="A">A 페이지</option>
			<option value="B">B 페이지</option>
			<option value="C">C 페이지</option>
		</select> 
		<input type="submit" value="이동">
	</form>
</body>
</html>