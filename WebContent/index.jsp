<%@page import="pknu.it.TypeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="pknu.it.MemberDAO" %>
    <%@ page import="pknu.it.MemberDTO" %>
    <%@ page import="pknu.it.TypeDAO" %>
    <%@ page import="pknu.it.MemberDTO" %>
    <%@ page import="pknu.it.RestaurantDAO" %>
    <%@ page import="pknu.it.RestaurantDTO" %>
    <%@ page import="pknu.it.MenuDAO" %>
    <%@ page import="pknu.it.MenuDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
MemberDAO mdao = new MemberDAO();
ArrayList<MemberDTO> mdto = mdao.getAllData();

TypeDAO tdao = new TypeDAO();
ArrayList<TypeDTO> tdto = tdao.getAllData();

RestaurantDAO rdao = new RestaurantDAO();
ArrayList<RestaurantDTO> rdto = rdao.getAllData();

MenuDAO fdao = new MenuDAO();
ArrayList<MenuDTO> fdto = fdao.getAllData();
%>
<%
for(int i = 0; i < mdto.size(); i++){
%>
<%=mdto.get(i).toString() %><br>
<%
}
%>

<%
for(int i = 0; i < tdto.size(); i++){
%>
<%=tdto.get(i).toString() %><br>
<%
}
%>

<%
for(int i = 0; i < rdto.size(); i++){
%>
<%=rdto.get(i).toString() %><br>
<%
}
%>

<%
for(int i = 0; i < fdto.size(); i++){
%>
<%=fdto.get(i).toString() %><br>
<%
}
%>

</body>
</html>