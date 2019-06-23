<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="pknu.it.MemberDAO"%>
<%@ page import="pknu.it.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" type="text/css" href="css/style.css">
<title>Insert title here</title>
</head>
<body>
	<h1 id="first">부경대학교 음식점 정보</h1>
	<div class="login">
		<h1 class="loginh1">Login</h1>
		<form action="loginAction.jsp" method="post">
			<input name="id" type="text" placeholder="id"><br> <input
				name="pw" type="password" placeholder="password"><br> <input
				class="button" type="submit" value="로그인"> <a href="">회원가입</a>
		</form>
	</div>
</body>
</html>