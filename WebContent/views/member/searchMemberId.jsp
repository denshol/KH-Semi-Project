<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import ="com.semi.member.model.vo.Member"%>


<!DOCTYPE html>
<html lang="en">
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <style>
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap');
    *{
        /* width: 100vw; */
        /* overflow: hidden; */
        box-sizing: border-box;
        /* outline: none; */
        
        /* border: 1px solid black; */
    }

    *:focus{
        border : 3px solid  rgb(11, 95, 221);
        /* outline-color : blue; */
    }

    body,html{
        font-family: 'Noto Sans KR',sans-serif;
        /* font-size: 20px; */
        background-color: #fff;
        line-height: 1.5em;
        color: #222;
        margin: 0;
        padding:0;
       
     /*    height: 100vh; */
    
    }
    a{
        text-decoration: none;
        color: #222;
    }
    .outer{
        width: 1400px;
        border: 3px solid darkgray;
        margin: auto;
        /* padding: 0 20px; */
        /* margin-bottom: 20px; */
        /* height: 95%; */
       /*  margin-top: 20px; */
    }

    .outer .logo{
        /*로고는 이미지라 인라인 블록이니까 마진 오토 안됨 블록요소만 됨 */
        display: block;
        margin :50px auto;
        cursor: pointer;
        margin-bottom: 5px;
        margin-top: 12px;
    }

    .loginBox{
        padding:30px;
        width: 700px;
        margin: auto;
        border: 3px solid #2c7dc9;
        border-radius: 50px;
        display: flex;
        flex-direction: column;   
        align-items: center;
        /* justify-content: center; */
        
        
        /* vertical-align: top; */
    }
    
     .loginBox2{
        padding:30px;
        width: 700px;
        margin: auto;
        border: 3px solid #2c7dc9;
        border-radius: 50px;
        display: flex;
        flex-direction: column;   
        align-items: center;
        /* justify-content: center; */
        
        
        /* vertical-align: top; */
    }
    .foot{
        padding: 50px;
        margin: auto;
        display: flex;
        flex-direction: column;
        align-items: center;
        padding-top: 8px;
    }

   button:not([type=submit]){
        /* margin: auto; */
        /* flex: 1; */
        padding: 20px;
        margin-bottom: 16px;
        /* width: 500px; */
        font-size: x-large;
    }
    .loginBox input{
        width: 500px;
        padding: 15px;
        margin-bottom: 16px;
        margin-top: 0;
        border-radius:50px;
    }
    
    .loginBox2 input{
        width: 500px;
        padding: 15px;
        margin-bottom: 16px;
        margin-top: 0;
        border-radius:50px;
    }

    #sea{
    background:url(./images/images2/icon-01.png) no-repeat center right 15px;
    background-size: 20px;
    background-color: #fff;
}

    .search{
       display:flex;
       flex-direction:row;
       margin : auto;
       margin-top:60px;
       
    }

/*     .search>button{
        border-radius: 30px;
    }
    .loginBox>button{
        border-radius: 30px;
    } */
    label{
    margin-bottom:10px;
    }
    label:hover{
    	font-size:16px;
    	font-weight:300px;
    	color:blue;
    }
   .birthBlock{
   display:inherit;
   width:inherit;
   height:inherit;
   
   border-radius:50px;
   margin:0;
   padding:0;
   
   
   }
   .btn{
   border-radius:50px;
   
   }
     .outer select:focus{
    border: 2px solid #2c7dc9;
}

   .srcph{
   	display:flex;
   	flex-direction:column;
   	
   
   }



        </style>
        
    
    <title>아이디찾기</title>
 
</head>

