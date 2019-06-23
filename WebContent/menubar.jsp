<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css">
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		String mclass = (String) session.getAttribute("class");
		String manager = "manager";
		System.out.println(mclass);
	%>
	<header>
		<div class="wrapper">
			<h1>부경대 음식점 정보</h1>
			<nav>
				<ul class="menu">
					<li><a href="type.jsp">분류별</a></li>
					<li><a href="restaurant.jsp">모든 음식점</a></li>
					<%
						if (mclass != null && mclass.equals(manager)) {
					%>
					<li><a href="manager.jsp">관리자용</a></li>
					<%
						}
					%>
					<li><a href="logout.jsp">로그아웃</a></li>
					<li>
						<form action="search.jsp">
							<div class="search">
								<div class="searchForm">
									<input name="search" type="text" placeholder="음식점 검색">
								</div>
								<div class="searchButton">
									<!-- <input type="submit"> -->
									<input type="image" src="img/search.png" name="submit" value="submit">
								</div>
							</div>
						</form>
					</li>
				</ul>
			</nav>
		</div>
	</header>

</body>
</html>