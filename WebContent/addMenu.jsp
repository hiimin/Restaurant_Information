<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="pknu.it.MenuDAO"%>
<%@ page import="pknu.it.MenuDTO"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css">
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="menubar.jsp"></jsp:include>
	<%
	String rno = request.getParameter("rno");
	%>
	<div class="login">
		<h1 class="loginh1">메뉴 추가</h1>
		<form action="addMenuAction.jsp" accept-charset="EUC-KR">
			<input name="mname" type="text" placeholder="메뉴명"><br> <input
				name="price" type="text" placeholder="가격"><br> <input
				name="rno" type="text" placeholder="가격" value=<%=rno %> style="display:none;"><br> <input
				class="button" type="submit" value="추가">
		</form>

	</div>
</body>
</html>