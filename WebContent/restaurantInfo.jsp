<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="pknu.it.RestaurantDAO"%>
<%@ page import="pknu.it.RestaurantDTO"%>
<%@ page import="pknu.it.MenuDAO"%>
<%@ page import="pknu.it.MenuDTO"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css">
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="menubar.jsp"></jsp:include>
	<%
		if (session.getAttribute("id") == null)
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
	%>
	<div class="rwrapper">

		<div class="rname">
			<%=rname%>
		</div>

		<div class="rinfo">
			<ul>
				<li>�ּ� : <%=raddr%></li>
				<li>��ȭ��ȣ : <%=rcall%></li>
				<li>���� : <%=9.3%></li>
			</ul>
		</div>


	</div>

	<p id="menu">menu</p>

	<div class="food">
		<ul>
			<%
				for (int i = 0; i < mdto.size(); i++) {
					String mname = mdto.get(i).getMname();
					String mprice = String.format("%,d", mdto.get(i).getPrice());
			%>
			<li>
				<div>
					<div class="mname">
						<%=mname%>
					</div>
					<div class="mprice">
						<%=mprice%>
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