<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="pknu.it.MemberDAO" %>
    <%@ page import="pknu.it.MemberDTO" %>
    <%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel = "stylesheet" type="text/css" href="css/style.css">
<title>부경대학교 음식점 정보</title>
</head>
<body>
<h1 id="first">부경대학교 음식점 정보</h1>
<div class="login">
<h1 class="loginh1">회원가입</h1>
<form name="addMember" action="addMemberAction.jsp" method="POST">
<input name="mid" type="text" placeholder="아이디"><br>
<input name="mpass" type="text" placeholder="비밀번호"><br>
<input class="button" type="submit" value="가입">
</form>
</div>
</body>
</html>