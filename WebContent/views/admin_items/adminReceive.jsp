<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminItems</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<link rel="stylesheet" href="resources/adminPage_files/cssFolder/admin_category.css">
	<link rel="stylesheet" href="resources/adminPage_files/cssFolder/admin_receive.css">
</head>
<body>
	<div class="wrap">
		
		<%@include file="/views/common/admin_Category.jsp" %>
	
		<div class="top">
				<table>
					<tr>
						<td onclick="location.href='<%=contextPath%>/receive.admin'">입고 조회</td>
						<td onclick="location.href='<%=contextPath%>/release.admin'">출고 조회</td>
						<td onclick="location.href='<%=contextPath%>/items.admin'">상품 관리</td>
					</tr>
				</table>
		</div>
		<div class="middle">
			<div id="mid_search">
				<form action="" method="post">
					<select name="ms_select" id="ms_select">
						<option value="1">입고 번호</option>
						<option value="2">상품 번호</option>
						<option value="3">입고량</option>
						<option value="4">입고상태</option>
						<option value="5">회원아이디</option>
					</select>
						<input type="search" name="memberSearch" id="memberSearch">
						<button id="ms_img"></button>
				</form>
			</div>
		</div>
		<div class="middle_left">
			<div id="ml_table">
				<table class="list-area">
					<thead>
						<tr id="ml_tr">
							<th>입고 번호</th>
							<th>상품 번호</th>
							<th>주문 번호</th>
							<th>입고량</th>
							<th>입고 상태</th>
							<th>회원 아이디</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		
		<div class="bottom">
		
			<%@include file="/views/common/footer.jsp"%>
			
		</div>
	</div>	
</div>
</body>
</html>