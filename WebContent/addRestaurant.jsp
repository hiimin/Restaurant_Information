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
		<h1 class="loginh1">������ �߰�</h1>
		<form action="addRestaurantAction.jsp" accept-charset="EUC-KR">
			<select name="type">
				<option value="">�з�</option>
				<option value="1">ġŲ</option>
				<option value="2">����/���</option>
				<option value="3">�߱���</option>
				<option value="4">�ѽ�</option>
				<option value="5">�Ͻ�/���</option>
				<option value="6">����/����</option>
				<option value="7">�߽�</option>
				<option value="8">�н�</option>
				<option value="9">ī��/����Ʈ</option>
			</select> <input name="rname" type="text" placeholder="��������"><br>
			<input name="addr" type="text" placeholder="�ּ�"><br> <input
				name="call" type="text" placeholder="��ȭ��ȣ"><br> <input
				class="button" type="submit" value="�߰�">
		</form>

	</div>
</body>
</html>