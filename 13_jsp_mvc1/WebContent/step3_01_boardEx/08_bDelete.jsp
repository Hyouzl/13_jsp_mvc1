<%@page import="step3_00_boardEx.BoardDao"%>
<%@page import="step3_00_boardEx.BoardDto"%>
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
		BoardDto boardDto = BoardDao.getInstance().getOneBoard(Integer.parseInt(request.getParameter("num")));
	%>

	<form action="09_bDeletePro.jsp" method="post">
		<h2>게시글 삭제하기</h2>
		<table border="1">
			<tr>
				<td>작성자</td>
				<td><%=boardDto.getWriter() %></td>
			</tr>
			<tr>
				<td>작성일</td>
				<td><%=boardDto.getDate() %></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><%=boardDto.getSubject() %></td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td colspan="4">
					<input type="hidden" name="num" value="<%=boardDto.getNum()%>">
					<input type="submit" value="글삭제">
					<input type="button" onclick="location.href='04_bList.jsp'" value="목록보기">
				</td>
			</tr>
		</table>
	</form>

</body>
</html>