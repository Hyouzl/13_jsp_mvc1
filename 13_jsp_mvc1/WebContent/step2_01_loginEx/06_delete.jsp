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
		String id = (String)session.getAttribute("id");
		
	%>
	
	<form action="07_deletePro.jsp" method="post"> 
		<fieldset>
			<legend>Delete Member '<%=id %>'</legend>
			<p>Id : <input type="text" name="id" value="<%=id%>" readonly></p>
			<p>password : <input type="password" name="passwd"></p>
			<p><input type="submit" value="delete"></p>
		</fieldset>
	</form>

</body>
</html>