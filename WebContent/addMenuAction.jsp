<%@page import="java.io.UnsupportedEncodingException"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="pknu.it.MenuDAO"%>
<%@ page import="pknu.it.MenuDTO"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		try {
			request.setCharacterEncoding("EUC-KR");
			response.setContentType("text/html;charset=EUC-KR");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String mname = request.getParameter("mname");
		String price = request.getParameter("price");
		String rno = request.getParameter("rno");

		System.out.println("rno : "+rno);
		MenuDAO rdao = new MenuDAO();
		rdao.add(rno, mname, price);

		response.sendRedirect("restaurantInfo_m.jsp?&rno="+rno);
	%>

</body>
</html>