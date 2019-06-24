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
		RestaurantDAO rdao = new RestaurantDAO();
			ArrayList<RestaurantDTO> typeRestaurant;

			typeRestaurant = rdao.getAllData();
	%>
	<table border=1>
		<tr>
			<th>No.</th>
			<th>��������</th>
			<th>����</th>
		</tr>
		<%
			for (int i = 0; i < typeRestaurant.size(); i++) {
					String rname = typeRestaurant.get(i).getRname();
					String rno = String.valueOf(typeRestaurant.get(i).getRno());
		%>
		<tr>
			<td><%=i + 1%></td>
			<td><a href="restaurantInfo_m.jsp?&rno=<%=rno%>"><%=rname%></a></td>
			<td>
				<button>
					<a href="deleteRestaurant.jsp?&rno=<%=rno%>">����</a>
				</button>
			</td>
		</tr>
		<%
			}
		%>


		<%
			}
		%>
		<tr>
			<td>+</td>
			<td>������ �߰�</td>
			<td>
				<form action="addRestaurant.jsp">
					<input type="submit" value="�߰�">
				</form>
			</td>
		</tr>
	</table>
</body>
</html>