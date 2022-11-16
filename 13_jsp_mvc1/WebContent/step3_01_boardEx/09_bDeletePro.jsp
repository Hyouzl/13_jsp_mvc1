<%@page import="step3_00_boardEx.BoardDao"%>
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
		request.setCharacterEncoding("utf-8");
	%>	
	
	<jsp:useBean id="boardDto" class="step3_00_boardEx.BoardDto">
		<jsp:setProperty property="*" name="boardDto"/>
	</jsp:useBean>
	
	<%
		boolean isDelete = BoardDao.getInstance().deleteBoard(boardDto);
	
		if (isDelete) {
	%>
			<script>
				alert("삭제되었습니다.");
				location.href="04_bList.jsp";
			</script>
	<%
		} else {
	%>
			<script>
				alert("패스워드를 확인하세요.");
				history.go(-1);
			</script>
	<% 
		}
	
	
	%>

</body>
</html>