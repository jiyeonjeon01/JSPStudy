<%@page import="java.util.HashMap"%>
<%@page import="co.kh.dev.actiontag.model.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 2. curd: 데이터베이스에서 조회한 다음에 request 입력 
	Customer customer = new Customer();
	customer.setName("jjy");
	customer.setEmail("jjy@naver.com");
	customer.setPhone("010-1234-1234");
	request.setAttribute("customer", customer);
	
	HashMap<String, String> map = new HashMap<String, String>();
	map.put("name", "jy");
	map.put("email", "jy@naver.com");
	map.put("phone", "010-1111-1111");
	request.setAttribute("map", map);
	
	// 3. request 에 보내는걸 받아서 진행 
	Customer ct =(Customer)request.getAttribute("customer");
	HashMap<String, String> map2 = (HashMap<String, String>)request.getAttribute("map");
 
 %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL Example</title>
</head>
<body>
	<ul>
		<li>
			<%= ct.getName() %>
		</li>
		<li>
			<%= ct.getEmail() %>
		</li>
		<li>
			<%=ct.getPhone() %>
		</li>
	</ul>
	
	<ul>
		<li>
			${customer.name()}
			</li>
	</ul>
	<ul>
		<li>
			${customer.email()}
			</li>
	</ul>
	<ul>
		<li>
			${customer.phone()}
			</li>
	</ul>
		
	<ul>
		<li>
			<%= map2.get("name") %>
			</li>
	</ul>
	<ul>
		<li>
			<%= map2.get("email") %>
			</li>
	</ul>
	<ul>
		<li>
			<%= map2.get("phone") %>
			</li>
	</ul>
	
	<ul>
		<li>
			${map.name}
			</li>
	</ul>
	<ul>
		<li>
			${map.email}
			</li>
	</ul>
	<ul>
		<li>
			${map.phone}
			</li>
	</ul>
</body>
</html>