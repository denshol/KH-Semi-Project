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
	<link rel="stylesheet" href="resources/adminPage_files/cssFolder/admin_faq.css">
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
					<option value="">제목</option>
					<option value="">작성일</option>
				</select>
				<input type="search" name="memberSearch" id="memberSearch">
				<button id="ms_img"></button>
			</div>
			<div id="noticeBtn">
				<button onclick="location.href='<%=contextPath%>/faqInsert.admin'">FAQ 등록</button>
			</div>
		</div>
		<div class="middle_left">
			<div id="ml_table">
				<div id="FAQLine">
					자주 묻는 질문 (FAQ)
				</div>
				
				<div class="faq_box">
					<ul>
					<%if(list.isEmpty()){%>
						<li>
							<p style="font-size: 18px;">현재 등록된 FAQ가 없습니다.</p>
						</li>
					<%}else{ %>
						<%for(Board b : list){ %>
						<li>
						<div class="faq_box_question">
							<span>
								<label style="font-size: 22px; font-weight: 600;">Q</label>. <%=b.getBoardTitle() %>
							</span>
							<div>
								<button id="upFaq" onclick="location.href='<%=contextPath%>/updateFaq.admin?bno=<%=b.getBoardNo()%>'">수정</button>
								<button id="delFaq" onclick="location.href='<%=contextPath%>/deleteFaq.admin?bno=<%=b.getBoardNo()%>'">삭제</button>
							</div>
						</div>
						
						<div class="faq_box_answer">
							<div>
								<%=b.getBoardContent() %>
							</div>
						</div>
						<%} %>
					<%} %>
					</ul>
				</div>
			</div>
		</div>

		<script>
			$(function(){
				
			  $('.faq_box > ul > li').click(function() {
			   	var $this = $(this);
			    
			    $this.siblings('.hover').find(' > .faq_box_answer').stop().slideUp(300); 
			    $this.siblings('.hover').removeClass('hover');
			    
			    if ( $this.hasClass('hover') ) {
			      $this.find(' > .faq_box_answer').stop().slideUp(300); 
			      $this.removeClass('hover');
			    }
			    else {
			      $this.find(' > .faq_box_answer').stop().slideDown(300); 
			      $this.addClass('hover');
			    }
			  });
			  
			  $('.faq_box_answer').click(function() {
			    return false;
			  });
			  
			})
		</script>

		<div class="bottom">
		
			<%@include file="/views/common/footer.jsp"%>
			
		</div>
</div>
</body>
</html>