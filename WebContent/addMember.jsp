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
<title>�ΰ���б� ������ ����</title>
</head>
<body>
<h1 id="first">�ΰ���б� ������ ����</h1>
<div class="login">
<h1 class="loginh1">ȸ������</h1>
<form name="addMember" action="addMemberAction.jsp" method="POST">
<input name="mid" type="text" placeholder="���̵�"><br>
<input name="mpass" type="text" placeholder="��й�ȣ"><br>
<input class="button" type="submit" value="����">
</form>
</div>
</body>
</html>