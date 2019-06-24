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
		if (session.getAttribute("id") == null)
			response.sendRedirect("index.jsp");

		/* System.out.println(session.getAttribute("id")); */
	%>
	<%
		String mname = request.getParameter("mname");
		String rno = request.getParameter("rno");
		System.out.println(mname);

		/* RestaurantDAO rdao = new RestaurantDAO();
		rdao.delete(rno); */
		
		MenuDAO mdao = new MenuDAO();
		mdao.delete(mname);

		response.sendRedirect("restaurantInfo_m.jsp?&rno="+rno);
	%>
</body>
</html>