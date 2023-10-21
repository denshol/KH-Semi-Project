<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.semi.coupon.model.vo.Coupon , java.util.ArrayList"%>

<%
	ArrayList<Coupon> clist = (ArrayList<Coupon>)request.getAttribute("clist");
	
	Coupon c = (Coupon)request.getAttribute("coupon");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminItems</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<!-- <link rel="stylesheet" href="resources/adminPage_files/cssFolder/admin_main.css"> -->



<!-- 메인 css 종료 -->

<style>
/* ============================== < TOP �쁺�뿭 > ================================== */
.top{
  width: 99%;
  height: 57px;
  background-color: white;
  border-bottom: 1px solid #aaa;
  position: relative;
  margin-left: 10px;
}

.top>table tr>td{
    border: 0;
    border-right: 1px solid white;
    border-radius: 5px;
    line-height: 40px;
    background-color: rgb(41, 128, 185);
    display: inline-block;
    color: white;
    cursor: pointer;
}

.top>table tr>td:hover{
  background-color: rgb(52, 52, 52);
}

/* ============================== < middle �쁺�뿭 > ================================== */
.middle{
    position: relative;
    width: 1400px;
    height: 90px;
    text-align: center;
    margin: 0 auto;
}

#ms_img{
    vertical-align: middle;
    background: url("resources/adminPage_files/iconFolder/search_icon.png") no-repeat center  ;
    background-color : rgb(41, 128, 185);
    color: white;
    width: 64px;
    height: 64px;
    cursor: pointer;
}

#mid_search{
    line-height: 50px;
    display: inline-block;
    vertical-align: middle;
    position: relative;
    top: 15px;
    
}

#mid_search *{
    border-radius: 6px;
}

