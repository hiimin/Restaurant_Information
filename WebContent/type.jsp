<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="pknu.it.TypeDAO"%>
<%@ page import="pknu.it.TypeDTO"%>
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

		System.out.println(session.getAttribute("id"));
	%>

	<%
		TypeDAO tdao = new TypeDAO();
		ArrayList<TypeDTO> tdto = tdao.getAllData();
	%>
	<div class="typeWrapper">
		<%
			for (int i = 0; i < tdto.size(); i++) {
				String type = tdto.get(i).getTname();
				int tno = tdto.get(i).getTno();
		%>
		<div onclick="location.href='restaurant.jsp?&type=<%=tno%>'"><%=type%></div>
		<%
			}
		%>
	</div>
</body>
</html>