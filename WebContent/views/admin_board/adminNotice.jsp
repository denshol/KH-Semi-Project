<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,com.semi.board.model.vo.Board,com.semi.product.model.vo.Attachment"%>
<%
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	Integer bno = (Integer)session.getAttribute("bno");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminItems</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<link rel="stylesheet" href="resources/adminPage_files/cssFolder/admin_category.css">
	<link rel="stylesheet" href="resources/adminPage_files/cssFolder/admin_notice.css">
	<style>
	
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
				<form action="" method="post">
					<select name="ms_select" id="ms_select">
						<option value="1">게시글 번호</option>
						<option value="2">제목</option>
					</select>
						<input type="search" name="memberSearch" id="memberSearch">
						<button id="ms_img"></button>
				</form>
			</div>
			<div id="noticeBtn">
				<button onclick="location.href='<%=contextPath%>/insertNotice.admin'">공지사항 등록</button>
			</div>
		</div>
		<div class="middle_left">
			<div id="ml_table">
				<table class="list-area">
					<thead>
					<%if(list.isEmpty()) {%>
						<tr>
							<th style="font-size: 18px;">
								현재 존재하는 공지사항이 없습니다.
							</th>
						</tr>
					<%}else {%>
						<tr id="ml_tr">
							<th>게시글 번호</th>
							<th>작성자</th>
							<th>제목</th>
							<th>내용</th>
							<th>조회수</th>
							<th>작성 일시</th>
						</tr>
					</thead>
					<tbody>
						<%for(Board b : list) {%>
						<tr>
							<td><%=b.getBoardNo()%></td>
							<td><%=b.getMemberNo()%></td>
							<td><%=b.getBoardTitle()%></td>
							<td><%=b.getBoardContent()%></td>
							<td><%=b.getBoardCount()%></td>
							<td><%=b.getCreateDate()%></td>
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
					공지사항 상세조회
				</div>

				<div class="modal_header">
					
				</div>

				<div id="modal_member">
					공지사항
				</div>

				<div class="modal_body">

					<div>
						게시글 번호
						<div>
							
						</div>
					</div>
					
					<div>
						작성자
						<div>
							
						</div>
					</div>
					
					<div>
						공지사항 제목
						<div>
							
						</div>
					</div>
					
					<div>
						공지사항 내용
						<div id="noticeContent_area">
							<%for(int i=0; i<4; i++) {%>
								<div id="imgDiv">
									<img id="imgNotice<%=i%>">
								</div>
							<%} %>
						<div id="noticeText">
							
						</div>
						</div>
					</div>
					
					<div>
						조회수
						<div>
							
						</div>
					</div>
					
					<div>
						작성 일시
						<div>
							
						</div>
					</div>
					
				</div>
				<form action="<%=contextPath%>/noticeUpdate.admin" method="get">
				<input type="hidden" name="boardNo" id="boardNo" value="">
					<div class="modal_footer">
						<button type="submit">공지 수정</button>
						<button onclick="locatcion.href='<%=contextPath%>/deleteNotice.admin'">공지 삭제</button>
					</div>
				</form>
			</div>
		</div>
		
		<!-- ==================== 스크립트 ==================== -->

		<script>
			$(function(){
				
			$(".list-area>tbody>tr").click(function(){
				//게시글번호 추출
				
				if(<%=bno%>==null){
					var bno = $(this).children().eq(0).text();
				}else{
					var bno = <%=bno%>;
				}
				
				//hidden에 게시글번호 담기
				$("#boardNo").val(bno);
				
				//첨부파일 뿌리기
				$.ajax({
					
					url : "detailNotice.admin?bno="+bno,
					
					type : "post",
					
					success : function(result){
						
						for(var i=0; i<result.length; i++){
							//경로 변수처리
							var path = result[i].attachmentPath + result[i].attachmentChange;
							$(".modal_body").children().children().eq(3).children().children().eq(i).attr('src',"<%=contextPath%>"+path);
							$("#imgNotice"+i).attr('src',"<%=contextPath%>"+path);
						}
					},
					
					error : function(){
						console.log("공지조회 실패");
					}
				});
				
				//결과에 따른 조회값 뿌리기 (모달 상세조회)
				$.ajax({
					
					url : "detailNotice.admin?bno="+bno,
					
					type : "get",
					
					success : function(result){
						console.log($(".modal_body").children().eq(3).children().text());
						$(".modal_body").children().children().eq(0).text(result.boardNo);
						$(".modal_body").children().children().eq(1).text(result.memberNo);
						$(".modal_body").children().children().eq(2).text(result.boardTitle);
						$("#noticeText").text(result.boardContent);
						$(".modal_body").children().children().eq(4).text(result.boardCount);
						$(".modal_body").children().children().eq(5).text(result.createDate);
					},
					
					error : function(){
						console.log("공지조회 실패");
					}
				});
			});
			});
			//모달 보이기/숨기기 기능
			$(function(){
				
				if(<%=bno%>!=null){
					
					$(".list-area>tbody>tr").click();
					$(".modal").fadeIn();
				}
				
				
				$(".list-area>tbody>tr").click(function(){
					$(".modal").fadeIn();
				});
				
				$(".modal_content,.modal").click(function(){
					$(".modal").fadeOut();
					
					
					<%session.removeAttribute("bno");%>
				});
			});
		</script>
		
</div>
</body>
</html>