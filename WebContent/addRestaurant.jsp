<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="pknu.it.RestaurantDAO"%>
<%@ page import="pknu.it.RestaurantDTO"%>
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
	<div class="login">
		<h1 class="loginh1">음식점 추가</h1>
		<form action="addRestaurantAction.jsp" accept-charset="EUC-KR">
			<select name="type">
				<option value="">분류</option>
				<option value="1">치킨</option>
				<option value="2">피자/양식</option>
				<option value="3">중국집</option>
				<option value="4">한식</option>
				<option value="5">일식/돈까스</option>
				<option value="6">족발/보쌈</option>
				<option value="7">야식</option>
				<option value="8">분식</option>
				<option value="9">카페/디저트</option>
			</select> <input name="rname" type="text" placeholder="음식점명"><br>
			<input name="addr" type="text" placeholder="주소"><br> <input
				name="call" type="text" placeholder="전화번호"><br> <input
				class="button" type="submit" value="추가">
		</form>

	</div>
</body>
</html>