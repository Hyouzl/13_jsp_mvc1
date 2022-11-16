
<%@page import="step3_00_boardEx.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>03_bWritePro</title>
</head>
<body>
	
	<%
		request.setCharacterEncoding("utf-8"); // 인코딩은 무조건 해주기
		
		//BoardDto boardDto = new BoardDto();
		//boardDto.setWriter(request.getParameter("writer"));
		//boardDto.setSubject(request.getParameter("subject"));
		//boardDto.setEmail(request.getParameter("email"));
		//boardDto.setPassword(request.getParameter("password"));
		//boardDto.setContent(request.getParameter("content"));
	%>
		<jsp:useBean id="boardDto" class="step3_00_boardEx.BoardDto">
			<jsp:setProperty property="*" name="boardDto"/>
		</jsp:useBean>
		
	<%	
		BoardDao.getInstance().insertBoard(boardDto);
	%>
	
	<script>
		alert("등록되었습니다.");
		location.href = "02_bWrite.jsp";
	</script>



</body>
</html>