#couponSearch{
    width: 550px;
    height: 64px;
}

  #ms_select{
    width: 110px;
    height: 64px;
  }

  .middle_left{
    width: 100%;
    height: 2000px;
    margin: 0 auto;
    margin-right: 0;
  }

  #ml_table{
    width: 100%;
    font-size: 14px;
  }
  
  #ml_table table{
  border-top: 1px solid #aaa;
  width: 99%;
  margin: 0 auto;
  margin-left: 10px;
  box-sizing: border-box;
  }
  
  #ml_table table>tbody td{
  overflow: hidden;
  text-overflow: ellipsis;
}

  thead th {
    position: sticky;
    top: 0;
    border-top: 0;
    background-clip: padding-box;
    /* width: 100%; */
    height: 100%;
    background-color: rgba(255,255,192,0.1);
    backdrop-filter: blur(2px);
  }
  

  table {
    border-collapse: collapse;
    border: 0;
  }

  th,
  td {
    border: 1px solid #aaa;
    background-clip: padding-box;
    scroll-snap-align: start;
  }

  thead {
    z-index: 1000;
    position: relative;
    margin:0;
  }

  th,
  td {
    padding: 0.6rem;
    /* min-width: 4.5rem; */
    margin: 0;
  }

  td{
    text-align: left;
  }

  thead th {
    position: sticky;
    top: 0;
    border-top: 0;
    background-clip: padding-box;
  }

  tbody {
    z-index: 10;
    position: relative;
  }

	.list-area>thead>tr{
    position: sticky;
    background-clip: padding-box;
  }

  .list-area{
    overflow: auto;
  }
  #insert_coupon{
    position: absolute;
    left: 86.4%;
    bottom: 5px;
    width: 100px;
    height: 35px;
  }

  #insert_coupon button{
    background-color: rgb(41, 128, 185);
    border-radius: 4px;
    color: white;
  }

  #select_del{
    width: 100px;
    height: 70px;
    display: flex;
    align-items: center;
    float: right;
    margin-right:4px;
  }

  #select_del button{
    background-color: rgb(41, 128, 185);
    border-radius: 4px;
    width: 100px;
    height: 35px;
    color: white;
    cursor: pointer;
  }

  #delboxSize{
    padding: 0;
    position: relative;
    text-align: center;
  }

  #ml_table>table input[type="checkbox"]{
    vertical-align: middle;
    width: 23px;
    height: 23px;
    cursor: pointer;
  }

  #delboxSize2{
    padding: 0;
    width: 5px;
    height: 5px;
  }
  .list-area>tbody>tr{
    cursor: pointer;
  }

  .list-area>tbody>tr:hover{
		background-color: darkgrey;
	} 
  
  
   /* =============== Modal �쁺�뿭 =============== */
  .modal{
    z-index: 2000;
    background: rgba(0, 0, 0, 0.75);
    top: 0;
    left: 0;
    right: 0;
    bottom: 0; /*�쟾泥댁쁺�뿭 �꽕�젙*/
    justify-content:center; /*�닔�룊 以묒븰�젙�젹*/
    align-items:center; /*�닔吏� 以묒븰�젙�젹*/
    position: fixed; /*�솕硫� �뒪�겕濡ㅻ릺�뜑�씪�룄 怨좎젙*/
    display: none;
    padding:15px;
    cursor: pointer;
  }

   .modal_content{
    background-color: #fff;
    position: relative;
    width:100%;               /* 諛섏쓳�삎 �씠湲� �븣臾몄뿉 媛�濡쒓컪 100% */
    max-width:500px;          /* �뙘�뾽�쓽 理쒕� �겕湲� */
    border-radius:15px;       
    overflow:hidden;          /* 媛곸쓣 �뾾�빐�쓣 �븣 �궡遺� �쁺�뿭�씠 ���뼱�굹�삤�뒗嫄� 諛⑹� */
    left: 40%;
    /* �뙘�뾽�씠 �뿀怨듭뿉 �뼚�엳�뒗 �벏�븳 �뒓�굦�쓣 二쇨린 �쐞�븳 洹몃┝�옄 �슚怨�. */
    box-shadow: 5px 10px 10px 1px rgba(0,0,0,.7); 
  }
  
  .modal_img{
    width: 100%;
    height: 140px;
    display: flex;
    align-items: center;
    justify-content: center;
  }

  .modal_header{
    border-radius:15px 15px 0 0;
    display: flex;
    align-items: center;
    justify-content: center;
    top: 0px;
    width: 100%;
    height: 60px;
    margin: 0 auto;
    text-align: center;
    padding-top: 10px;
    font-weight: bold;
    font-size: 23px;
    letter-spacing: 1px;
  }

  .modal_body{
   width: 100%;
   height: 550px;
   display: block;
   overflow-y: auto;
   overflow-x: hidden;
   padding: 10px 30px 30px 30px;
  }

  .modal_body>div{
    width: 100%;
    height: 25px;
    text-align: left;
    display: table;
    line-height: 35px;
    font-weight: bold;
    color: darkgrey;
    margin-left: 10px;
    font-size: 16px;
  }

  .modal_body>div>div{
    width: 95%;
    height: 25px;
    text-align: left;
    display: table;
    margin-left: 15px;
    color: black;
    font-size: 15px;
  }

  #modal_coupon{
    display: flex;
    align-items: center;
    width: 100%;
    height: 30px;
    font-size: 23px;
    font-weight: bold;
    text-align: left;
    padding: 30px;
  }

  .modal_footer{
    width: 100%;
    height: 50px;
    padding: 10px;
  }

  .modal_footer>button,.modal_footer>#updateSub{
    display: inline-block;
    width: 150px;
    height: 100%;
    justify-content: center;
    align-items: center;
    cursor: pointer;
    border-radius: 15px;
    border: 1px solid black;
    font-weight: 500;
  }

