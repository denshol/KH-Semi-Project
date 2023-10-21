<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminItems</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<link rel="stylesheet" href="resources/adminPage_files/cssFolder/admin_main.css">
	<link rel="stylesheet" href="resources/adminPage_files/cssFolder/admin_order.css">
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
						<td onclick="location.href='<%=contextPath%>/order.admin'">주문 관리</td>
					</tr>
				</table>
		</div>
		<div class="middle">
			<div id="mid_search">
				<select name="ms_select" id="ms_select">
					<option value="">주문번호</option>
					<option value="">수령인</option>
					<option value="">수령주소</option>
					<option value="">전화번호</option>
					<option value="">아이디</option>
					<option value="">상품아이디</option>
					<option value="">주문일자</option>
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
							<th>주문 번호</th>
							<th>수령인</th>
							<th>수령주소</th>
							<th>전화번호</th>
							<th>아이디</th>
							<th>요청사항</th>
							<th>총 가격</th>
							<th>주문일자</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>asd</td>
							<td>asd</td>
							<td>asd</td>
							<td>asd</td>
							<td>asd</td>
							<td>asd</td>
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