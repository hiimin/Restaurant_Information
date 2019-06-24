<%@page import="java.io.UnsupportedEncodingException"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="pknu.it.RestaurantDAO" %>
    <%@ page import="pknu.it.RestaurantDTO" %>
    <%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet" type="text/css" href="css/style.css">
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="menubar.jsp"></jsp:include>
<%
if(session.getAttribute("id")==null)
	response.sendRedirect("index.jsp");

System.out.println(session.getAttribute("id"));
%>
<%
String rno = request.getParameter("rno");
System.out.println(rno);
RestaurantDAO rdao = new RestaurantDAO();
RestaurantDTO rdto = rdao.info(rno);

String rname = rdto.getRname();
%>
<div class="login">
<h1 class="loginh1">리뷰 작성</h1>
<form name="addReview" action="addReviewAction.jsp" method="POST">
<h2 class="loginh2"><%=rname %></h2>
<input name="rname" type="text" placeholder="음식점 이름 확인"><br>
<input name="grade" type="text" placeholder="리뷰 점수(0~10)"><br>
<input class="button" type="submit" value="추가">

</form>
</div>

</body>
</html>