<body>
        



    <%@ include file = "../common/header.jsp"%>
    <div class="outer">
        <form action="<%=contextPath %>/selectbyid.me" method="post" id="form">
    
            <%-- <a href="<%=contextPath%>">
                <img src="resources/사이트이름.png" alt="logo" class="logo">
            </a> --%>
            <div class="search">
                <button type="button" class="btn btn-primary" id="loginBtn" value="" style="margin-left:350px;padding: px; width: 350px;">아이디 찾기</button>
                <button type="button" class="btn btn-outline-primary" style="width:350px;" onclick="searchPwd();">비밀번호 찾기</button>
            </div>
            <div class="srcph">
             <button type="button" class="btn btn-outline-secondary" id="searchEmail" style="width:700px; padding: 12px; border-radius:50px; margin-left:350px;">휴대폰번호로 찾기</button>
            </div>
            
            
            <div class="loginBox" style="display:none;">
                 <h4 style="color:blue" id="fadeName" ></h4>
                <label for="memberName">* 이름</label><font size="2" id="nameFont"></font>
                <input type="text" id="memberName" name="memberName" placeholder="이름을 입력해주세요">


                <label for="memberBirth" style="display:block; flex-direction:column;">* 생년월일</label>
			  <div class="birthBlock">
                        <!-- <td style="padding-left: 0px;"> -->
                        <input type="number" required placeholder="년(4자)" style="margin-left:100px; width:150px;" id="birthYear" name="birthYear">
                        <!-- <td style="padding-top:14px;">   -->
                         <select class="form-select form-select-lg mb-3" id="birthMonth" name="birthMonth" style="border-radius:50px; width:200px;">
                            <option value="">월</option>
                            <option value="1">1월</option>
                            <option value="2">2월</option>
                            <option value="3">3월</option>
                            <option value="4">4월</option>
                            <option value="5">5월</option>
                            <option value="6">6월</option>
                            <option value="7">7월</option>
                            <option value="8">8월</option>
                            <option value="9">9월</option>
                            <option value="10">10월</option>
                            <option value="11">11월</option>
                            <option value="12">12월</option>
                        </select>
                        <input type="number" required placeholder="일" style="width:150px;" id="birthDay" name="birthDay" min="1"  max="31">
			  </div>
              
                
                
                
                <!-- <input type="text" name="memberBirth" id="memberBirth" placeholder="생년월일 8자리를 입력해주세요"> -->

            
            <label for="phone">* 휴대폰번호</label><font size="2" id="phoneFont"></font>
            <input type="text" id="phone" name="phone" placeholder="-를 포함하여 입력해주세요">

            <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#staticBackdrop" style="width:500px; padding:20px;" id="mddbtn">확인</button>
           
           </div>
           </form>
           <!-- Button trigger modal -->


			<!-- Modal -->
			<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered">
			    <div class="modal-content">
			      <div class="modal-header" style="text-align:center;">
			        <h5 class="modal-title" id="staticBackdropLabel">조회</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			     <div class="modal-body">
					  <h4 style="">아이디 조회 결과</h4>
					  <p id="mdd" style="font-size:18px; font-weight:600px; color:#8080FF">조회된 아이디 입니다.  triggers a popover on click.</p>
					  <hr>
					  <a href="<%=contextPath%>/searchpwd.me" role="button" class="btn btn-secondary popover-test" title="Popover title" data-bs-content="Popover body content is set in this attribute." onclick="">비밀번호 찾기</a>
					  <h5>ㅁㄴㅇ </h5>
					  <p class="mdd"><a href="#" class="tooltip-test" title="Tooltip">sdsdsd</a> 33333 <a href="#" class="tooltip-test" title="Tooltip">that link</a> have tooltips on hover.</p>
					</div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="border-radius:50px;">닫기</button>
			        <button type="button" class="btn btn-primary" style="border-radius:50px;" onclick="location.href='<%=contextPath%>/logform.me'">로그인하러가기</button>
			      </div>
			    </div>
			  </div>
			</div>
           
           
           
           <form action="<%=contextPath%>/findpwd.me">
           
   
             <div class="loginBox" style="display:none;">
                 <h4 style="color:blue" id="fadeName2" ></h4>
                <label for="memberName">* 이름</label><font size="2" id="nameFont"></font>
                <input type="text" id="memberName" name="memberName" placeholder="이름을 입력해주세요">


                <label for="memberBirth" style="display:block; flex-direction:column;">* 생년월일</label>
			  <div class="birthBlock">
                        <!-- <td style="padding-left: 0px;"> -->
                        <input type="number" required placeholder="년(4자)" style="margin-left:100px; width:150px;" name="birthYear" id="birthYear">
                        <!-- <td style="padding-top:14px;">   -->
                         <select class="form-select form-select-lg mb-3" name="birthMonth" style="border-radius:50px; width:200px;" id="birthMonth">
                            <option value="">월</option>
                            <option value="1">1월</option>
                            <option value="2">2월</option>
                            <option value="3">3월</option>
                            <option value="4">4월</option>
                            <option value="5">5월</option>
                            <option value="6">6월</option>
                            <option value="7">7월</option>
                            <option value="8">8월</option>
                            <option value="9">9월</option>
                            <option value="10">10월</option>
                            <option value="11">11월</option>
                            <option value="12">12월</option>
                        </select>
                        <input type="number" required placeholder="일" style="width:150px;" name="birthDay" id="birthDay" min="1"  max="31">
			  </div>
                
                
                
                
                <!-- <input type="text" name="memberBirth" id="memberBirth" placeholder="생년월일 8자리를 입력해주세요"> -->

            
            <label for="phone">* 휴대폰번호</label><font size="2" id="phoneFont"></font>
            <input type="text" id="phone" name="phone" placeholder="-를 포함하여 입력해주세요">

            <button type="submit" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#staticBackdrop" style="width:500px; padding:20px; ">확인</button>
           
           </div>
    
        
       


        <div class="foot">
              <button type="button" class="btn btn-outline-secondary" id="searchEmail" style="width:700px; padding: 12px; border-radius:50px;">이메일로 찾기</button>
          <!--     <img src="resources/돋보기.png" alt="">  -->
        </div>

         </form>  