/* ========================= < 紐⑤떖 �뒪�겕濡ㅻ컮 �꽕�젙 > ========================= */
  .modal_body::-webkit-scrollbar{
    background-color: rgba(52, 52, 52, 0.452);
    border-radius: 12px 12px 12px 12px;
    scrollbar-width: thin;
    width: 10px;
    height: 50px;
  }

  .modal_body::-webkit-scrollbar-thumb{
    background-color: white;
    border-radius: 12px 12px 12px 12px;
    height: 5px;
  }

  .modal_body::-webkit-scrollbar-thumb:hover{
    border: 1px solid rgb(52, 52, 52);
  }

    /* =============== Modal Update �쁺�뿭 =============== */
    .modal_update{
      z-index: 2000;
      background: rgba(0, 0, 0, 0.75);
      top: 0;
      left: 0;
      right: 0;
      bottom: 0; 
      justify-content:center;
      align-items:center;
      position: fixed; 
      display: none;
      padding:15px;
    }
  
     .modal_updateContent{
      background-color: #fff;
      position: relative;
      width:100%;              
      max-width:500px;          
      border-radius:15px;       
      overflow:hidden;          
      left: 40%;
      box-shadow: 5px 10px 10px 1px rgba(0,0,0,.9); 
    }

    .modal_body>form>div{
      width: 100%;
      height: 25px;
      text-align: left;
      display: table;
      line-height: 35px;
      font-weight: bold;
      color: rgb(141, 141, 141);
      margin-left: 10px;
      font-size: 16px;
    }
  
    .modal_body>form>div>div{
      width: 95%;
      height: 25px;
      text-align: left;
      display: table;
      margin-left: 15px;
      color: black;
      font-size: 15px;
    }

    .modal_body input{
      position: relative;
      width: 50%;
      text-align: left;
      border-radius: 3px;
      border: 1px solid #aaa;
      display: table;
    }

    .modal_body #bor{
      border: 0; 
      outline: none;
      font-size: 15px;
      font-weight: 600;
      display: table;
      color: black;
    }

     /* =============== Modal delete �쁺�뿭 =============== */

    .modal_delete{
      background-color:rgba(0,0,0,.3);
      justify-content:center;
      align-items:center;
      position:fixed;
      top:0;
      left:0;
      right:0;
      bottom:0;
      display:none;
      padding:15px; 
      z-index: 3000;
    }

    .modal_delete_content{
      position: relative;
      top: 300px;
      left: 40%;
      width:100%;               
      max-width:400px;          
      border-radius:15px; 
      overflow:hidden;
      background-color: #fff;       
      box-shadow: 5px 10px 10px 1px rgba(0,0,0,.8); 
    }

    .modal_delete_header{
      width:100%;
      height:50px;  
      display:flex; 
      align-items:center;
      justify-content:center;
    }

    .modal_delete_footer{
      width: 100%;
      height: 50px;
      display: inline-flex; /* �븳以� �굹�뿴 */
      justify-content: center;
      align-items: center;
    }

    #delbtn,#delsub{
      width: 60px;
      height: 25px;
      margin: 15px;
      border-radius: 15px;
      border: 1px solid black;
      cursor: pointer;
    }
    
    
 /*------------  스위치 온 오프 스킨 css ----------------*/
.switch-button {
       position: relative;
       display: inline-block;
       width: 55px;
       height: 30px;
   }

.switch-button input {
    opacity: 0;
    width: 0;
    height: 0;
}

.onoff-switch {
    position: absolute;
    cursor: pointer;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    border-radius:20px;
    background-color: #ccc;
    box-shadow: inset 1px 5px 1px #999;
    -webkit-transition: .4s;
    transition: .4s;
}

.onoff-switch:before {
    position: absolute;
    content: "";
    height: 22px;
    width: 22px;
    left: 4px;
    bottom: 4px;
    background-color: #fff;
    -webkit-transition: .5s;
    transition: .4s;
    border-radius:20px;
}

.switch-button input:checked + .onoff-switch {
    background-color: #87cefa;
    box-shadow: inset 1px 5px 1px #4682b4;
}

.switch-button input:checked + .onoff-switch:before {
    -webkit-transform: translateX(26px);
    -ms-transform: translateX(26px);
    transform: translateX(26px);
}   

/* ============================== < bottom �쁺�뿭 > ================================== */

