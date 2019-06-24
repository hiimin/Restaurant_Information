<%@page import="java.io.UnsupportedEncodingException"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="pknu.it.MemberDAO" %>
    <%@ page import="pknu.it.MemberDTO" %>
    <%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
String mid = request.getParameter("mid");
String mpass = request.getParameter("mpass");
String mclass = "customer";

System.out.println(mid);
System.out.println(mpass);
System.out.println(mclass);

MemberDAO mdao = new MemberDAO();
mdao.add(mid, mpass, mclass);

%>
hello <%=mid %>.

<%

response.sendRedirect("index.jsp");
%>

</body>
</html>