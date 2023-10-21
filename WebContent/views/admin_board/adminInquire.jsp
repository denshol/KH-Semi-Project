<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminItems</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<link rel="stylesheet" href="resources/adminPage_files/cssFolder/admin_main.css">
	<link rel="stylesheet" href="resources/adminPage_files/cssFolder/admin_inquire.css">
	<style>
	
	#ms_img{
	     background: url("resources/adminPage_files/iconFolder/search_icon.png") no-repeat center;
	     background-size:;
	     background-color: #3498D8;
	
	}
	</style>
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
				<table>
					<thead>
						<tr id="ml_tr">
							<th>게시글 번호</th>
							<th>상품번호</th>
							<th>제목</th>
							<th>작성자(아이디)</th>
							<th>답변여부</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>2</td>
							<td>3</td>
							<td>4</td>
							<td>asd</td>
							<td>asd</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

		<div class="bottom">
		
			<%@include file="/views/common/footer.jsp"%>
			
		</div>
</div>
</body>
</html>