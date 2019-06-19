<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="pknu.it.RestaurantDAO" %>
    <%@ page import="pknu.it.RestaurantDTO" %>
    <%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="menubar.jsp"></jsp:include>
<%
String type = request.getParameter("type");

RestaurantDAO rdao = new RestaurantDAO();
ArrayList<RestaurantDTO> typeRestaurant = rdao.typeRestaurant(type);
%>
<%
for(int i = 0; i < typeRestaurant.size(); i++){
%>
<%=typeRestaurant.get(i).toString() %><br>
<%
}
%>

</body>
</html>