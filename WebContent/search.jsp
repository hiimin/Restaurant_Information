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

/* System.out.println(session.getAttribute("id")); */

%>

<%
String search = request.getParameter("search");

RestaurantDAO rdao = new RestaurantDAO();
ArrayList<RestaurantDTO> searchRestaurant;

searchRestaurant = rdao.search(search);
%>
<table border=1>
<tr>
<th>No.</th>
<th>음식점명</th>
</tr>
<%
for(int i = 0; i < searchRestaurant.size(); i++){
	String rname = searchRestaurant.get(i).getRname();
	String rno = String.valueOf(searchRestaurant.get(i).getRno());
	%>
	<tr class="trc" onclick="location.href='restaurantInfo.jsp?&rno=<%=rno%>'">
	<td><%=i+1 %></td>
	<td><%=rname %></td>
	</tr>
<%
%>


<%} %>
</table>
</body>
</html>