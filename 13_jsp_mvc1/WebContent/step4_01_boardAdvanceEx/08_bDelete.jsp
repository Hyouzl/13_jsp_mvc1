<%@page import="step4_00_boardEx.BoardAdvanceDao"%>
<%@page import="step4_00_boardEx.BoardAdvanceDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>08_bDelete</title>
</head>
<body>

	<%
		int num = Integer.parseInt(request.getParameter("num"));
		BoardAdvanceDto boardAdvanceDto =  BoardAdvanceDao.getInstance().getOneUpdateBoard(num);
	%>

	<div align="center" style="padding-top: 100px">
		<form action="09_bDeletePro.jsp" method="post">
			<h1>게시글 삭제</h1>
			<br>
			<table style="width: 700px" border="1">
				<tr>
					<td>작성자</td>
					<td><%=boardAdvanceDto.getWriter()%></td>
				</tr>
				<tr>
					<td>작성일</td>
					<td><%=boardAdvanceDto.getRegDate()%></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><%=boardAdvanceDto.getSubject()%></td>
				</tr>
				<tr>
					<td>패스워드</td>
					<td><input type="password" name="password" size="60"></td>
				</tr>
				<tr align="right">
					<td colspan="2">
						<input type="hidden" name="num" value="<%=boardAdvanceDto.getNum()%>">
						<input type="submit" value="글삭제">
						<input type="button" onclick="location.href='04_bList.jsp'" value="목록보기">
					</td>
				</tr>
			</table>
		</form>
	</div>
	
</body>
</html>