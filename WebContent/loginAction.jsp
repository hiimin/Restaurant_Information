<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="pknu.it.MemberDAO" %>
    <%@ page import="pknu.it.MemberDTO" %>
    <%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet" type="text/css" href="css/style.css">
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
String id = request.getParameter("id");
String pw = request.getParameter("pw");
System.out.println(id+ " : "+pw);

MemberDAO mdao = new MemberDAO();
int result = mdao.login(id, pw);

String print;
if(result == 1){
	session.setMaxInactiveInterval(600);	//session 10minute
	session.setAttribute("id", id);
	print = "환영합니다.";
	System.out.println(print);
	response.sendRedirect("type.jsp");
}else if(result==-1){
	print="비밀번호가 틀렸습니다.";
	System.out.println(print);
	response.sendRedirect("index.jsp");
}else if(result==0){
	print="존재하지 않는 아이디입니다.";
	System.out.println(print);
	response.sendRedirect("index.jsp");
}else{
	print="데이터베이스 오류";
	System.out.println(print);
	response.sendRedirect("index.jsp");
}
%>
<%=print %>
<%=session.getAttribute("id") %>
</body>
</html>