</div>

   <%@ include file = "../common/footer.jsp" %>
<br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

<script>
$(document).ready(function(){

	$(".outer")
	   	.css('opacity',0)
		.slideDown(1000 , 'swing')
		.animate(
		{ opacity : 1 }
		,{ queue : false , duration : 700})
		
});

$(function(){

$("#mddbtn").click(function(){
	$.ajax({
		url : "selectbyid.me"
		,data : {
			memberName : $("#memberName").val()
			,birthYear : $("#birthYear").val()
			,birthMonth : $("#birthMonth").val()
			,birthDay : $("#birthDay").val()
			,phone : $("#phone").val()
		}
		,type : "post"
		,success : function(result) {
			console.log("success");
			$("#mdd").html(result);
			console.log(result[0]);
		}
		,error : function(result){
			console.log("error");
			
			console.log($("#memberName").val());
			console.log(document.getElementById("birthYear").value);
			
			console.log(document.getElementById("birthMonth"));
			console.log($("#birthDay"));
			
			console.log($("#phone").val());
		}
		,complete : function(result){
			console.log("complete");
			console.log(birthMonth.value);
		}
	});
	
	
});
});
  			
$(function(){
	   $(".srcph").click(function(){
			var $p = $(this).next();
			
			$(".foot").fadeIn(400);
				$(".srcph").fadeOut(400);
			if($p.css("display")=="none"){
			if($(".foot").prev().css("display")!="none"){
				$(".foot").prev().slideToggle(400);
			
				/* $q.SlideDown; */
				$(this).siblings(".loginBox").slideToggle(400);
				$(this).next().siblings(".loginBox").slideToggle(400);
				/* $(".foot").fadeOut(400);
				$(".srcph").fadeIn(400); */
			}else{
			/* 	$(".foot").fadeIn(400); */
			$p.slideToggle(400);
				
				
			}
			
			}else{
				$(".srcph").fadeToggle(400);
			}
			
			
		});

 });
 
    $(function(){
   	   $(".foot").click(function(){
   			var $q = $(this).prev();
   			
   				$(".foot").fadeOut(400);
   				$(".srcph").fadeIn(400);
   			if($q.css("display")=="none"){
   			if($(".srcph").next().css("display")!="none"){
   				$(".srcph").next().slideToggle(400);
   			
   				/* $q.SlideDown; */
   				$(this).siblings(".loginBox").slideToggle(400);
   				$(this).prev().siblings(".loginBox").slideToggle(400);
   				/* $(".foot").fadeOut(400);
   				$(".srcph").fadeIn(400); */
   			}else{
   			/* 	$(".foot").fadeIn(400); */
   			$q.slideToggle(400);
   				
   				
   			}
   			
   			}else{
   				$(".foot").fadeToggle(400);
   			}
   			
   			
   		});
  
    });
    
    function searchPwd(){
    	
    	location.href ="<%=contextPath%>/searchpwd.me";
    	
    };
   
    //정규표현식
    var inputName = document.getElementById("memberName");
    //4)이름 검사
    //한글 2글자 이상
    /* let nameChk = RegExp(/^[가-힣]{2,6}/); */
    
    var regExpName = /^[가-힣]{2,6}$/; //2글자 이상 {범위에서 앞쪽만 작성하면 그 이상}
	var nameFont = document.getElementById("nameFont");
    inputName.addEventListener("keyup",function(){
    	
    if(!regExpName.test(inputName.value)){
        
        nameFont.innerHTML = "이름 형식이 올바르지 않습니다.";
        nameFont.style.color = 'red';
        inputName.focus();
       
    }else{
    	nameFont.innerHTML = '사용가능한 이름입니다'
    	nameFont.style.color = 'blue';
    }
    
    })
    
	var inputPhone = document.getElementById("phone");
	var regExpPhone = /^01[0179]-\d{4}-\d{4}$/; 
	var	phoneFont = document.getElementById("phoneFont");
    inputPhone.addEventListener("keyup",function(){
    	
    
    if(!regExpPhone.test(inputPhone.value)){
    	phoneFont.innerHTML = "휴대폰 형식이 올바르지 않습니다.";
    	phoneFont.style.color = 'red';
    	inputPhone.focus();
    	
    }else{
    	phoneFont.innerHTML = "사용가능한 형식의 휴대폰번호입니다."
    	phoneFont.style.color = 'blue';
    }
    });
</script> 
</body>
</html>