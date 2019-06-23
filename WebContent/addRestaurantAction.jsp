<%@page import="java.io.UnsupportedEncodingException"%>
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
<%
try{
	request.setCharacterEncoding("EUC-KR");
	response.setContentType("text/html;charset=EUC-KR");
}catch(UnsupportedEncodingException e){
	e.printStackTrace();
}
String rname = request.getParameter("rname");
String addr = request.getParameter("addr");
String call = request.getParameter("call");
String type = request.getParameter("type");

RestaurantDAO rdao = new RestaurantDAO();
rdao.add(type, rname, addr, call);

response.sendRedirect("manager.jsp");
%>

</body>
</html>