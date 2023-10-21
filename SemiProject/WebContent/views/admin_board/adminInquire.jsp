<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,com.semi.board.model.vo.Board"%>
    
<%
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminItems</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<link rel="stylesheet" href="resources/adminPage_files/cssFolder/admin_main.css">
	<link rel="stylesheet" href="resources/adminPage_files/cssFolder/admin_inquire.css">
</head>
<body>
	<div class="wrap">
		
		<%@include file="/views/common/admin_Category.jsp" %>
	
		<div class="top">
				<table>
					<tr>
						<td onclick="location.href='<%=contextPath%>/notice.admin'">공지사항</td>
						<td onclick="location.href='<%=contextPath%>/inquire.admin'">1:1 문의</td>
						<td onclick="location.href='<%=contextPath%>/faq.admin'">FAQ 관리</td>
					</tr>
				</table>
		</div>
		<div class="middle">
			<div id="mid_search">
				<select name="ms_select" id="ms_select">
					<option value="">게시글 번호</option>
					<option value="">상품번호</option>
					<option value="">제목</option>
					<option value="">작성자(아이디)</option>
					<option value="">작성일</option>
				</select>
				<input type="search" name="memberSearch" id="memberSearch">
					<button id="ms_img"></button>
			</div>
		</div>
		<div class="middle_left">
			<div id="ml_table">
				<table class="list-area">
					<thead>
					<%if(list.isEmpty()) {%>
						<tr>
							<th style="font-size: 18px;">
								현재 등록된 문의사항이 없습니다.
							</th>
						</tr>
					<%}else {%>
					
						<tr id="ml_tr">
							<th>게시글 번호</th>
							<th>상품번호</th>
							<th>제목</th>
							<th>문의 내용</th>
							<th>작성자(아이디)</th>
							<th>답변내용</th>
							<th>작성일</th>
							<th>답변 상태</th>
						</tr>
					</thead>
					<tbody>
					<%for(Board b : list) {%>
						<tr>
							<td><%=b.getBoardNo()%></td>
							<td><%=b.getProductNo()%></td>
							<td><%=b.getBoardTitle() %></td>
							<td><%=b.getBoardContent() %></td>
							<td><%=b.getMemberNo() %></td>
							<td><%=b.getBoardAnswered() %></td>
							<td><%=b.getCreateDate() %></td>
							
							<%if(b.getBoardAnswered() != null) {%>
								<td id="gba">Y</td>
							<%}else {%>
								<td id="gba" style="color: red; font-weight: bold">N</td>
							<%} %>
						</tr>
						<%} %>
					<%} %>	
					</tbody>
				</table>
			</div>
		</div>
		
		<script>
			$(function(){
				$(".list-area>tbody>tr").click(function(){
					var bno = $(this).children().eq(0).text();
					location.href='<%=contextPath%>/inquireAnswer.admin?bno='+bno;
				});
			});
		</script>

		<div class="bottom">
		
			<%@include file="/views/common/footer.jsp"%>
			
		</div>
</div>
</body>
</html>