<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,com.semi.member.model.vo.Member,com.semi.common.vo.PageInfo"%>
<%
	Member mno = (Member)request.getAttribute("Member");
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list"); //일반 조회 시
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int bar = (int)request.getAttribute("bar");
	int barNum = (int)request.getAttribute("barNum");
	String barSearch = (String)request.getAttribute("barSearch");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminMember</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<link rel="stylesheet" href="resources/adminPage_files/cssFolder/admin_category.css">
	<link rel="stylesheet" href="resources/adminPage_files/cssFolder/admin_member.css">

</head>
<body>
	<div class="wrap">
		
		<%@include file="/views/common/admin_Category.jsp" %>
	
		<div class="top">
				<table>
					<tr>
						<td onclick="location.href='<%=contextPath%>/member.admin?currentPage=1'">회원 조회</td>
					</tr>
				</table>
		</div>
		<div class="middle">
			<div id="mid_search">
				<form action="<%=contextPath%>/searchMember.admin" method="get" id="searchMember-Form" onsubmit="return blankSearch()">
					<input type="hidden" name="currentPage" value="1">
					<select name="ms_select" id="ms_select">
						<option value="1">아이디</option>
						<option value="2">이름</option>
						<option value="3">생년월일</option>
						<option value="4">전화번호</option>
						<option value="5">이메일</option>
						<option value="6">주소</option>
						<option value="7">회원 등급</option>
					</select>
						<input type="search" name="memberSearch" id="memberSearch">
						<button type="submit" id="ms_img"></button>
				</form>
				<script>
					//검색 빈값 프론트에서 처리
					function blankSearch(){
						if($("#memberSearch").val().length == 0) {
							alert("다시 입력해주시길 바랍니다.");
							return false;
						}
					};
				</script>
			</div>
		</div>
		<div class="middle_left">
			<div id="ml_table">
				<table class="list-area">
					<thead>
						<%if(list.isEmpty()) {%>
							<tr>
								<th style="font-size: 18px;">
									현재 존재하는 회원이 없습니다.
								</th>
							</tr>
						<%}else {%>
						<tr id="ml_tr">
							<th>회원 번호</th>
							<th>회원 등급</th>
							<th>사용자구분</th>
							<th>아이디</th>
							<th>비밀번호</th>
							<th>이름</th>
							<th>생년월일</th>
							<th>성별</th>
							<th>전화번호</th>
							<th>이메일</th>
							<th>주소</th>
							<th>적립금</th>
							<th>회원가입일</th>
							<th>정보수정일</th>
							<th>출석체크</th>
							<th>상태값</th>
						</tr>
					</thead>
					<tbody>
							<%for(Member m : list){ %>
							
								<tr>
									<td><%=m.getMemberNo() %></td>
									
									<!-- 회원등급 문자열 처리 -->
										<%
											String grade = "";
										
											switch(m.getGrade()){
												case 1 : grade = "베이직";
													break;
												case 2 : grade = "실버";
													break;
												case 3 : grade = "골드";
													break;
												case 4 : grade = "VIP";
													break;
											};
										%>
										
									<td><%=grade%></td>
									
									<!-- 사용자구분 문자열 처리 -->
									<%
										String role = "";
										
										switch(m.getMemberRole()){
											case 1 : role = "일반회원";
												break;
											case 2 : role = "법인회원";
												break;
											case 3 : role = "관리자";
												break;
										};
									%>
									<td><%=role %></td>
									<td><%=m.getMemberId() %></td>
									<td><%=m.getMemberPwd() %></td>
									<td><%=m.getMemberName() %></td>
									<td><%=m.getMemberBirth() %></td>
									<td><%=m.getGender() %></td>
									<td><%=m.getPhone() %></td>
									<td><%=m.getEmail() %></td>
									<td><%=m.getAddress() %></td>
									<td><%=m.getMemberPoint() %></td>
									<td><%=m.getEnrollDate() %></td>
									<td><%=m.getModifyDate() %></td>
									<td><%=m.getAttendance() %></td>
									<td><%=m.getStatus() %></td>
								</tr>
							<%} %>
						<%} %>
					</tbody>
				</table>
			</div>
			
			<!-- 일반 조회 시 페이징 바 -->
			<%if(bar == 0) {%>
				<div align="center" class="paging-area">
				<!-- 이전 버튼 -->
				<%if(pi.getCurrentPage() != 1) {%>
					<button onclick="location.href='<%=contextPath%>/member.admin?currentPage=<%=pi.getCurrentPage()-1%>'">&lt;</button>
				<%}%>
				
				<!-- 페이징바 -->
				<%for(int i=pi.getStartPage(); i<=pi.getEndPage(); i++){%>
					<%if(i != pi.getCurrentPage()) {%>
						<button onclick="location.href='<%=contextPath%>/member.admin?currentPage=<%=i%>'"><%=i%></button>
					<%}else {%>
						<button disabled><%=i%></button>
					<%} %>
				<%} %>
				
				<!-- 다음 버튼 -->
				<%if(pi.getCurrentPage() != pi.getMaxPage()){%>
					<button onclick="location.href='<%=contextPath%>/member.admin?currentPage=<%=pi.getCurrentPage()+1%>'">&gt;</button>
				<%}%>
				</div>
				
			<!--  ===== ===== ===== 검색기능 사용시 페이징 바 ===== ===== ===== -->
			<%}else{ %>
				<div align="center" class="paging-area">
				<!-- 이전 버튼 -->
				<%if(pi.getCurrentPage() != 1) {%>
					<button onclick="location.href='<%=contextPath%>/searchMember.admin?currentPage=<%=pi.getCurrentPage()-1%>&barNum=<%=barNum%>&barSearch=<%=barSearch%>'">&lt;</button>
				<%}%>
				
				<!-- 페이징바 -->
				<%for(int i=pi.getStartPage(); i<=pi.getEndPage(); i++){%>
					<%if(i != pi.getCurrentPage()) {%>
						<button onclick="location.href='<%=contextPath%>/searchMember.admin?currentPage=<%=i%>&barNum=<%=barNum%>&barSearch=<%=barSearch%>'"><%=i%></button>
					<%}else {%>
						<button disabled><%=i%></button>
					<%} %>
				<%} %>
				
				<!-- 다음 버튼 -->
				<%if(pi.getCurrentPage() != pi.getMaxPage()){%>
					<button onclick="location.href='<%=contextPath%>/searchMember.admin?currentPage=<%=pi.getCurrentPage()+1%>&barNum=<%=barNum%>&barSearch=<%=barSearch%>'">&gt;</button>
				<%}%>
				</div>
			<%} %>
			
			
		</div>
		
		<div class="bottom">
		
			<%@include file="/views/common/footer.jsp"%>
			
		</div>
		
		<!-- ========================= 모달 영역 ========================= -->
		
		<div class="modal">
			<div class="modal_content">
				
				<div class="modal_img">
					<img src="resources/adminPage_files/iconFolder/member_icon.png">
				</div>

				<div class="modal_header">
					
				</div>

				<div id="modal_member">
					회원 정보
				</div>

				<div class="modal_body">

					<div>
						회원 번호
						<div>
							
						</div>
					</div>

					<div>
						회원 등급
						<div>

						</div>
					</div>

					<div>
						사용자 구분
						<div>
							
						</div>
					</div>	

					<div>
						아이디
						<div>
							
						</div>
					</div>

					<div>
						비밀번호
						<div>
							
						</div>
					</div>

					<div>
						이름
						<div>
							
						</div>
					</div>

					<div>
						생년월일
						<div>
							
						</div>
					</div>

					<div>
						성별
						<div>
							
						</div>
					</div>

					<div>
						전화번호
						<div>
							
						</div>
					</div>

					<div>
						이메일
						<div>
							
						</div>
					</div>

					<div>
						주소
						<div>
							
						</div>
					</div>

					<div>
						적립금
						<div>
							
						</div>
					</div>

					<div>
						회원가입일
						<div>
							
						</div>
					</div>

					<div>
						정보수정일
						<div>
							
						</div>
					</div>

					<div>
						출석체크
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
					<button onclick="updateMember()">회원 수정</button>
					<button onclick="deleteMember()">회원 삭제</button>
				</div>
			</div>
		</div>
		
				
		<!-- ==================== 회원 삭제 (모달) ==================== -->

		<div class="modal_delete">
			<form action="<%=contextPath%>/delete.admin" method="post">
				<input type="hidden" id="hiddenNo" name="memberNo" value="" >
			<div class="modal_delete_content">
				<div class="modal_delete_header">
					<img src="resources/adminPage_files/iconFolder/delete_icon.png">
				</div>
				<div class="modal_delete_body">
					정말 삭제 하시겠습니까?
				</div>
				<div class="modal_delete_footer">
					<input type="submit" value="삭제" id="delsub">
					<button type="button" id="delbtn" onclick="delbutton()">취소</button>
				</div>
			</div>
			</form>	
		</div>
		
		<!-- ==================== 스크립트 ==================== -->

		<script>
		
			$(".list-area>tbody>tr").click(function(){
				
				//회원번호 추출
				var mno = $(this).children().eq(0).text();
				
				//검색결과에 따른 조회값 
				$.ajax({
					
					url : "detail.admin?mno="+mno,
					
					type : "get",
					
					success : function(result){
						
						//해당 영역에 회원 이름 넣기
						$(".modal_header").text(result.memberName);
						
						//회원등급 문자열처리
						var grade = "";
						
						switch(result.grade){
							case 1 : grade = "베이직"
								break;
							case 2 : grade = "실버"
								break;
							case 3 : grade = "골드"
								break;
							case 4 : grade = "VIP"
								break;
						};

						//사용자구분 문자열 처리
						var role = "";
						
						switch(result.memberRole){
							case 1 : role = "일반회원"
								break;
							case 2 : role = "법인회원"
								break;
							case 3 : role = "관리자"
								break;
						};
						$(".modal_body").children().children().eq(0).text(result.memberNo);
						$(".modal_body").children().children().eq(1).text(grade);
						$(".modal_body").children().children().eq(2).text(role);
						$(".modal_body").children().children().eq(3).text(result.memberId);
						$(".modal_body").children().children().eq(4).text(result.memberPwd);
						$(".modal_body").children().children().eq(5).text(result.memberName);
						$(".modal_body").children().children().eq(6).text(result.memberBirth);
						$(".modal_body").children().children().eq(7).text(result.gender);
						$(".modal_body").children().children().eq(8).text(result.phone);
						$(".modal_body").children().children().eq(9).text(result.email);
						$(".modal_body").children().children().eq(10).text(result.address);
						$(".modal_body").children().children().eq(11).text(result.memberPoint);
						$(".modal_body").children().children().eq(12).text(result.enrollDate);
						$(".modal_body").children().children().eq(13).text(result.modifyDate);
						$(".modal_body").children().children().eq(14).text(result.attendance);
						$(".modal_body").children().children().eq(15).text(result.status);
					},
					
					error : function(){
						console.log("회원조회 실패");
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
			
			//회원상세조회 모달창에서 회원 수정 버튼 클릭시
			function updateMember(){
				
				$(".modal_update").fadeIn();
				
				//회원번호 추출
				var umno = $(".modal_body").children().children().eq(0).text();
				
				//해당 ajax는 input값에 넣어줄 조회용 데이터 추출 및 삽입
				$.ajax({
					
					url : "updateMember.admin?umno="+umno,
					
					type : "get",
					
					success : function(result){
						
						//회원 이름은 위에서 처리 완료
						//회원등급 문자열처리
						var grade = "";
						
						switch(result.grade){
							case 1 : grade = "베이직"
								break;
							case 2 : grade = "실버"
								break;
							case 3 : grade = "골드"
								break;
							case 4 : grade = "VIP"
								break;
						};
						
						//사용자구분 문자열 처리
						var role = "";
						
						switch(result.memberRole){
							case 1 : role = "일반회원"
								break;
							case 2 : role = "법인회원"
								break;
							case 3 : role = "관리자"
								break;
						};
						
						$(".modal_body input").eq(0).val(result.memberNo);
						$(".modal_body input").eq(1).val(grade);
						$(".modal_body input").eq(2).val(role);
						$(".modal_body input").eq(3).val(result.memberId);
						$(".modal_body input").eq(4).val(result.memberPwd);
						$(".modal_body input").eq(5).val(result.memberName);
						$(".modal_body input").eq(6).val(result.memberBirth);
						$(".modal_body input").eq(7).val(result.gender);
						$(".modal_body input").eq(8).val(result.phone);
						$(".modal_body input").eq(9).val(result.email);
						$(".modal_body input").eq(10).val(result.address);
						$(".modal_body input").eq(11).val(result.memberPoint);
						$(".modal_body input").eq(12).val(result.enrollDate);
						$(".modal_body input").eq(13).val(result.modifyDate);
						$(".modal_body input").eq(14).val(result.attendance);
						$(".modal_body input").eq(15).val(result.status);
					},
					
					error : function(){
						console.log("회원데이터 조회 실패")
					}
					
				});
			}
			
			//회원수정 모달창에서 취소버튼 클릭시
			function closeUpdate(){
				$(".modal_update").fadeOut();
			}
			
			//회원 상세조회창에서 회원삭제 버튼 클릭시
			function deleteMember(){
				//해당 모달 창 열어주기
				$(".modal_delete").fadeIn();
				
				//회원 번호 추출
				var delMno = $(".modal_body").children().children().eq(0).text();
				
				//form태그안의 hidden값을 넣어줌
				$("#hiddenNo").val(delMno);
			}
			
			// 회원삭제 창에서의 취소버튼 클릭시
			function delbutton(){
				$(".modal_delete").fadeOut();
			}
			
		</script>
		
		<!-- ==================== 회원 수정 (모달) ==================== -->
		
		<div class="modal_update">
			<div class="modal_updateContent">
				
				<div class="modal_img">
					<img src="resources/adminPage_files/iconFolder/member_icon.png">
				</div>

				<div class="modal_header">
					
				</div>

				<div id="modal_member">
					회원 수정
				</div>

				<form action="<%=contextPath%>/updateMember.admin" method="post" id="update_member">
				<div class="modal_body">
						<div>
							회원 번호
							<div>
								<input type="text" id="bor" name="memberNo" value="" readonly>
							</div>
						</div>

						<div>
							회원 등급
							<div>
								<input type="text" id="bor" name="grade" value="" readonly>
							</div>
						</div>

						<div>
							사용자 구분
							<div>
								<input type="text" id="bor" name="memberRole" value="" readonly>
							</div>
						</div>	

						<div>
							* 아이디
							<div>
								<input type="text" name="userId" value="" required>	
							</div>
						</div>

						<div>
							* 비밀번호
							<div>
								<input type="text" name="userPwd" value="" required>
							</div>
						</div>

						<div>
							* 이름
							<div>
								<input type="text" name="userName" value="" required>
							</div>
						</div>

						<div>
							* 생년월일
							<div>
								<input type="text" name="userBirth" value="" required>
							</div>
						</div>

						<div>
							* 성별
							<div>
								<input type="text" name="gender" value="" required>
							</div>
						</div>

						<div>
							* 전화번호
							<div>
								<input type="text" name="phone" value="" required>
							</div>
						</div>

						<div>
							* 이메일
							<div>
								<input type="text" name="email" value="" required>
							</div>
						</div>

						<div>
							* 주소
							<div>
								<input type="text" name="address" value="" required>
							</div>
						</div>

						<div>
							적립금
							<div>
								<input type="text" id="bor" name="memberPoint" value="" readonly>
							</div>
						</div>

						<div>
							회원가입일
							<div>
								<input type="text" id="bor" name="enrollDate" value="" readonly>
							</div>
						</div>

						<div>
							정보수정일
							<div>
								<input type="text" id="bor" name="modifyDate" value="" readonly>
							</div>
						</div>

						<div>
							출석체크
							<div>
								<input type="text" id="bor" name="attendance" value="" readonly>
							</div>
						</div>

						<div>
							상태값
							<div>
								<input type="text" id="bor" name="status" value="" readonly>
							</div>
						</div>
				</div>
				<div class="modal_footer">
					<input type="submit" value="수정하기" id="updateSub">
					<button type="button" onclick="closeUpdate()">취소</button>
				</div>
				</form>
			</div>
		</div>

	</div>	
	
</body>
</html>