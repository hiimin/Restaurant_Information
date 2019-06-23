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
	<%
		if (session.getAttribute("id") == null)
			response.sendRedirect("index.jsp");

		/* System.out.println(session.getAttribute("id")); */

		else {
	%>

	<%
		String type = request.getParameter("type");

			RestaurantDAO rdao = new RestaurantDAO();
			ArrayList<RestaurantDTO> typeRestaurant;
			if (type != null) {
				typeRestaurant = rdao.typeRestaurant(type);
			} else {
				typeRestaurant = rdao.getAllData();
			}
	%>
	<table border=1>
		<tr>
			<th>No.</th>
			<th>음식점명</th>
		</tr>
		<%
			for (int i = 0; i < typeRestaurant.size(); i++) {
					String rname = typeRestaurant.get(i).getRname();
					String rno = String.valueOf(typeRestaurant.get(i).getRno());
		%>
		<tr class="trc"
			onclick="location.href='restaurantInfo.jsp?&rno=<%=rno%>'">
			<td><%=i + 1%></td>
			<td><%=rname%></td>
		</tr>
		<%
			}
		%>


		<%
			}
		%>
	</table>
</body>
</html>