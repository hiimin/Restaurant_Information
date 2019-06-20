<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="pknu.it.TypeDAO" %>
    <%@ page import="pknu.it.TypeDTO" %>
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
	response.sendRedirect("login.jsp");

System.out.println(session.getAttribute("id"));
%>

<%
TypeDAO tdao = new TypeDAO();
ArrayList<TypeDTO> tdto = tdao.getAllData();


%>
<div class="typeWrapper">
<%
for(int i = 0; i < tdto.size(); i++){
	String type = tdto.get(i).getTname();
	int tno = tdto.get(i).getTno();
%>
<div onclick="location.href='restaurant.jsp?&type=<%=tno%>'"><%=type %></div>
<%
}
%>
<!-- <div>type1</div>
<div>type2</div>
<div>type3</div>
<div>type4</div>
<div>type5</div>
<div>type6</div>
<div>type7</div>
<div>type8</div>
<div>type9</div> -->
</div>
</body>
</html>