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
	print = "ȯ���մϴ�.";
	System.out.println(print);
	response.sendRedirect("type.jsp");
}else if(result==-1){
	print="��й�ȣ�� Ʋ�Ƚ��ϴ�.";
	System.out.println(print);
	response.sendRedirect("index.jsp");
}else if(result==0){
	print="�������� �ʴ� ���̵��Դϴ�.";
	System.out.println(print);
	response.sendRedirect("index.jsp");
}else{
	print="�����ͺ��̽� ����";
	System.out.println(print);
	response.sendRedirect("index.jsp");
}
%>
<%=print %>
<%=session.getAttribute("id") %>
</body>
</html>