.bottom{
    width: 1400px;
}
</style>
<!-- 쿠폰 css 종료 태트 -->	
	
	
	<style>
	/*   #ms_img{
	  background: url("resources/adminPage_files/iconFolder/search_icon.png") no-repeat center;
	  background-size:;
	  background-color: rgb(41,128,185,1) ;
	  }
	 */
	
	</style>
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
			  <form action="<%=contextPath %>/searchCoupon.admin" method="post" id="searchCoupon" onsubmit="return blankSearch()">
				<select name="ms_select" id="ms_select">
					<option value="1">쿠폰번호</option>
					<option value="2">회원번호</option>
					<option value="3">쿠폰명</option>
					<option value="4">할인율</option>
					<option value="5">쿠폰기간</option>
					<option value="6">등록일</option>
					<option value="7">상태값</option>
					
				</select>
				<input type="search" name="couponSearch" id="couponSearch">
				<button type="submit" id="ms_img"></button>
			<script>
			
			function blankSearch(){
				if($("#couponSearch").val().length == 0){
					alert("다시 입력해주세요");
					return false;
				}
			};	
			</script>
		  </form>
		</div>
	<div id="insert_coupon">
			<button id="insert_coupon">쿠폰 등록</button>
	</div>
 </div>
	<div class="middle_left">
		<div id="ml_table">
			<table class="list-area">
				<thead>
						<%if(clist.isEmpty()) {%>
							<tr>
								<th style="font-size: 18px;">
									현재 존재하는 쿠폰이 없습니다.
								</th>
							</tr>
						<%}else {%>
						<tr id="ml_tr">
							<th style="width:60px;">쿠폰번호</th>
							<th style="width:60px;">회원번호</th>
							<th>쿠폰명</th>
							<th style="width:50px;">할인율</th>
							<th style="width:250px;">쿠폰기간</th>
							<th style="width:250px;">등록일</th>
							<th style="width:50px;">상태값</th>
							<th id="delboxSize2"  style="width:70px">
							<label for = "allchk"><strong>모두 선택</strong></label>
						<label class="switch-button">
								<input type="checkbox"
								id="allchk"
								name="delBox"
								value="selectall"
								onclick="selectAll(this)"/>
	    				<span class="onoff-switch"></span></label>
							</th>
						</tr>
					</thead>
					<tbody>
							<%for(Coupon cp : clist){ %>
								<tr>
									<td><%=cp.getCouponNo() %></td>
									<td><%=cp.getMemberNo()%></td>
									<td><%=cp.getCouponName()%></td>
									<td><%=cp.getDiscount() %></td>
									<td><%=cp.getcPeriod()%></td>
									<td><%=cp.getsDate()%></td>
									<td><%=cp.getStatus() %></td>
									<td onclick="event.cancelBubble=true">
										<label class="switch-button">
										<input type="checkbox"
												name="delBox"
												value="using"
												id="using"
												/> 
    									<span class="onoff-switch"></span></label>
									</td>
								</tr>
							<%} %>
						<%} %>
					</tbody>
				</table>
			</div>
		<div id="select_del">
			<button id="delete_Coupon">선택 삭제</button>
		</div>
	</div>
</div>
		
<div class="bottom">
		
<%@include file="/views/common/footer.jsp"%>
			
</div>

<script>
function selectAll(selectAll)  {
	  const checkboxes 
	       = document.getElementsByName('delBox');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked;
	  })
	}

	/* $(function(){
		$("#allchk").on("checked",function(){
			$(".radioY").css("checked")
		});
		
	}); */

</script>


<!--------------ㅡ모달---------------->
<div class="modal">
			<div class="modal_content">
				<div class="modal_img">
					<img src="">
				</div>
				<div class="modal_header">
				</div>
				<div id="modal_coupon">
					쿠폰 정보
				</div>
				<div class="modal_body">
					<div>
						쿠폰 번호 : 
						<div>
						
						</div>
						
					</div>
					<div>
						회원 번호 : 
						<div>
						
						</div>
						
					</div>
					
					<div>
						쿠폰 이름 : 
						<div>
						
						</div>
						
					</div>
						
					<div>
						할인율 : 
						<div>
						
						</div>
						
					</div>

					<div>
						쿠폰 유효 기간 : 
						<div>
							
						</div>
					</div>

					<div>
						등록일 : 
						<div>
							
						</div>
					</div>

					<div>
						상태값 : 
						<div>
							
						</div>
					</div>

					<!-- <div>
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
						쿠폰가입일
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
					 -->
				</div>
				
				<div class="modal_footer">
					<button onclick="updateCoupon()">쿠폰 수정</button>
					<button onclick="deleteCoupon()">쿠폰 삭제</button>
				</div>
			</div>
		</div>
		
				
		<!-- ==================== 쿠폰 삭제 (모달) ==================== -->

		<div class="modal_delete">
			<form action="<%=contextPath%>/cdelete.admin" method="post">
				<input type="hidden" id="hiddenNo" name="couponNo" value="" >
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
		




