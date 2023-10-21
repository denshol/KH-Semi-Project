<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminItems</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<link rel="stylesheet" href="resources/adminPage_files/cssFolder/admin_main.css">
	<link rel="stylesheet" href="resources/adminPage_files/cssFolder/admin_coupon.css">
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
					<option value="">쿠폰번호</option>
					<option value="">쿠폰명</option>
					<option value="">할인율</option>
					<option value="">쿠폰기간</option>
					<option value="">등록일</option>
					<option value="">상태값</option>
				</select>
				<input type="search" name="memberSearch" id="memberSearch">
				<button id="ms_img"></button>
			</div>
			<div id="insert_coupon">
				<button id="insert_coupon">쿠폰 등록</button>
			</div>
		</div>
		<div class="middle_left">
			<div id="ml_table">
				<table>
					<thead>
						<tr id="ml_tr">
							<th>쿠폰번호</th>
							<th>쿠폰명</th>
							<th>할인율</th>
							<th>쿠폰기간</th>
							<th>등록일</th>
							<th>상태값</th>
							<th id="delboxSize2">
								<input type="checkbox" name="delBox" id="">
							</th>
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
							<td id="delboxSize"><input type="checkbox" name="delBox" id=""></td>
						</tr>
						<tr>
							<td>게시글 번호</td>
							<td>제목</td>
							<td>작성일</td>
							<td>작성일</td>
							<td>작성일</td>
							<td>작성일</td>
							<td id="delboxSize"><input type="checkbox" name="delBox" id=""></td>
						</tr>
						<tr>
							<td>게시글 번호</td>
							<td>제목</td>
							<td>작성일</td>
							<td>작성일</td>
							<td>작성일</td>
							<td>작성일</td>
							<td id="delboxSize"><input type="checkbox" name="delBox" id=""></td>
						</tr>
						<tr>
							<td>게시글 번호</td>
							<td>제목</td>
							<td>작성일</td>
							<td>작성일</td>
							<td>작성일</td>
							<td>작성일</td>
							<td id="delboxSize"><input type="checkbox" name="delBox" id=""></td>
						</tr>
						<tr>
							<td>게시글 번호</td>
							<td>제목</td>
							<td>작성일</td>
							<td>작성일</td>
							<td>작성일</td>
							<td>작성일</td>
							<td id="delboxSize"><input type="checkbox" name="delBox" id=""></td>
						</tr>
						<tr>
							<td>게시글 번호</td>
							<td>제목</td>
							<td>작성일</td>
							<td>작성일</td>
							<td>작성일</td>
							<td>작성일</td>
							<td id="delboxSize"><input type="checkbox" name="delBox" id=""></td>
						</tr>
						<tr>
							<td>게시글 번호</td>
							<td>제목</td>
							<td>작성일</td>
							<td>작성일</td>
							<td>작성일</td>
							<td>작성일</td>
							<td id="delboxSize"><input type="checkbox" name="delBox" id=""></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="select_del">
				<button>선택 삭제</button>
			</div>
		</div>
		
		<div class="bottom">
		
			<%@include file="/views/common/footer.jsp"%>
			
		</div>
</div>
</body>
</html>