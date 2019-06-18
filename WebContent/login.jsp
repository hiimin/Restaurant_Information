
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="pknu.it.MemberDAO" %>
    <%@ page import="pknu.it.MemberDTO" %>
    <%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel = "stylesheet" href="/css/style.css">
<title>Insert title here</title>
</head>
<body>
<form action="loginAction.jsp" method="post">
아이디<input name="id" type="text"><br>
비밀번호<input name="pw" type="password"><br>
<input type="submit" value="로그인">
</form>
</body>
</html>