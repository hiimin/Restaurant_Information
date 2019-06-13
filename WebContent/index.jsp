<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="pknu.it.MemberDAO" %>
    <%@ page import="pknu.it.MemberDTO" %>
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
%>
<%
for(int i = 0; i < mdto.size(); i++){
%>
<%=mdto.get(i).toString() %><br>
<%
}
%>




</body>
</html>