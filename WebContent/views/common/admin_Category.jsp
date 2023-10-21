<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();

	String alertMsg = (String)session.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminPage</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<link rel="stylesheet" href="resources/adminPage_files/cssFolder/admin_category.css">
</head>
<body>

	<script>
		var alertMsg = "<%=alertMsg%>"
		
		if(alertMsg != "null"){
			alert(alertMsg);
			
			//사용후 지워주기
			<%session.removeAttribute("alertMsg");%>
		}
	</script>

	<div>
		<div class="main_category">
			<ul>
				<li id="mc_admin">ADMIN</li>
				<hr>
				<li id="mc_admin_detail"><span>관리자 계정 접속중</span></li>
				<li id="mc_admin_logout">
					<button onclick="location.href='<%=contextPath%>/logout.me'">
						로그아웃
					</button>
				</li>
				<hr>
				<li>
				<img src="resources/adminPage_files/iconFolder/user_icon.png" id="mc_img">
				<button id="mc_btn" onclick="location.href='<%=contextPath%>/member.admin'">회원 관리</button>
				</li>
				<li id="items">
					<img src="resources/adminPage_files/iconFolder/item_icon.png" id="mc_img">
					<button id="mc_btn2">상품 관리</button>
					<img src="resources/adminPage_files/iconFolder/arrow_icon.png" id="mc_img3">
					<ul id="mc_navi">
						<li><a href="<%=contextPath%>/receive.admin">입고 조회</a></li>
						<li><a href="<%=contextPath%>/release.admin">출고 조회</a></li>
						<li><a href="<%=contextPath%>/items.admin">상품 관리</a></li>
					</ul>
				</li>
				<li>
					<img src="resources/adminPage_files/iconFolder/order_icon.png" id="mc_img">
					<button id="mc_btn" onclick="location.href='<%=contextPath%>/order.admin'">주문 관리</button>
				</li>
				<li id="items2">
					<img src="resources/adminPage_files/iconFolder/board_icon.png" id="mc_img2">
					<button id="mc_btn3">게시판 관리</button>
					<img src="resources/adminPage_files/iconFolder/arrow_icon.png" id="mc_img3">
					<ul id="mc_navi2">
						<li><a href="<%=contextPath%>/notice.admin">공지사항</a></li>
						<li><a href="<%=contextPath%>/inquire.admin">1:1 문의</a></li>
						<li><a href="<%=contextPath%>/faq.admin">FAQ 관리</a></li>
					</ul>
				</li>
				<li id="items3">
					<img src="resources/adminPage_files/iconFolder/event_icon.png" id="mc_img2">
					<button id="mc_btn3">이벤트 관리</button>
					<img src="resources/adminPage_files/iconFolder/arrow_icon.png" id="mc_img3">
					<ul id="mc_navi3">
						<li><a href="<%=contextPath%>/discount.admin">할인 적용</a></li>
						<li><a href="<%=contextPath%>/recommend.admin">추천상품 적용</a></li>
						<li><a href="<%=contextPath%>/coupon.admin">쿠폰 관리</a></li>
						<li><a href="<%=contextPath%>/event.admin">이벤트 관리</a></li>
					</ul>
				</li>
			</ul>
		</div>
		<script>

			$(function(){
				$('#items').click(function(){
					$('#mc_navi').toggle(540);
				});
			});

			$(function(){
				$('#items2').click(function(){
					$('#mc_navi2').toggle(540);
				});
			});

			$(function(){
				$('#items3').click(function(){
					$('#mc_navi3').toggle(540);
				});
			});
		</script>

		<span id="scroll">
			<a href="#">
				<img src="resources/adminPage_files/iconFolder/upward_icon.png">
			</a>
		</span>

		<script>
			$(window).scroll(function(){
				if($(this).scrollTop() > 150 ){
					$('#scroll').fadeIn();
				}else{
					$('#scroll').fadeOut();
				}
			});
		</script>

</div>
</body>
</html>