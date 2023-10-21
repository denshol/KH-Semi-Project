<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminItems</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<link rel="stylesheet" href="resources/adminPage_files/cssFolder/admin_main.css">
	<link rel="stylesheet" href="resources/adminPage_files/cssFolder/admin_recommend.css">
</head>
<body>
	<div class="wrap">
		
		<%@include file="/views/common/admin_Category.jsp" %>
	
		<div class="top">
				<table>
					<tr>
						<td onclick="location.href='<%=contextPath%>/discount.admin'">할인 적용</td>
						<td onclick="location.href='<%=contextPath%>/recommend.admin'">추천상품 적용</td>
						<td onclick="location.href='<%=contextPath%>/coupon.admin'">쿠폰 관리</td>
						<td onclick="location.href='<%=contextPath%>/event.admin'">이벤트 관리</td>
					</tr>
				</table>
		</div>
		<div class="middle">
			<div id="mid_search">
				<select name="ms_select" id="ms_select">
					<option value="">상품 아이디</option>
					<option value="">도서명</option>
					<option value="">가격</option>
					<option value="">카테고리</option>
					<option value="">출판사</option>
					<option value="">상품재고</option>
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
							<th>상품 아이디</th>
							<th>도서명</th>
							<th>가격</th>
							<th>카테고리</th>
							<th>출판사</th>
							<th>상품재고</th>
							<th>할인율</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>게시글 번호</td>
							<td>제목</td>
							<td>작성일</td>
							<td>작성일</td>
							<td>작성일</td>
							<td>작성일</td>
							<td>작성일</td>
						</tr>
						<tr>
							<td>게시글 번호</td>
							<td>제목</td>
							<td>작성일</td>
							<td>작성일</td>
							<td>작성일</td>
							<td>작성일</td>
							<td>작성일</td>
						</tr>
						<tr>
							<td>게시글 번호</td>
							<td>제목</td>
							<td>작성일</td>
							<td>작성일</td>
							<td>작성일</td>
							<td>작성일</td>
							<td>작성일</td>
						</tr>
						<tr>
							<td>게시글 번호</td>
							<td>제목</td>
							<td>작성일</td>
							<td>작성일</td>
							<td>작성일</td>
							<td>작성일</td>
							<td>작성일</td>
						</tr>
						<tr>
							<td>게시글 번호</td>
							<td>제목</td>
							<td>작성일</td>
							<td>작성일</td>
							<td>작성일</td>
							<td>작성일</td>
							<td>작성일</td>
						</tr>
						<tr>
							<td>게시글 번호</td>
							<td>제목</td>
							<td>작성일</td>
							<td>작성일</td>
							<td>작성일</td>
							<td>작성일</td>
							<td>작성일</td>
						</tr>
						<tr>
							<td>게시글 번호</td>
							<td>제목</td>
							<td>작성일</td>
							<td>작성일</td>
							<td>작성일</td>
							<td>작성일</td>
							<td>작성일</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="insert_event">
				<button>추천상품 변경</button>
			</div>
		</div>

		<div class="bottom">
		
			<%@include file="/views/common/footer.jsp"%>
			
		</div>
</div>
</body>
</html>