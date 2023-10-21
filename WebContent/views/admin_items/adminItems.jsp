<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,com.semi.product.model.vo.Product"%>
    
 <%
 	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminItems</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<link rel="stylesheet" href="resources/adminPage_files/cssFolder/admin_category.css">
	<link rel="stylesheet" href="resources/adminPage_files/cssFolder/admin_items.css">
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
						<option value="1">상품 번호</option>
						<option value="2">상품 카테고리</option>
						<option value="3">상품명</option>
						<option value="4">출판사</option>
						<option value="5">저자</option>
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
					<%if(list.isEmpty()) {%>
						<tr>
							<th style="font-size: 18px;">
								현재 등록된 상품이 없습니다.
							</th>
						</tr>
					<%}else {%>
					
						<tr id="ml_tr">
							<th>상품 번호</th>
							<th>상품 카테고리</th>
							<th>상품명</th>
							<th>출판사</th>
							<th>상품설명</th>
							<th>가격</th>
							<th>할인율</th>
							<th>재고수량</th>
							<th>저자</th>
							<th>등록일</th>
							<th>상태값</th>
						</tr>
					</thead>
					<tbody>
						<%for(Product i : list){ %>
							<tr>
							
							<!-- 상품 카테고리 문자열 처리 -->
							<%
								String category = "";
								switch(i.getProductCategory()){
									case "1" : category = "소설";
										break;
									case "2" : category = "에세이";
										break;
									case "3" : category = "자기계발";
										break;
									case "4" : category = "경제/경영";
										break;
									case "5" : category = "인문학";
										break;
									case "6" : category = "정치/사회";
										break;
									case "7" : category = "아이템";
										break;
								};
							%>
							
								<td><%=i.getProductNo() %></td>
								<td><%=category %></td>
								<td><%=i.getProductName() %></td>
								<td><%=i.getProductPublisher() %></td>
								<td><%=i.getProductText() %></td>
								<td><%=i.getProductPrice() %></td>
								<td><%=i.getProductSalesRate() %></td>
								<td><%=i.getProductStock() %></td>
								<td><%=i.getAuthor() %></td>
								<td><%=i.getCreateDate() %></td>
								<td><%=i.getStatus() %></td>
							</tr>
						<%} %>
					<%} %>
					</tbody>
				</table>
			</div>
		</div>
		
		<div class="bottom">
		
			<%@include file="/views/common/footer.jsp"%>
			
		</div>

				<!-- ========================= 모달 영역 ========================= -->
		
				<div class="modal">
					<div class="modal_content">
						
						<div class="modal_img">
							<img src="resources/adminPage_files/iconFolder/product_icon.png">
						</div>
		
						<div class="modal_header">
							
						</div>
		
						<div id="modal_member">
							상품 정보
						</div>
		
						<div class="modal_body">
		
							<div>
								상품 번호
								<div>
									
								</div>
							</div>
		
							<div>
								상품 카테고리
								<div>
		
								</div>
							</div>
		
							<div>
								상품명
								<div>
									
								</div>
							</div>	
		
							<div>
								출판사
								<div>
									
								</div>
							</div>
		
							<div>
								상품설명
								<div>
									
								</div>
							</div>
		
							<div>
								가격
								<div>
									
								</div>
							</div>
		
							<div>
								할인율
								<div>
									
								</div>
							</div>
		
							<div>
								재고수량
								<div>
									
								</div>
							</div>
		
							<div>
								저자
								<div>
									
								</div>
							</div>
		
							<div>
								등록일
								<div>
									
								</div>
							</div>
		
							<div>
								상태값
								<div>
									
								</div>
							</div>
						</div>
						
						<div class="modal_footer">
							<button onclick="updateItems()">상품 수정</button>
							<button onclick="deleteItems()">상품 삭제</button>
						</div>
					</div>
				</div>


			<!-- ==================== 스크립트 ==================== -->

			<script>
				$(".list-area>tbody>tr").click(function(){
				
					//상품번호 추출
					var pno = $(this).children().eq(0).text();
					
					//검색결과에 따른 조회값 추출 및 삽입
					$.ajax({
						
						url : "detailItems.admin?pno="+pno,
						
						type : "post",
						
						success : function(result){
							
							//상품 카테고리 문자열 처리
							var category = "";
							switch(result.productCategory){
								case '1' : category = "소설"
									break;
								case '2' : category = "에세이"
									break;
								case '3' : category = "자기계발"
									break;
								case '4' : category = "경제/경영"
									break;
								case '5' : category = "인문학"
									break;
								case '6' : category = "정치/사회"
									break;
								case '7' : category = "아이템"
									break;
							};
							
							//해당 영역에 회원 이름 넣기
							$(".modal_header").text(result.memberName);
							
							$(".modal_body").children().children().eq(0).text(result.productNo);
							$(".modal_body").children().children().eq(1).text(category);
							$(".modal_body").children().children().eq(2).text(result.productName);
							$(".modal_body").children().children().eq(3).text(result.productPublisher);
							$(".modal_body").children().children().eq(4).text(result.productText);
							$(".modal_body").children().children().eq(5).text(result.productPrice);
							$(".modal_body").children().children().eq(6).text(result.productSalesRate);
							$(".modal_body").children().children().eq(7).text(result.productStock);
							$(".modal_body").children().children().eq(8).text(result.author);
							$(".modal_body").children().children().eq(9).text(result.createDate);
							$(".modal_body").children().children().eq(10).text(result.status);
						},
						
						error : function(){
							console.log("상품조회 실패");
						}
						
					});
					
				});
				
				
				//모달 보이기/숨기기 기능
				$(function(){
					$(".list-area>tbody>tr").click(function(){
						$(".modal").fadeIn();
					});
					
					$(".modal_content,.modal").click(function(){
						$(".modal").fadeOut();
					});
					
				});	
			</script>	
	</div>	
</div>
</body>
</html>