<%@page import="step3_00_boardEx.BoardDto"%>
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
		BoardDto boardDto = BoardDao.getInstance().getOneBoard(Integer.parseInt(request.getParameter("num")));
	%>

	<form action="07_bUpdatePro.jsp" method="post" >
		<h1>게시글 수정하기</h1>
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
				<td><input type="text" name="subject" value="<%=boardDto.getSubject()%>"/></td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td><input type="password" name="password"/></td>
			</tr>
			<tr>
				<td>글내용</td>
				<td><textarea rows="10" cols="50" name="content"><%=boardDto.getContent()%></textarea></td>
			</tr>
		</table>
		<p>
			<input type="hidden" name="num" value="<%=boardDto.getNum()%>"/>
			<input type="submit" value="글수정" />
			<input type="button" onclick="location.href='04_bList.jsp'" value="전체글보기" />
		</p>
	</form>

</body>
</html>