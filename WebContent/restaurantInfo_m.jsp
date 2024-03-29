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
				<li>주소 : <%=raddr%></li>
				<li>전화번호 : <%=rcall%></li>
				<li>평점 : <%=9.3%></li>
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
					<div class="mdelete">
					<button>
					<a href="deleteMenu.jsp?&mname=<%=mname%>&rno=<%=rno%>">삭제</a>
				</button>
					</div>
				</div>
			</li>
			<%
				}
			%>
			<li>
				<div>
					<div class="mname">
						<a href="addMenu.jsp?&rno=<%=rno%>">메뉴추가</a>
					</div>
					<div class="mprice">
					</div>
				</div>
			</li>
		</ul>
	</div>
</body>
</html>