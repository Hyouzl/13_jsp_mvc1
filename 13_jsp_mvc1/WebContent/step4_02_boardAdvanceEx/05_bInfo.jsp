<%@page import="step4_00_boardEx.BoardAdvanceDto"%>
<%@page import="step4_00_boardEx.BoardAdvanceDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>05_bInfo</title>
</head>
<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css">
</head>
<body>

	<%
		int num = Integer.parseInt(request.getParameter("num"));
		BoardAdvanceDto boardAdvanceDto = BoardAdvanceDao.getInstance().getOneBoard(num);
	%>
	
	<div align="center" style="padding-top: 100px">
		<div class="bs-docs-section">
			<div class="row">
				<div class="col-lg-12">
					<div class="page-header" align="center">
						<h1>게시글 보기</h1>
						<br>
					</div>
					<div class="bs-component">
						<table class="table table-hover" style="width: 700px; text-align: center">
							<colgroup>
								<col width="20%">
								<col width="80%">
							</colgroup>
							<tr class="table-default">
								<td>글번호</td>
								<td><%=boardAdvanceDto.getNum()%></td>
							</tr>
							<tr class="table-default">
								<td>조회수</td>
								<td><%=boardAdvanceDto.getReadCount()%></td>
							</tr>
							<tr class="table-default">
								<td>작성자</td>
								<td><%=boardAdvanceDto.getWriter()%></td>
							</tr>
							<tr class="table-default">
								<td>작성일</td>
								<td><%=boardAdvanceDto.getRegDate()%></td>
							</tr>
							<tr class="table-default">
								<td>이메일</td>
								<td><%=boardAdvanceDto.getEmail()%></td>
							</tr>
							<tr class="table-default">
								<td>제목</td>
								<td><%=boardAdvanceDto.getSubject()%></td>
							</tr>
							<tr class="table-default">
								<td>글 내용</td>
								<td><%=boardAdvanceDto.getContent()%></td>
							</tr>
							<tr class="table-default">
								<td colspan="2">
									<input type="button" class="btn btn-primary btn-sm" value="답글쓰기" onclick="location.href='10_bRe.jsp?num=<%=boardAdvanceDto.getNum()%>'"> 
									<input type="button" class="btn btn-primary btn-sm" value="수정하기" onclick="location.href='06_bUpdate.jsp?num=<%=boardAdvanceDto.getNum()%>'">
									<input type="button" class="btn btn-primary btn-sm" value="삭제하기" onclick="location.href='08_bDelete.jsp?num=<%=boardAdvanceDto.getNum()%>'">
									<input type="button" class="btn btn-primary btn-sm" value="목록보기" onclick="location.href='04_bList.jsp'">
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>