<!--  쿠폰관리 스크립트 -->
<script>


	$(".list-area>tbody>tr").click(function(){
		console.log($("input:checkbox[name='delBox']").is(":checked"));
		/* if(){
			if($(this).children().eq(7).children().children().eq(0).is(":checked",false)){
					$(this).children().eq(7).children().children().eq(0).prop("checked",true);
			}else{
					$(this).children().eq(7).children().children().eq(0).prop("checked",false);
			
			}
			return false;
		}; */
	
			
		//쿠폰 번호 적용
		
		var cno = $(this).children().first().text();
		
		//검색결과에 다른 조회값
		$.ajax({
			 url : "detailCoupon.admin?cno="+cno
			,type : "get"
			,success : function(result){
				
				//해당 영역에 쿠폰이름 넣기
				$(".modal_header").text(result.couponName);
				
				$(".modal_body").children().children().eq(0).text(result.couponNo);
				$(".modal_body").children().children().eq(1).text(result.memberNo);
				$(".modal_body").children().children().eq(2).text(result.couponName);
				$(".modal_body").children().children().eq(3).text(result.discount);
				$(".modal_body").children().children().eq(4).text(result.cPeriod);
				$(".modal_body").children().children().eq(5).text(result.sDate);
				$(".modal_body").children().children().eq(6).text(result.status);
				
			}
			,error : function(result){
				console.log("쿠폰조회 실패");
				console.log(result);
			}
						
		});
	});
	
	//모달 페이드인아웃
	$(function(){
		$(".list-area>tbody>tr").click(function(){
			$(".modal").fadeIn();
		});
		$(".modal_content,.modal").click(function(){
			$(".modal").fadeOut();
		});
	});

 function updateCoupon(){
	 
	 $(".modal_update").fadeIn();
	 
	 //쿠폰번호 적용
	 
	 var ucno = $(".modal_body").children().children().eq(0).text();
	 
	 //해당 ajax는 input값 상자에 넣어줄 조회용 데이터 추출및삽입 
	 
	 $.ajax({
		
		 url : "updateCoupon.admin?ucno="+ucno
				 
	     ,type : "get"
	     
	     ,success : function(result){
	    	 //쿠폰 이름을 위에서 처리 완료
	         	 
	    		$(".modal_body input").eq(0).val(result.couponNo);
				$(".modal_body input").eq(1).val(result.memberNo);
				$(".modal_body input").eq(2).val(result.couponName);
				$(".modal_body input").eq(3).val(result.discount);
				$(".modal_body input").eq(4).val(result.cPeriod);
				$(".modal_body input").eq(5).val(result.sDate);
				$(".modal_body input").eq(6).val(result.status);
	     }
	 	,error : function(result){
	 		console.log("쿠폰데이터 조회 실패");
	 		
	 	}
	 	,complete : function(result){
	 		console.log("컴플리드");
	 		console.log($(".modal_body input").eq(1));
	 	}
	 });
 	}
 
 // 쿠폰 수정 모달창에서 취소버튼클릭
 function closeUpdate(){
	 $(".modal_update").fadeOut();
	 
 }
	//쿠폰 상세조회창에서 쿠폰삭제 버튼 클릭
function deleteCoupon(){
		//해당 모달창 오픈
		$(".modal_delete").fadeIn();
		
		//쿠폰 번호 추출
		var delCno = $(".modal_body").children().children().eq(0).text();
		
		//form태그안 hidden값으로
		$("#hiddenNo").val(delCno);
	}
	
	//쿠폰삭제 창에서의 취소버튼 클릭시
function delbutton(){
		$(".modal_delete").fadeOut();
	}
	
</script>

<!--===========수정 모달 ==============-->
<div class="modal_update">
			<div class="modal_updateContent">
				
				<div class="modal_img">
					<img src="resources/adminPage_files/iconFolder/member_icon.png">
				</div>

				<div class="modal_header">
					
				</div>

				<div id="modal_coupon">
					쿠폰 수정
				</div>

				<form action="<%=contextPath%>/updateCoupon.admin" method="post" id="update_coupon">
				<div class="modal_body">
						<div>
							쿠폰 번호 : 
							<div>
								<input type="text" name="couponNo" value="" id="bor" readonly>
							</div>
						</div>

						<div>
							회원 번호 : 
							<div>
								<input type="text" name="memberNo" value="" readonly>
							</div>
						</div>

						<div>
							쿠폰 이름 : 
							<div>
								<input type="text" name="couponName" value="">
							</div>
						</div>	

						<div>
							할인율 : 
							<div>
								<input type="text" name="discount" value="">	
							</div>
						</div>

						<div>
							쿠폰 유효 기간 : 
							<div>
								<input type="text" name="period" id="bor" value="" >
							</div>
						</div>

						<div>
							등록일 : 
							<div>
								<input type="text" name="sdate" id="bor" value="" readonly >
							</div>
						</div>

						<div>
							상태값 : 
							<div>
								<input type="text" name="status" id="bor" value="" readonly>
							</div>
						</div>
<!-- 
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
							쿠폰가입일
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
						</div> -->
				</div>
				<div class="modal_footer">
					<input type="submit" value="수정하기" id="updateSub">
					<button type="button" onclick="closeUpdate()">취소</button>
				</div>
				</form>
			</div>
		</div>

	

</body>
</html>