<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
   
    request.setCharacterEncoding("UTF-8");
    //response.setContentType("text/html;charset=UTF-8");
	request.getParameter("name");
    request.getParameter("residentNumber1");
    request.getParameter("residentNumber2");
    request.getParameter("email");
    request.getParameter("email1");
    String telecom=request.getParameter("telecom");
    String tel=request.getParameter("tel");
    String phone=request.getParameter("phone");

   // 전화번호에서 하이픈 제거
    phone = phone.replaceAll("-", "");

%>


결과<br>
       이름 : ${param.name}<br>
	   주민번호 : ${param.residentNumber1}-${param.residentNumber2}XXXXXX<br>
	   <% if ("알뜰".equals(telecom)) { %>
<%= tel %>
<% } else { %>
<%= telecom %>
<% } %>
	   <%=phone %><br>
	   ${param.email}@${param.email1 }<br>
</body>
</html>