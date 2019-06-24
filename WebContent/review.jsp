<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="pknu.it.MemberDAO" %>
    <%@ page import="pknu.it.MemberDTO" %>
    <%@ page import="pknu.it.RestaurantDAO" %>
    <%@ page import="pknu.it.RestaurantDTO" %>
    <%@ page import="pknu.it.MenuDAO" %>
    <%@ page import="pknu.it.MenuDTO" %>
    <%@ page import="pknu.it.ReviewDAO" %>
    <%@ page import="pknu.it.ReviewDTO" %>
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

System.out.println(session.getAttribute("id"));
%>

<%
String rno = request.getParameter("rno");
System.out.println(rno);
RestaurantDAO rdao = new RestaurantDAO();
RestaurantDTO rdto = rdao.info(rno);

String rname = rdto.getRname();
String raddr = rdto.getAddr();
String rcall = rdto.getCall();

MenuDAO mdao = new MenuDAO();
ArrayList<MenuDTO> mdto = mdao.restaurantMenu(rno);

ReviewDAO redao = new ReviewDAO();
ArrayList<ReviewDTO> redto = redao.restaurantReview(rno);
double sum=0;
double avgGrade;
for(int i = 0; i < redto.size(); i++){
	int grade = redto.get(i).getGrade();
	sum += grade;
}
avgGrade = sum/redto.size();

MemberDAO memdao = new MemberDAO();

%>
<div class="rwrapper">

<div class="rname">
<%=rname %>
</div>

<div class="rinfo">
<ul>
<li>주소 : <%=raddr %></li>
<li>전화번호 : <%=rcall %></li>
<li>리뷰평점 : <%=avgGrade %> (<%=redto.size() %>)</a>
<a href="addReview.jsp?rno=<%=rno%>">+</a></li>
</ul>
</div>


</div>

<p id="menu">
Review
</p>

<div class="food">
<ul>
<%
for(int i = 0; i < redto.size(); i++){
	int reno = redto.get(i).getRno();
	String memid = memdao.getMid(reno);
	int grade = redto.get(i).getGrade();
%>
	<li>
	<div>
	<div class="mname">
	<%=memid %>
	</div>
	<div class="mprice">
	<%=grade %>
	</div>
	</div>
	</li>
<%
}
%>
</ul>
</div>
</body>
</html>