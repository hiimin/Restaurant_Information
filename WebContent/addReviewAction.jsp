<%@page import="java.io.UnsupportedEncodingException"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="pknu.it.RestaurantDAO" %>
    <%@ page import="pknu.it.RestaurantDTO" %>
    <%@ page import="pknu.it.MemberDAO" %>
    <%@ page import="pknu.it.MemberDTO" %>
    <%@ page import="pknu.it.ReviewDAO" %>
    <%@ page import="pknu.it.ReviewDTO" %>
    <%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
if(session.getAttribute("id")==null)
	response.sendRedirect("index.jsp");

System.out.println(session.getAttribute("id"));
%>
<%
try{
	request.setCharacterEncoding("EUC-KR");
	response.setContentType("text/html;charset=EUC-KR");
}catch(UnsupportedEncodingException e){
	e.printStackTrace();
}
String rname = request.getParameter("rname");
String mid = (String)session.getAttribute("id");
String gradeString = request.getParameter("grade");
int grade = Integer.parseInt(gradeString);

System.out.println(rname);
System.out.println(mid);
System.out.println(grade);

MemberDAO mdao = new MemberDAO();
int mno = mdao.getMno(mid);
System.out.println(mno);

RestaurantDAO rdao = new RestaurantDAO();
int rno = rdao.getRno(rname);
System.out.println(rno);

ReviewDAO redao = new ReviewDAO();
redao.add(mno, rno, grade);

response.sendRedirect("review.jsp?&rno="+rno);
%>
</body>
</html>