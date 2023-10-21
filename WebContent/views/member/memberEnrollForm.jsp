<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import ="com.semi.member.model.vo.Member"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <!-- jQuery library -->
    <script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <title>회원가입</title>
    <style>
   
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap'); */
*{
   
    /* overflow: hidden; */
    box-sizing: border-box;
     /* font-size : 13px;  */
    /* outline: none; */
    /* border: 1px solid black; */
 }

 *:focus{
    /* outline: 3px solid  #2c7dc9; */
 }

}
 input{
    /* padding: 15px;
    width: 65%; */
 }
 html,body{
  font-family: 'Noto Sans KR',sans-serif; 
    font-size: 14px;
    background-color: ;
    line-height: 1.5em;
    color: #222;
	margin:auto;
    
   
 }
 
 a{
    text-decoration: none;
    color: #222;
 }
 .outer{
 	display:none;
    width: 1200px;
    border: 3px solid grey;
    margin: auto;
    padding: 0px;
    margin-bottom: 20px;
 }
 
  main{
	  width:inherit;
	  padding:0px;
	  margin:0px;
	  
   
 }

 .outer .logo{
    /*로고는 이미지라 인라인 블록이니까 마진 오토 안됨 블록요소만 됨 */
    display: block;
    margin :50px auto;
    cursor: pointer;
    margin-top : 15px
}

.outer b{
    /* border: 1px solid #000; */
    /*수직 정렬하기 */
    /* display: block; 
    margin-bottom: 5px; */
    margin: 19px 0 8px;
    font-size: 17px;
    font-weight: 700;
    margin-left: 60px;
}

/*input 중 radio 는 width 가 100%면 안되니까 */
.outer input:not(input[type=radio]),.outer select{
    border: 1px solid black;
    padding: 15px;
    width: 90%;
    margin-bottom: auto;
    border-radius : 30px;
}

.outer input:not(input[type=radio],input[type=number]), .outer not select{
    margin-left: 0px;
    padding: 15px;
    border-radius : 30px;
}


.outer input:not([type=radio]):focus{

border: 3px solid #2c7dc9;
outline : 3px solid #2c7dc9; 
}


 .outer select:focus{
    border: 2px solid #2c7dc9;
}

.placehold-text{
    display: ; /*span 으로 감싸서 크기영역을 블록요소로 만들어ㅜ저야한다*/
    position:;
    color: #2c7dc9;
    font-weight: bold;
    /* border: 1px solid #000; */
}

.placehold-text:before{ 
    content : "* 중복확인체크 필수";
     content: #2c7dc9; 
    /* position: ; before은 inline 요소이기 때문에 span으로 감싸줌 */
    right : 8px;
    top:13px;
    
    pointer-events: none; /*자체가 가지고 있는 pointer event 를 없애준다 */
}

 header{
    height: 150px;
/*     text-align: center;
 */    padding-top: 20px;
    background-color:;
    margin-bottom: 40px;
    display:flex;
    flex-direction:row;
    padding : 0px;
    margin : 0px;
    /* border: 2px solid blue; */
 }


 section{
    /* border: 2px solid red; */
    margin: 0px;
    padding: 0px;
 }
 table{
    position:relative;
   /*  z-index:0;
    /* height: 100%; */
    /* text-align: center; */
 }

table>thead>tr>td{
    column-span: 6;
}

table>tbody>tr>td{
    column-span: 6;
   
    /* display: block;
    width: 100%;
    height: 51px;
    border: solid 1px #dadada;
    padding: 10px 14px 10px 14px;
    box-sizing: border-box;
    background: #fff;
    position: relative; */
    
}

table>tfoot>tr>td{
    column-span: 6;
    
}

 tr{
    margin: 5px 0;
    /* padding: 0px; */


 }
.birth>td{
     /* padding-left: 20px; */
    width: 180px;
    padding: 0;
}
 tbody>tr{
   height: 70px; /* column-span: 6; */
 }

 .userpw{
    background:url(resources/pwd.png) no-repeat center right 15px;
    background-size: 30px;
    background-color: #fff;
}

.userpw-confirm{
    background:url(resources/pwdChk.png) no-repeat center right 15px;
    background-size: 33px;
    background-color: #fff;
}

 label:hover{
    text-decoration: underline;
    font-size: 14px;
    color: #2c7dc9;
    cursor: pointer;
 }
 tbody{
    /* text-align: justify; */
    /* text-align: left; */
 }
 footer{
    width: 100%;
    float: left;
    padding-left: 80px;
    /* margin-right: 300px; */
 }
 footer>button{
     margin: 100px;
     padding: 350px;
 }
input[type=radio]{
    /* margin: auto 100px; */
    /* margin: 0px; */
    /* padding: 0px; */
    margin : 20px auto;
    width: 50px;
    margin-left: 50px;
}

input[type=radio]:focus{
	outline : 3px solid #2c7dc9; 
}

@media (max-width:768px) {
    .outer{
        width: 100%;
    }
}


.btn{
	border-radius : 50px;
	/* width : 300px; */
}


header>button{

	
	

}
#search_form>*{
   
   float : left;
   }
    
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

.image-box {
    width: 200px;
    height: 200px;
    padding: 20px;
    background: skyblue;
    box-sizing: border-box;
    position: relative;
    cursor: pointer;
}
.image-box::after {
    content: "";
    display: block;
    position: absolute;
    width: 100%;
    height: 100%;
    background: rgba(0,0,0,.4);
    left: 0;
    top: 0;
    opacity: 0;
    transition: .5s;
}
.image-box .content {
    width: 100%;
    height: 100%;
    position: relative;
    z-index: 2;
    background: none;
}
.image-box .content::after,
.image-box .content::before {
    content: "";
    display: block;
    position: absolute;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
    width: 0%;
    height: 0%;
    border-color: white;
    border-width: 1px;
    transition: .5s;
}

.image-box .content::after {
    height: 100%;
    border-style: solid none;
}
.image-box .content::before {
    width: 100%;
    border-style: none solid;
}
.image-box:hover::after {
    opacity: 1;
}
.image-box:hover .content::after,
.image-box:hover .content::before {
    width: 100%;
    height: 100%;
    border-radius: 5px;
}

.content2 {
    width: 150px;
    height: 150px;
    position: relative;
    box-sizing: border-box;
    background: #141926;
}
.close {
    width: 80px;
    height: 50px;
    position: relative;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
    cursor: pointer;
}
.close::before,
.close::after {
    content: "";
    display: block;
    position: absolute;
    width: 100%;
    height: 1px;
    background: #fff;
    transition: .3s ease-in;
}
.close::before {
    top: 50%;
    transform: rotate(45deg);
}
.close::after {
    bottom: 50%;
    transform: rotate(-45deg);
}
.close:hover::before{
    top: 0;
    transform: rotate(0deg);
}
.close:hover::after{
    bottom: 0;
    transform: rotate(0deg);
}
.close div {
    font-size: 14px;
    color: white;
    text-align: center;
    line-height: 50px;
    opacity: 0;
    transition: .3s;
    color: white;
    text-decoration: none;
}
.close:hover div {
    opacity: 1;
}
</style>
</head>
<body>

   <%@ include file = "../common/header.jsp"%>  
<div class="outer">
<form action="<%=contextPath %>/insert.me" id="enroll-Form" method="post">
    <header style="text-align:center;">
        <!-- <h1>회원가입</h1> -->
      <%--  <a href="<%=contextPath%>"> <img class="logo" src="resources/사이트이름.png" alt="logo"></a> --%>
 <div style="flex:0.5; display:inline-block;"> 
   <div class="content2">
   	 <div class="close">
        <div>CLOSE</div>
        <!-- <button type="reset" class="btn btn-outline-primary" style="padding: 20px; width: 200px; border-radius:50px; box-shadow: 10px 5px 3px 2px skyblue;">초기화</button> -->
     </div>
 </div>
</div>
 <div style="flex:0.5">
    <div class="image-box">
    	<div class="content">
 	       <button type="submit" id="enrollbtn" disabled >회원가입</button>
    	</div>
	</div>
 </div>
    </header>
    <main>
            
            
            <h3 style="padding:10px 0px 10px 400px; padding-bottom:10px; border-bottom: 1px solid darkgray;">파랑서점 이용약관 동의  &nbsp;<sub style="color:blue;">(필수)</sub></h3>
            <table align="center">
        <thead>
        	<tr>
        		<th colspan="7" style="text-align:center; text-decoration: underline; padding:10px 0px; ">
        		<label class="switch-button">
					<input type="checkbox"
					id="allchk"
					name="agree"
					value="selectall"
					onclick="selectAll(this);"/>
	    		<span class="onoff-switch"></span>
				</label>
				<label for="allchk" style=" font-size:15px; margin-top:7px; ">
				파랑서점 이용약관, 개인정보 수집 및 이용,위치기반서비스 이용약관(선택),이벤트 정보 수신(선택)에 <font size='4' style='font-size:18px; color:#4682b4;'>모두</font> <font size='4' style="font-size:16px; color:#E3AE56;">동의</font>합니다.
				</label>
				</th>
        	</tr>
        	<tr>
                        <td colspan="6" align="center"> <textarea rows="10" cols="140" style="overflow-y: scroll; resize: none; backgroundColor : darkgrey;"  readonly>여러분을 환영합니다.
네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.

네이버 서비스를 이용하시거나 네이버 서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다.

다양한 네이버 서비스를 즐겨보세요.
네이버는 www.naver.com을 비롯한 네이버 도메인의 웹사이트 및 응용프로그램(어플리케이션, 앱)을 통해 정보 검색, 다른 이용자와의 커뮤니케이션, 콘텐츠 제공, 상품 쇼핑 등 여러분의 생활에 편리함을 더할 수 있는 다양한 서비스를 제공하고 있습니다.
여러분은 PC, 휴대폰 등 인터넷 이용이 가능한 각종 단말기를 통해 각양각색의 네이버 서비스를 자유롭게 이용하실 수 있으며, 개별 서비스들의 구체적인 내용은 각 서비스 상의 안내, 공지사항, 네이버 웹고객센터(이하 ‘고객센터’) 도움말 등에서 쉽게 확인하실 수 있습니다.

네이버는 기본적으로 여러분 모두에게 동일한 내용의 서비스를 제공합니다. 다만, '청소년보호법' 등 관련 법령이나 기타 개별 서비스 제공에서의 특별한 필요에 의해서 연령 또는 일정한 등급을 기준으로 이용자를 구분하여 제공하는 서비스의 내용, 이용 시간, 이용 횟수 등을 다르게 하는 등 일부 이용을 제한하는 경우가 있습니다. 자세한 내용은 역시 각 서비스 상의 안내, 공지사항, 고객센터 도움말 등에서 확인하실 수 있습니다.

네이버 서비스에는 기본적으로 본 약관이 적용됩니다만 네이버가 다양한 서비스를 제공하는 과정에서 부득이 본 약관 외 별도의 약관, 운영정책 등을 적용하는 경우(예, 네이버페이, V LIVE 등)가 있습니다. 그리고 네이버 계열사가 제공하는 특정 서비스의 경우에도(예, LINE, SNOW등) 해당 운영 회사가 정한 고유의 약관, 운영정책 등이 적용될 수 있습니다. 이러한 내용은 각각의 해당 서비스 초기 화면에서 확인해 주시기 바랍니다.

회원으로 가입하시면 네이버 서비스를 보다 편리하게 이용할 수 있습니다.
여러분은 본 약관을 읽고 동의하신 후 회원 가입을 신청하실 수 있으며, 네이버는 이에 대한 승낙을 통해 회원 가입 절차를 완료하고 여러분께 네이버 서비스 이용 계정(이하 ‘계정’)을 부여합니다. 계정이란 회원이 네이버 서비스에 로그인한 이후 이용하는 각종 서비스 이용 이력을 회원 별로 관리하기 위해 설정한 회원 식별 단위를 말합니다. 회원은 자신의 계정을 통해 좀더 다양한 네이버 서비스를 보다 편리하게 이용할 수 있습니다. 이와 관련한 상세한 내용은 계정 운영정책 및 고객센터 내 네이버 회원가입 방법 등에서 확인해 주세요.

네이버는 단체에 속한 여러 구성원들이 공동의 계정으로 네이버 서비스를 함께 이용할 수 있도록 단체회원 계정도 부여하고 있습니다. 단체회원 구성원들은 하나의 계정 및 아이디(ID)를 공유하되 각자 개별적으로 설정한 비밀번호를 입력하여 계정에 로그인하고 각종 서비스를 이용하게 됩니다. 단체회원은 관리자와 멤버로 구성되며, 관리자는 구성원 전부로부터 권한을 위임 받아 단체회원을 대표하고 단체회원 계정을 운용합니다.
따라서 관리자는 단체회원 계정을 통해 별도 약관 또는 기존 약관 개정에 대해 동의하거나 단체회원에서 탈퇴할 수 있고, 멤버들의 단체회원 계정 로그인 방법 및 이를 통한 게시물 게재 등 네이버 서비스 이용을 관리(게시물 삭제 포함)할 수 있습니다. 본 약관에서 규정한 사항은 원칙적으로 구성원 모두에게 적용되며, 각각의 구성원은 다른 구성원들의 단체회원 계정 및 아이디(ID)를 통한 서비스 이용에 관해 연대책임을 부담합니다.

단체회원 계정 사용에서의 관리자, 멤버 등의 권한 및 (공동)책임에 관한 사항 등은 계정 운영정책 및 고객센터 내 네이버 단체회원(단체 아이디) 소개 등에서 확인해 주시기 바랍니다.

여러분이 제공한 콘텐츠를 소중히 다룰 것입니다.
네이버는 여러분이 게재한 게시물이 네이버 서비스를 통해 다른 이용자들에게 전달되어 우리 모두의 삶을 더욱 풍요롭게 해줄 것을 기대합니다. 게시물은 여러분이 타인 또는 자신이 보게 할 목적으로 네이버 서비스 상에 게재한 부호, 문자, 음성, 음향, 그림, 사진, 동영상, 링크 등으로 구성된 각종 콘텐츠 자체 또는 파일을 말합니다.

네이버는 여러분의 생각과 감정이 표현된 콘텐츠를 소중히 보호할 것을 약속 드립니다. 여러분이 제작하여 게재한 게시물에 대한 지식재산권 등의 권리는 당연히 여러분에게 있습니다.

한편, 네이버 서비스를 통해 여러분이 게재한 게시물을 적법하게 제공하려면 해당 콘텐츠에 대한 저장, 복제, 수정, 공중 송신, 전시, 배포, 2차적 저작물 작성(단, 번역에 한함) 등의 이용 권한(기한과 지역 제한에 정함이 없으며, 별도 대가 지급이 없는 라이선스)이 필요합니다.
게시물 게재로 여러분은 네이버에게 그러한 권한을 부여하게 되므로, 여러분은 이에 필요한 권리를 보유하고 있어야 합니다.

네이버는 여러분이 부여해 주신 콘텐츠 이용 권한을 저작권법 등 관련 법령에서 정하는 바에 따라 네이버 서비스 내 노출, 서비스 홍보를 위한 활용, 서비스 운영, 개선 및 새로운 서비스 개발을 위한 연구, 웹 접근성 등 법률상 의무 준수, 외부 사이트에서의 검색, 수집 및 링크 허용을 위해서만 제한적으로 행사할 것입니다.
만약, 그 밖의 목적을 위해 부득이 여러분의 콘텐츠를 이용하고자 할 경우엔 사전에 여러분께 설명을 드리고 동의를 받도록 하겠습니다.

또한 여러분이 제공한 소중한 콘텐츠는 네이버 서비스를 개선하고 새로운 네이버 서비스를 제공하기 위해 인공지능 분야 기술 등의 연구 개발 목적으로 네이버 및 네이버 계열사에서 사용될 수 있습니다. 네이버는 지속적인 연구 개발을 통해 여러분께 좀 더 편리하고 유용한 서비스를 제공해 드릴 수 있도록 최선을 다하겠습니다.

네이버는 여러분이 자신이 제공한 콘텐츠에 대한 네이버 또는 다른 이용자들의 이용 또는 접근을 보다 쉽게 관리할 수 있도록 다양한 수단을 제공하기 위해 노력하고 있습니다. 여러분은 네이버 서비스 내에 콘텐츠 삭제, 비공개 등의 관리기능이 제공되는 경우 이를 통해 직접 타인의 이용 또는 접근을 통제할 수 있고, 고객센터를 통해서도 콘텐츠의 삭제, 비공개, 검색결과 제외 등의 조치를 요청할 수 있습니다.
다만, 일부 네이버 서비스의 경우 삭제, 비공개 등의 처리가 어려울 수 있으며, 이러한 내용은 각 서비스 상의 안내, 공지사항, 고객센터 도움말 등에서 확인해 주시길 부탁 드립니다.

여러분의 개인정보를 소중히 보호합니다.
네이버는 서비스의 원활한 제공을 위하여 회원이 동의한 목적과 범위 내에서만 개인정보를 수집∙이용하며, 개인정보 보호 관련 법령에 따라 안전하게 관리합니다. 네이버가 이용자 및 회원에 대해 관련 개인정보를 안전하게 처리하기 위하여 기울이는 노력이나 기타 상세한 사항은 개인정보 처리방침에서 확인하실 수 있습니다.

네이버는 여러분이 서비스를 이용하기 위해 일정 기간 동안 로그인 혹은 접속한 기록이 없는 경우, 전자메일, 서비스 내 알림 또는 기타 적절한 전자적 수단을 통해 사전에 안내해 드린 후 여러분의 정보를 파기하거나 분리 보관할 수 있으며, 만약 이로 인해 서비스 제공을 위해 필수적인 정보가 부족해질 경우 부득이 관련 서비스 이용계약을 해지할 수 있습니다.

타인의 권리를 존중해 주세요.
여러분이 무심코 게재한 게시물로 인해 타인의 저작권이 침해되거나 명예훼손 등 권리 침해가 발생할 수 있습니다. 네이버는 이에 대한 문제 해결을 위해 ‘정보통신망 이용촉진 및 정보보호 등에 관한 법률’ 및 ‘저작권법’ 등을 근거로 권리침해 주장자의 요청에 따른 게시물 게시중단, 원 게시자의 이의신청에 따른 해당 게시물 게시 재개 등을 내용으로 하는 게시중단요청서비스를 운영하고 있습니다. 보다 상세한 내용 및 절차는 고객센터 내 게시중단요청서비스 소개를 참고해 주세요.

한편, 네이버 서비스를 통해 타인의 콘텐츠를 이용한다고 하여 여러분이 해당 콘텐츠에 대한 지식재산권을 보유하게 되는 것은 아닙니다. 여러분이 해당 콘텐츠를 자유롭게 이용하기 위해서는 그 이용이 저작권법 등 관련 법률에 따라 허용되는 범위 내에 있거나, 해당 콘텐츠의 지식재산권자로부터 별도의 이용 허락을 받아야 하므로 각별한 주의가 필요합니다.

네이버는 여러분이 네이버 서비스를 마음껏 이용할 수 있도록 여러분께 네이버 서비스에 수반되는 관련 소프트웨어 사용에 관한 이용 권한을 부여합니다. 이 경우 여러분의 자유로운 이용은 네이버가 제시하는 이용 조건에 부합하는 범위 내에서만 허용되고, 이러한 권한은 양도가 불가능하며, 비독점적 조건 및 법적고지가 적용된다는 점을 유의해 주세요.

네이버에서 제공하는 다양한 포인트를 요긴하게 활용해 보세요.
네이버는 여러분이 네이버 서비스를 효율적으로 이용할 수 있도록 포인트를 부여하고 있습니다. 포인트는 여러분의 일정한 네이버 서비스 이용과 연동하여 네이버가 임의로 책정하거나 조정하여 지급하는 일정한 계산 단위를 갖는 서비스 상의 가상 데이터를 말합니다. 포인트는 재산적 가치가 없기 때문에 금전으로 환불 또는 전환할 수 없지만, 포인트의 많고 적음에 따라 여러분의 네이버 서비스 이용에 영향을 주는 경우가 있으므로 경우에 따라 적절히 활용해 보세요.

네이버는 네이버 서비스의 효율적 이용을 지원하거나 서비스 운영을 개선하기 위해 필요한 경우 사전에 여러분께 안내 드린 후 부득이 포인트의 일부 또는 전부를 조정할 수 있습니다. 그리고 포인트는 네이버가 정한 기간에 따라 주기적으로 소멸할 수도 있으니 포인트가 부여되는 네이버 서비스 이용 시 유의해 주시기 바랍니다.

네이버 서비스 이용과 관련하여 몇 가지 주의사항이 있습니다.
네이버는 여러분이 네이버 서비스를 자유롭고 편리하게 이용할 수 있도록 최선을 다하고 있습니다. 다만, 여러분이 네이버 서비스를 보다 안전하게 이용하고 네이버 서비스에서 여러분과 타인의 권리가 서로 존중되고 보호받으려면 여러분의 도움과 협조가 필요합니다. 여러분의 안전한 서비스 이용과 권리 보호를 위해 부득이 아래와 같은 경우 여러분의 게시물 게재나 네이버 서비스 이용이 제한될 수 있으므로, 이에 대한 확인 및 준수를 요청 드립니다.

회원 가입 시 이름, 생년월일, 휴대전화번호 등의 정보를 허위로 기재해서는 안 됩니다. 회원 계정에 등록된 정보는 항상 정확한 최신 정보가 유지될 수 있도록 관리해 주세요. 자신의 계정을 다른 사람에게 판매, 양도, 대여 또는 담보로 제공하거나 다른 사람에게 그 사용을 허락해서는 안 됩니다. 아울러 자신의 계정이 아닌 타인의 계정을 무단으로 사용해서는 안 됩니다. 이에 관한 상세한 내용은 계정 운영정책을 참고해 주시기 바랍니다.
타인에 대해 직접적이고 명백한 신체적 위협을 가하는 내용의 게시물, 타인의 자해 행위 또는 자살을 부추기거나 권장하는 내용의 게시물, 타인의 신상정보, 사생활 등 비공개 개인정보를 드러내는 내용의 게시물, 타인을 지속적으로 따돌리거나 괴롭히는 내용의 게시물, 성매매를 제안, 알선, 유인 또는 강요하는 내용의 게시물, 공공 안전에 대해 직접적이고 심각한 위협을 가하는 내용의 게시물은 제한될 수 있습니다.
관련 법령상 금지되거나 형사처벌의 대상이 되는 행위를 수행하거나 이를 교사 또는 방조하는 등의 범죄 관련 직접적인 위험이 확인된 게시물, 관련 법령에서 홍보, 광고, 판매 등을 금지하고 있는 물건 또는 서비스를 홍보, 광고, 판매하는 내용의 게시물, 타인의 지식재산권 등을 침해하거나 모욕, 사생활 침해 또는 명예훼손 등 타인의 권리를 침해하는 내용이 확인된 게시물은 제한될 수 있습니다.
자극적이고 노골적인 성행위를 묘사하는 등 타인에게 성적 수치심을 유발시키거나 왜곡된 성 의식 등을 야기할 수 있는 내용의 게시물, 타인에게 잔혹감 또는 혐오감을 일으킬 수 있는 폭력적이고 자극적인 내용의 게시물, 본인 이외의 자를 사칭하거나 허위사실을 주장하는 등 타인을 기만하는 내용의 게시물, 과도한 욕설, 비속어 등을 계속하여 반복적으로 사용하여 심한 혐오감 또는 불쾌감을 일으키는 내용의 게시물은 제한될 수 있습니다.
자동화된 수단을 활용하는 등 네이버 서비스의 기능을 비정상적으로 이용하여 게재된 게시물, 네이버 각 개별 서비스의 제공 취지와 부합하지 않는 내용의 게시물은 다른 이용자들의 정상적인 네이버 서비스 이용에 불편을 초래하고 더 나아가 네이버의 원활한 서비스 제공을 방해하므로 역시 제한될 수 있습니다. 기타 제한되는 게시물에 관한 상세한 내용은 게시물 운영정책 및 각 개별 서비스에서의 약관, 운영정책 등을 참고해 주시기 바랍니다.
네이버의 사전 허락 없이 자동화된 수단(예: 매크로 프로그램, 로봇(봇), 스파이더, 스크래퍼 등)을 이용하여 네이버 서비스 회원으로 가입을 시도 또는 가입하거나, 네이버 서비스에 로그인을 시도 또는 로그인하거나, 네이버 서비스 상에 게시물을 게재하거나, 네이버 서비스를 통해 커뮤니케이션하거나(예: 전자메일, 쪽지 등), 네이버 서비스에 게재된 회원의 아이디(ID), 게시물 등을 수집하거나, 네이버 검색 서비스에서 특정 질의어로 검색하거나 혹은 그 검색결과에서 특정 검색결과를 선택(이른바 ‘클릭’)하는 등 이용자(사람)의 실제 이용을 전제로 하는 네이버 서비스의 제공 취지에 부합하지 않는 방식으로 네이버 서비스를 이용하거나 이와 같은 네이버 서비스에 대한 어뷰징(남용) 행위를 막기 위한 네이버의 기술적 조치를 무력화하려는 일체의 행위(예: IP를 지속적으로 바꿔가며 접속하는 행위, Captcha를 외부 솔루션 등을 통해 우회하거나 무력화 하는 행위 등)를 시도해서는 안 됩니다.
네이버의 동의 없이 자동화된 수단에 의해 네이버 서비스 상에 광고가 게재되는 영역 또는 그 밖의 영역에 부호, 문자, 음성, 음향, 그림, 사진, 동영상, 링크 등으로 구성된 각종 콘텐츠 자체 또는 파일을 삽입해서는 안 됩니다. 또한, 네이버 서비스 또는 이에 포함된 소프트웨어를 복사, 수정할 수 없으며, 이를 판매, 양도, 대여 또는 담보로 제공하거나 타인에게 그 이용을 허락해서는 안 됩니다. 네이버 서비스에 포함된 소프트웨어를 역 설계, 소스코드 추출 시도, 복제, 분해, 모방, 기타 변형하는 등의 행위도 금지됩니다(다만, 오픈소스에 해당되는 경우 그 자체 조건에 따릅니다). 그 밖에 바이러스나 기타 악성 코드를 업로드하거나 네이버 서비스의 원활한 운영을 방해할 목적으로 서비스 기능을 비정상적으로 이용하는 행위 역시 금지됩니다.
네이버는 본 약관의 범위 내에서 게시물 운영정책, 각 개별 서비스에서의 약관 또는 운영정책, 각 서비스 상의 안내, 공지사항, 고객센터 도움말 등을 두어, 여러분에게 안정적이고 원활한 서비스 이용이 가능하도록 지원하고 있습니다. 각 세부 정책에는 여러분이 참고할 수 있도록 보다 구체적인 유의사항을 포함하고 있으니, 본 약관 본문 및 구성 페이지 상의 링크 등을 통해 이를 확인해 주시기 바랍니다.

부득이 서비스 이용을 제한할 경우 합리적인 절차를 준수합니다.
네이버는 다양한 정보와 의견이 담긴 여러분의 콘텐츠를 소중히 다룰 것을 약속 드립니다만, 여러분이 게재한 게시물이 관련 법령, 본 약관, 게시물 운영정책, 각 개별 서비스에서의 약관, 운영정책 등에 위배되는 경우, 부득이 이를 비공개 또는 삭제 처리하거나 게재를 거부할 수 있습니다. 다만, 이것이 네이버가 모든 콘텐츠를 검토할 의무가 있다는 것을 의미하지는 않습니다.

또한 여러분이 관련 법령, 본 약관, 계정 및 게시물 운영정책, 각 개별 서비스에서의 약관, 운영정책 등을 준수하지 않을 경우, 네이버는 여러분의 관련 행위 내용을 확인할 수 있으며, 그 확인 결과에 따라 네이버 서비스 이용에 대한 주의를 당부하거나, 네이버 서비스 이용을 일부 또는 전부, 일시 또는 영구히 정지시키는 등 그 이용을 제한할 수 있습니다. 한편, 이러한 이용 제한에도 불구하고 더 이상 네이버 서비스 이용계약의 온전한 유지를 기대하기 어려운 경우엔 부득이 여러분과의 이용계약을 해지할 수 있습니다.

부득이 여러분의 서비스 이용을 제한해야 할 경우 명백한 법령 위반이나 타인의 권리침해로서 긴급한 위험 또는 피해 차단이 요구되는 사안 외에는 위와 같은 단계적 서비스 이용제한 원칙을 준수 하겠습니다. 명백한 법령 위반 등을 이유로 부득이 서비스 이용을 즉시 영구 정지시키는 경우 서비스 이용을 통해 획득한 포인트 및 기타 혜택 등은 모두 소멸되고 이에 대해 별도로 보상하지 않으므로 유의해 주시기 바랍니다. 서비스 이용 제한의 조건, 세부 내용 등은 계정 운영정책 및 각 개별 서비스에서의 운영정책을 참고하시기 바랍니다.

네이버의 잘못은 네이버가 책임집니다.
네이버는 여러분이 네이버 서비스를 이용함에 있어 네이버의 고의 또는 과실로 인하여 손해를 입게 될 경우 관련 법령에 따라 여러분의 손해를 배상합니다. 다만, 천재지변 또는 이에 준하는 불가항력으로 인하여 네이버가 서비스를 제공할 수 없거나 이용자의 고의 또는 과실로 인하여 서비스를 이용할 수 없어 발생한 손해에 대해서 네이버는 책임을 부담하지 않습니다.

그리고 네이버가 손해배상책임을 부담하는 경우에도 통상적으로 예견이 불가능하거나 특별한 사정으로 인한 특별 손해 또는 간접 손해, 기타 징벌적 손해에 대해서는 관련 법령에 특별한 규정이 없는 한 책임을 부담하지 않습니다.

한편, 네이버 서비스를 매개로 한 여러분과 다른 회원 간 또는 여러분과 비회원 간의 의견 교환, 거래 등에서 발생한 손해나 여러분이 서비스 상에 게재된 타인의 게시물 등의 콘텐츠를 신뢰함으로써 발생한 손해에 대해서도 네이버는 특별한 사정이 없는 한 이에 대해 책임을 부담하지 않습니다.

언제든지 네이버 서비스 이용계약을 해지하실 수 있습니다.
네이버에게는 참 안타까운 일입니다만, 회원은 언제든지 네이버 서비스 이용계약 해지를 신청하여 회원에서 탈퇴할 수 있으며, 이 경우 네이버는 관련 법령 등이 정하는 바에 따라 이를 지체 없이 처리하겠습니다.

네이버 서비스 이용계약이 해지되면, 관련 법령 및 개인정보처리방침에 따라 네이버가 해당 회원의 정보를 보유할 수 있는 경우를 제외하고, 해당 회원 계정에 부속된 게시물 일체를 포함한 회원의 모든 데이터는 소멸됨과 동시에 복구할 수 없게 됩니다. 다만, 이 경우에도 다른 회원이 별도로 담아갔거나 스크랩한 게시물과 공용 게시판에 등록한 댓글 등의 게시물은 삭제되지 않으므로 반드시 해지 신청 이전에 삭제하신 후 탈퇴하시기 바랍니다.

일부 네이버 서비스에는 광고가 포함되어 있습니다.
여러분이 다양한 네이버 서비스를 이용하다 보면 간혹 일부 개별 서비스에 광고가 포함된 경우가 있습니다. 네이버 서비스를 이용하면서 발생할 수 있는 데이터 통신요금은 가입하신 통신사업자와의 이용계약에 따라 여러분이 부담하며, 포함된 광고 열람으로 인해 추가적으로 발생하는 비용 역시 여러분이 부담합니다.

원하는 네이버 서비스를 이용하기 위해 원하지 않는 광고를 봐야 하는 경우가 있습니다. 이는 여러분에게 제공하는 다양한 네이버 서비스를 원칙적으로 무료로 제공할 수 있게 해주는 데 기여하며, 더 나아가 네이버가 연구 개발에 투자하여 더 나은 서비스를 제공할 수 있는 기반이 됩니다. 최근 타사의 일부 서비스들이 광고 없는 서비스 이용을 강조하며 주된 서비스를 유료로 제공하고 있는 관행이 이를 뒷받침합니다.

네이버는 여러분의 본의 아닌 불편이나 부담이 최소화될 수 있는 방법에 대해 항상 고민하고 개선해 나가겠습니다.

서비스 중단 또는 변경 시 꼭 알려드리겠습니다.
네이버는 연중 무휴, 1일 24시간 안정적으로 서비스를 제공하기 위해 최선을 다하고 있습니다만, 컴퓨터, 서버 등 정보통신설비의 보수점검, 교체 또는 고장, 통신두절 등 운영상 상당한 이유가 있는 경우 부득이 서비스의 전부 또는 일부를 중단할 수 있습니다.

한편, 네이버는 서비스 운영 또는 개선을 위해 상당한 필요성이 있는 경우 서비스의 전부 또는 일부를 수정, 변경 또는 종료할 수 있습니다. 무료로 제공되는 서비스의 전부 또는 일부를 수정, 변경 또는 종료하게 된 경우 관련 법령에 특별한 규정이 없는 한 별도의 보상을 하지 않습니다.

이 경우 네이버는 예측 가능한 경우 상당기간 전에 이를 안내하며, 만약 예측 불가능한 경우라면 사후 지체 없이 상세히 설명하고 안내 드리겠습니다. 또한 서비스 중단의 경우에는 여러분 자신의 콘텐츠를 백업할 수 있도록 합리적이고 충분한 기회를 제공하도록 하겠습니다.

주요 사항을 잘 안내하고 여러분의 소중한 의견에 귀 기울이겠습니다.
네이버는 서비스 이용에 필요한 주요사항을 적시에 잘 안내해 드릴 수 있도록 힘쓰겠습니다. 회원에게 통지를 하는 경우 전자메일, 서비스 내 알림 또는 기타 적절한 전자적 수단을 통해 개별적으로 알려 드릴 것이며, 다만 회원 전체에 대한 통지가 필요할 경우엔 7일 이상 www.naver.com을 비롯한 네이버 도메인의 웹사이트 및 응용프로그램(어플리케이션, 앱) 초기 화면 또는 공지사항 등에 관련 내용을 게시하도록 하겠습니다.

네이버는 여러분의 소중한 의견에 귀 기울이겠습니다. 여러분은 언제든지 고객센터를 통해 서비스 이용과 관련된 의견이나 개선사항을 전달할 수 있으며, 네이버는 합리적 범위 내에서 가능한 그 처리과정 및 결과를 여러분께 전달할 수 있도록 하겠습니다.

여러분이 쉽게 알 수 있도록 약관 및 운영정책을 게시하며 사전 공지 후 개정합니다.
네이버는 본 약관의 내용을 여러분이 쉽게 확인할 수 있도록 서비스 초기 화면에 게시하고 있습니다.

네이버는 수시로 본 약관, 계정 및 게시물 운영정책을 개정할 수 있습니다만, 관련 법령을 위배하지 않는 범위 내에서 개정할 것이며, 사전에 그 개정 이유와 적용 일자를 서비스 내에 알리도록 하겠습니다. 또한 여러분에게 불리할 수 있는 중대한 내용의 약관 변경의 경우에는 최소 30일 이전에 해당 서비스 내 공지하고 별도의 전자적 수단(전자메일, 서비스 내 알림 등)을 통해 개별적으로 알릴 것입니다.

네이버는 변경된 약관을 게시한 날로부터 효력이 발생되는 날까지 약관 변경에 대한 여러분의 의견을 기다립니다. 위 기간이 지나도록 여러분의 의견이 네이버에 접수되지 않으면, 여러분이 변경된 약관에 따라 서비스를 이용하는 데에 동의하는 것으로 간주됩니다. 네이버로서는 매우 안타까운 일이지만, 여러분이 변경된 약관에 동의하지 않는 경우 변경된 약관의 적용을 받는 해당 서비스의 제공이 더 이상 불가능하게 될 수 있습니다.

네이버 서비스에는 기본적으로 본 약관이 적용됩니다만, 부득이 각 개별 서비스의 고유한 특성을 반영하기 위해 본 약관 외 별도의 약관, 운영정책이 추가로 적용될 때가 있습니다. 따라서 별도의 약관, 운영정책에서 그 개별 서비스 제공에 관하여 본 약관, 계정 및 게시물 운영정책과 다르게 정한 경우에는 별도의 약관, 운영정책이 우선하여 적용됩니다. 이러한 내용은 각각의 개별 서비스 초기 화면에서 확인해 주시기 바랍니다.

본 약관은 한국어를 정본으로 합니다. 본 약관 또는 네이버 서비스와 관련된 여러분과 네이버와의 관계에는 대한민국의 법령이 적용됩니다. 그리고 본 약관 또는 네이버 서비스와 관련하여 여러분과 네이버 사이에 분쟁이 발생할 경우, 그 분쟁의 처리는 대한민국 '민사소송법'에서 정한 절차를 따릅니다.

공지 일자: 2018년 3월 30일
적용 일자: 2018년 5월 1일
네이버 서비스와 관련하여 궁금하신 사항이 있으시면 고객센터(대표번호: 1588 – 3820/ 평일 09:00~18:00)로 문의 주시기 바랍니다.</textarea></td>
                    </tr>
                    <tr>
                        <!-- <td colspan="6" align="center"> -->
                        <th colspan="6" style="text-align:center; padding:10px 0px; ">
        		<label class="switch-button">
					<input type="checkbox"
							name="agree"
							value="using"
							id="using"/> 
    		<span class="onoff-switch"></span></label><label for="using">&nbsp;<b>ㅡ동의합니다.</b></label>
                           <!--  <input type="radio" class="radioY" name="radio_1"  required id="agree1"><label for="agree1">동의합니다</label>
                            <input type="radio" class="radioN" name="radio_1" required  id="noAgree1" checked><label for="noAgree1">동의하지 않습니다.</label> -->
                        </th>
                    </tr>
                    <tr>
                        <td colspan="6" align="center"><h3 style="padding-top:10px; border-top:1px solid  darkgray; padding-bottom:10px; ">&nbsp;&nbsp;개인정보 수집 및 이용 동의 안내서&nbsp;<sub style="color:blue;">(필수)</sub></h3><textarea rows="10" cols="140" style="overflow-y: scroll; resize: none;" readonly>개인정보보호법에 따라 네이버에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.

1. 수집하는 개인정보
이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 네이버 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 네이버는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.

회원가입 시점에 네이버가 이용자로부터 수집하는 개인정보는 아래와 같습니다.
- 회원 가입 시 필수항목으로 아이디, 비밀번호, 이름, 생년월일, 성별, 휴대전화번호를, 선택항목으로 본인확인 이메일주소를 수집합니다.
단, 비밀번호 없이 회원 가입 시에는 필수항목으로 아이디, 이름, 생년월일, 휴대전화번호를, 선택항목으로 비밀번호를 수집합니다.
만약 이용자가 입력하는 생년월일이 만14세 미만 아동일 경우에는 법정대리인 정보(법정대리인의 이름, 생년월일, 성별, 중복가입확인정보(DI), 휴대전화번호)를 추가로 수집합니다.
- 단체아이디로 회원가입 시 단체아이디, 비밀번호, 단체이름, 이메일주소, 휴대전화번호를 필수항목으로 수집합니다. 그리고 단체 대표자명을 선택항목으로 수집합니다.
서비스 이용 과정에서 이용자로부터 수집하는 개인정보는 아래와 같습니다.
- 회원정보 또는 개별 서비스에서 프로필 정보(별명, 프로필 사진)를 설정할 수 있습니다. 회원정보에 별명을 입력하지 않은 경우에는 마스킹 처리된 아이디가 별명으로 자동 입력됩니다.

- 네이버 내의 개별 서비스 이용, 이벤트 응모 및 경품 신청 과정에서 해당 서비스의 이용자에 한해 추가 개인정보 수집이 발생할 수 있습니다. 추가로 개인정보를 수집할 경우에는 해당 개인정보 수집 시점에서 이용자에게 ‘수집하는 개인정보 항목, 개인정보의 수집 및 이용목적, 개인정보의 보관기간’에 대해 안내 드리고 동의를 받습니다.

서비스 이용 과정에서 IP 주소, 쿠키, 서비스 이용 기록, 기기정보, 위치정보가 생성되어 수집될 수 있습니다. 또한 이미지 및 음성을 이용한 검색 서비스 등에서 이미지나 음성이 수집될 수 있습니다.
구체적으로 1) 서비스 이용 과정에서 이용자에 관한 정보를 자동화된 방법으로 생성하여 이를 저장(수집)하거나,
2) 이용자 기기의 고유한 정보를 원래의 값을 확인하지 못 하도록 안전하게 변환하여 수집합니다. 서비스 이용 과정에서 위치정보가 수집될 수 있으며,
네이버에서 제공하는 위치기반 서비스에 대해서는 '네이버 위치기반서비스 이용약관'에서 자세하게 규정하고 있습니다.
이와 같이 수집된 정보는 개인정보와의 연계 여부 등에 따라 개인정보에 해당할 수 있고, 개인정보에 해당하지 않을 수도 있습니다.

2. 수집한 개인정보의 이용
네이버 및 네이버 관련 제반 서비스(모바일 웹/앱 포함)의 회원관리, 서비스 개발・제공 및 향상, 안전한 인터넷 이용환경 구축 등 아래의 목적으로만 개인정보를 이용합니다.

- 회원 가입 의사의 확인, 연령 확인 및 법정대리인 동의 진행, 이용자 및 법정대리인의 본인 확인, 이용자 식별, 회원탈퇴 의사의 확인 등 회원관리를 위하여 개인정보를 이용합니다.
- 콘텐츠 등 기존 서비스 제공(광고 포함)에 더하여, 인구통계학적 분석, 서비스 방문 및 이용기록의 분석, 개인정보 및 관심에 기반한 이용자간 관계의 형성, 지인 및 관심사 등에 기반한 맞춤형 서비스 제공 등 신규 서비스 요소의 발굴 및 기존 서비스 개선 등을 위하여 개인정보를 이용합니다.
- 법령 및 네이버 이용약관을 위반하는 회원에 대한 이용 제한 조치, 부정 이용 행위를 포함하여 서비스의 원활한 운영에 지장을 주는 행위에 대한 방지 및 제재, 계정도용 및 부정거래 방지, 약관 개정 등의 고지사항 전달, 분쟁조정을 위한 기록 보존, 민원처리 등 이용자 보호 및 서비스 운영을 위하여 개인정보를 이용합니다.
- 유료 서비스 제공에 따르는 본인인증, 구매 및 요금 결제, 상품 및 서비스의 배송을 위하여 개인정보를 이용합니다.
- 이벤트 정보 및 참여기회 제공, 광고성 정보 제공 등 마케팅 및 프로모션 목적으로 개인정보를 이용합니다.
- 서비스 이용기록과 접속 빈도 분석, 서비스 이용에 대한 통계, 서비스 분석 및 통계에 따른 맞춤 서비스 제공 및 광고 게재 등에 개인정보를 이용합니다.
- 보안, 프라이버시, 안전 측면에서 이용자가 안심하고 이용할 수 있는 서비스 이용환경 구축을 위해 개인정보를 이용합니다.
3. 개인정보의 보관기간
회사는 원칙적으로 이용자의 개인정보를 회원 탈퇴 시 지체없이 파기하고 있습니다.
단, 이용자에게 개인정보 보관기간에 대해 별도의 동의를 얻은 경우, 또는 법령에서 일정 기간 정보보관 의무를 부과하는 경우에는 해당 기간 동안 개인정보를 안전하게 보관합니다.

이용자에게 개인정보 보관기간에 대해 회원가입 시 또는 서비스 가입 시 동의를 얻은 경우는 아래와 같습니다.
- 부정 가입 및 이용 방지
부정 이용자의 가입인증 휴대전화번호 또는 DI (만14세 미만의 경우 법정대리인DI) : 탈퇴일로부터 6개월 보관
탈퇴한 이용자의 휴대전화번호(복호화가 불가능한 일방향 암호화(해시처리)) : 탈퇴일로부터 6개월 보관
- QR코드 복구 요청 대응
QR코드 등록 정보:삭제 시점으로부터6개월 보관
- 스마트플레이스 분쟁 조정 및 고객문의 대응
휴대전화번호:등록/수정/삭제 요청 시로부터 최대1년
- 네이버 플러스 멤버십 서비스 혜택 중복 제공 방지
암호화처리(해시처리)한DI :혜택 제공 종료일로부터6개월 보관
- 지식iN eXpert 재가입 신청 및 부정 이용 방지
eXpert 서비스 및 eXpert 센터 가입 등록정보 : 신청일로부터 6개월(등록 거절 시, 거절 의사 표시한 날로부터 30일) 보관
전자상거래 등에서의 소비자 보호에 관한 법률, 전자문서 및 전자거래 기본법, 통신비밀보호법 등 법령에서 일정기간 정보의 보관을 규정하는 경우는 아래와 같습니다. 네이버는 이 기간 동안 법령의 규정에 따라 개인정보를 보관하며, 본 정보를 다른 목적으로는 절대 이용하지 않습니다.
- 전자상거래 등에서 소비자 보호에 관한 법률
계약 또는 청약철회 등에 관한 기록: 5년 보관
대금결제 및 재화 등의 공급에 관한 기록: 5년 보관
소비자의 불만 또는 분쟁처리에 관한 기록: 3년 보관
- 전자문서 및 전자거래 기본법
공인전자주소를 통한 전자문서 유통에 관한 기록 : 10년 보관
- 전자서명 인증 업무
인증서와 인증 업무에 관한 기록: 인증서 효력 상실일로부터 10년 보관
- 통신비밀보호법
로그인 기록: 3개월

참고로 네이버는 ‘개인정보 유효기간제’에 따라 1년간 서비스를 이용하지 않은 회원의 개인정보를 별도로 분리 보관하여 관리하고 있습니다.

4. 개인정보 수집 및 이용 동의를 거부할 권리
이용자는 개인정보의 수집 및 이용 동의를 거부할 권리가 있습니다. 회원가입 시 수집하는 최소한의 개인정보, 즉, 필수 항목에 대한 수집 및 이용 동의를 거부하실 경우, 회원가입이 어려울 수 있습니다.</textarea></td>
                   </tr>
                    <tr style="border-bottom: 2px solid darkgrey; ">
                        <td colspan="6" align="center" style="padding:10px 0px; ">
                        <label class="switch-button">
					<input type="checkbox"
							name="agree"
							value="privacy"
							id="privacy"/> 
    		<span class="onoff-switch"></span></label> <label for="privacy">&nbsp;<b>ㅡ동의합니다.</b></label>
                            <!-- <input type="radio" class="radioY" name="radio_2" required style="width:10" id="agree2"><label for="agree2">동의합니다</label>
                            <input type="radio" class="radioN" name="radio_2"  id="noAgree2" required style="width:3" checked ><label for="noAgree2">동의하지 않습니다.</label> -->
                        </td>
                    </tr>
                    <tr>
                    	<td colspan='6' align='center' ><h3 style="padding:13px;">위치기반서비스 이용약관 동의<sup style="color:grey;">(선택)</sup></h3>
                    		<textarea rows="10" cols="140" style ='overflow-y:scroll; resize : none;' readonly>위치기반서비스 이용약관에 동의하시면, 위치를 활용한 광고 정보 수신 등을 포함하는 네이버 위치기반 서비스를 이용할 수 있습니다.

제 1 조 (목적)
이 약관은 네이버 주식회사 (이하 “회사”)가 제공하는 위치기반서비스와 관련하여 회사와 개인위치정보주체와의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.

제 2 조 (약관 외 준칙)
이 약관에 명시되지 않은 사항은 위치정보의 보호 및 이용 등에 관한 법률, 개인정보보호법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 전기통신기본법, 전기통신사업법 등 관계법령과 회사의 이용약관 및 개인정보처리방침, 회사가 별도로 정한 지침 등에 의합니다.

제 3 조 (서비스 내용 및 요금)
① 회사는 위치정보사업자로부터 위치정보를 전달받아 아래와 같은 위치기반서비스를 제공합니다.

1. GeoTagging 서비스: 게시물 또는 이용자가 저장하는 콘텐츠에 포함된 개인위치정보주체 또는 이동성 있는 기기의 위치정보가 게시물과 함께 저장됩니다. 저장된 위치정보는 별도의 활용없이 보관되거나, 또는 장소를 기반으로 콘텐츠를 분류하거나 검색할 수 있는 기능이 제공될 수도 있습니다.
2. 위치정보를 활용한 검색결과 및 콘텐츠 제공 : 정보 검색을 요청하거나 개인위치정보주체 또는 이동성 있는 기기의 위치정보를 제공 시 본 위치정보를 이용한 검색결과, 주변결과(맛집, 주변업체, 교통수단 등), 번역결과를 제시합니다.
3. 이용자 위치를 활용한 광고정보 제공: 검색결과 또는 기타 서비스 이용 과정에서 개인위치정보주체 또는 이동성 있는 기기의 위치를 이용하여 광고소재를 제시합니다.
4. 이용자 보호 및 부정 이용 방지: 개인위치정보주체 또는 이동성 있는 기기의 위치를 이용하여 권한없는 자의 비정상적인 서비스 이용 시도 등을 차단합니다.
5. 길 안내 등 생활편의 서비스 제공: 교통정보와 길 안내 등 최적의 경로를 지도로 제공하며, 주변 시설물 찾기, 뉴스/날씨 등 생활정보, 긴급구조 서비스, 주소 자동 입력 등 다양한 운전 및 생활 편의 서비스를 제공합니다.
② 제1항 위치기반서비스의 이용요금은 무료입니다.
제 4 조 (개인위치정보주체의 권리)
① 개인위치정보주체는 개인위치정보 수집 범위 및 이용약관의 내용 중 일부 또는 개인위치정보의 이용ㆍ제공 목적, 제공받는 자의 범위 및 위치기반서비스의 일부에 대하여 동의를 유보할 수 있습니다.
② 개인위치정보주체는 개인위치정보의 수집ㆍ이용ㆍ제공에 대한 동의의 전부 또는 일부를 철회할 수 있습니다.
③ 개인위치정보주체는 언제든지 개인위치정보의 수집ㆍ이용ㆍ제공의 일시적인 중지를 요구할 수 있습니다. 이 경우 회사는 요구를 거절하지 아니하며, 이를 위한 기술적 수단을 갖추고 있습니다
④ 개인위치정보주체는 회사에 대하여 아래 자료의 열람 또는 고지를 요구할 수 있고, 당해 자료에 오류가 있는 경우에는 그 정정을 요구할 수 있습니다. 이 경우 회사는 정당한 이유 없이 요구를 거절하지 아니합니다.

1. 개인위치정보주체에 대한 위치정보 수집ㆍ이용ㆍ제공사실 확인자료
2. 개인위치정보주체의 개인위치정보가 위치정보의 보호 및 이용 등에 관한 법률 또는 다른 법령의 규정에 의하여 제3자에게 제공된 이유 및 내용
⑤ 회사는 개인위치정보주체가 동의의 전부 또는 일부를 철회한 경우에는 지체 없이 수집된 개인위치정보 및 위치정보 수집ㆍ이용ㆍ제공사실 확인자료를 파기합니다.단, 동의의 일부를 철회하는 경우에는 철회하는 부분의 개인위치정보 및 위치정보 수집ㆍ이용ㆍ제공사실 확인자료에 한합니다.
⑥ 개인위치정보주체는 제1항 내지 제4항의 권리행사를 위하여 이 약관 제13조의 연락처를 이용하여 회사에 요구할 수 있습니다.
제 5 조 (법정대리인의 권리)
① 회사는 만14세 미만 아동으로부터 개인위치정보를 수집ㆍ이용 또는 제공하고자 하는 경우에는 만14세 미만 아동과 그 법정대리인의 동의를 받아야 합니다.
② 법정대리인은 만14세 미만 아동의 개인위치정보를 수집ㆍ이용ㆍ제공에 동의하는 경우 동의유보권, 동의철회권 및 일시중지권, 열람ㆍ고지요구권을 행사할 수 있습니다.
제 6 조 (위치정보 이용·제공사실 확인자료 보유근거 및 보유기간)
회사는 위치정보의 보호 및 이용 등에 관한 법률 제16조 제2항에 근거하여 개인위치정보주체에 대한 위치정보 수집·이용·제공사실 확인자료를 위치정보시스템에 자동으로 기록하며, 6개월 이상 보관합니다.
제 7 조 (서비스의 변경 및 중지)
① 회사는 위치기반서비스사업자의 정책변경 등과 같이 회사의 제반 사정 또는 법률상의 장애 등으로 서비스를 유지할 수 없는 경우, 서비스의 전부 또는 일부를 제한, 변경하거나 중지할 수 있습니다.
② 제1항에 의한 서비스 중단의 경우에는 회사는 사전에 인터넷 등에 공지하거나 개인위치정보주체에게 통지합니다.
제 8 조 (개인위치정보 제3자 제공 시 즉시 통보)
① 회사는 개인위치정보주체의 동의 없이 당해 개인위치정보주체의 개인위치정보를 제3자에게 제공하지 아니하며, 제3자 제공 서비스를 제공하는 경우에는 제공받는 자 및 제공목적을 사전에 개인위치정보주체에게 고지하고 동의를 받습니다.
② 회사는 개인위치정보를 개인위치정보주체가 지정하는 제3자에게 제공하는 경우에는 개인위치정보를 수집한 당해 통신단말장치로 매회 개인위치정보주체에게 제공받는 자, 제공일시 및 제공목적을 즉시 통보합니다.
③ 다만, 아래에 해당하는 경우에는 개인위치정보주체가 미리 특정하여 지정한 통신단말장치 또는 전자우편주소 등으로 통보합니다.

1.개인위치정보를 수집한 당해 통신단말장치가 문자, 음성 또는 영상의 수신기능을 갖추지 아니한 경우
2.개인위치정보주체가 개인위치정보를 수집한 당해 통신단말장치 외의 통신단말장치 또는 전자우편주소 등으로 통보할 것을 미리 요청한 경우
제 9 조 (8세 이하의 아동 등의 보호의무자의 권리)
① 회사는 아래의 경우에 해당하는 자(이하 “8세 이하의 아동 등"이라 함)의 보호의무자가 8세 이하의 아동 등의 생명 또는 신체보호를 위하여 개인위치정보의 이용 또는 제공에 동의하는 경우에는 본인의 동의가 있는 것으로 봅니다.

1. 8세 이하의 아동
2. 피성년후견인
3. 장애인복지법 제2조제2항제2호의 규정에 의한 정신적 장애를 가진 자로서 장애인고용촉진 및 직업재활법 제2조제2호의 규정에 의한 중증장애인에 해당하는 자(장애인복지법 제32조의 규정에 의하여 장애인등록을 한 자에 한정)
② 8세 이하의 아동 등의 생명 또는 신체의 보호를 위하여 개인위치정보의 이용 또는 제공에 동의를 하고자 하는 보호의무자는 서면동의서에 보호의무자임을 증명하는 서면을 첨부하여 회사에 제출하여야 합니다.
③ 보호의무자는 8세 이하의 아동 등의 개인위치정보 이용 또는 제공에 동의하는 경우 개인위치정보주체 권리의 전부를 행사할 수 있습니다
제 10 조 (개인위치정보의 보유목적 및 이용기간)
① 회사는 위치기반서비스를 제공하기 위해 필요한 최소한의 기간 동안 개인위치정보를 보유 및 이용합니다.
② 회사는 대부분의 위치기반서비스에서 개인위치정보를 일회성 또는 임시로 이용 후 지체없이 파기합니다. 단, ‘GeoTagging’ 서비스와 같이 이용자가 게시물, 콘텐츠와 함께 개인위치정보를 네이버 서비스에 게시 또는 보관하는 경우, 해당 게시물, 콘텐츠의 보관기간 동안 개인위치정보가 함께 보관됩니다.
제 11 조 (손해배상)
개인위치정보주체는 회사의 위치정보의 보호 및 이용 등에 관한 법률 제15조 내지 26조의 규정을 위반한 행위로 손해를 입은 경우에 회사에 대하여 손해배상을 청구할 수 있습니다. 이 경우 회사는 고의 또는 과실이 없음을 입증하지 아니하면 책임을 면할 수 없습니다.
제 12 조 (분쟁의 조정)
① 회사는 위치정보와 관련된 분쟁에 대하여 개인위치정보주체와 협의가 이루어지지 아니하거나 협의를 할 수 없는 경우에는 방송통신위원회에 재정을 신청할 수 있습니다.
② 회사 또는 개인위치정보주체는 위치정보와 관련된 분쟁에 대해 당사자간 협의가 이루어지지 아니하거나 협의를 할 수 없는 경우에는 개인정보보호법에 따라 개인정보분쟁조정위원회에 조정을 신청할 수 있습니다.
제 13 조 (사업자 정보 및 위치정보 관리책임자)
① 회사의 상호, 주소 및 연락처는 다음과 같습니다.

- 상호: 네이버주식회사
- 주소: 경기도 성남시 분당구 정자일로 95, NAVER 1784 (우)13561
- 전화번호: 1588-3820
② 회사는 다음과 같이 위치정보 관리책임자를 지정하여 이용자들이 서비스 이용과정에서 발생한 민원사항 처리를 비롯하여 개인위치정보주체의 권리 보호를 위해 힘쓰고 있습니다.

- 위치정보 관리책임자 : 이진규 CPO / DPO (개인정보 보호책임자 겸직)
- 메일 : 문의하기
부칙
제1조 시행일
2022년 4월 27일부터 시행되던 종전의 약관은 본 약관으로 대체하며, 본 약관은 2022년 5월 18일부터 적용됩니다.</textarea>
                    	</td>
                    </tr>
                    <tr border-bottom="2">
                    <td colspan="6" align="center" style="padding:10px 0px; border-bottom:1px solid darkgrey;">
                          <label class="switch-button">
					<input type="checkbox"
						   name="agree"
						   value="location"
						   id="location"/> 
    		<span class="onoff-switch"></span></label> <label for="location">&nbsp; <b>ㅡ동의합니다.</b></label>
                            
                        </td>
                     </tr> 
                     <tr align=center style="border-bottom:2px solid darkgrey">
                     	
                     	<td colspan="6" align="center" style="padding-bottom=10px;"><h3 style="padding:13px;">이벤트 정보 수신동의<sup style="color:darkgrey;">(선택)</sup></h3>
                     		
                     		<p>
								네이버 서비스 및 제휴 이벤트・혜택 등의 정보를 휴대전화<br>(네이버앱 알림 또는 문자), 이메일로 받을 수 있습니다.<br> 일부 서비스(별개의 회원 체계 운영, 네이버 가입 후 추가 <br>가입하는 서비스 등)의 경우, 수신에 대해 별도로 안내드리며 동의를 구합니다.                     	
                     		</p>
                     		
                     	<label class="switch-button">
					<input type="checkbox"
						   name="agree"
						   value="promotion"
						   id="event"/> 
    		<span class="onoff-switch"></span></label><label for="event" style="padding-bottom:10px;">&nbsp;<b>ㅡ동의합니다.</b></label>
                     	</td>
                     </tr>
                </thead>
                <tbody>
                    <tr>
                        <td colspan="6"><h3 style="padding: 25px; border-bottom: 2px solid darkgray;"> 기본정보</h3></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr style="border-bottom: 2px solid darkgrey; ">
                        <td style="width: 400px;"><b> * 아이디 </b></td>
                            <td colspan="2"><input type="text" name="memberId" id="memberId" class="input_id" style="width:px" required ><br><font size="2" id="chkId">2글자이상,11글자까지 영소대문자와 조합해주세요.</font></td>
                            <td ><button type="button" class="btn btn-secondary" style="border-radius:30px; padding: 20px; width:120px; margin:auto;" onclick="idCheck();" >중복확인</button> &nbsp;
                            </td>
                            <td><span class="placehold-text"></span></td>
                            <td></td>
                           
                    </tr>
                    <tr style="border-bottom: 1px solid black;">
                        <td><b> * 비밀번호 </b></td>
                        <td colspan="2"><input type="password" id="memberPwd"  name="memberPwd" class="userpw" required maxlength="15"></td>
                        <td colspan="2"><span  id="pwd" style="color:#2c7dc9; font-size:14px"></span></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr style="border-bottom: 1px solid black;">
                        <td><b> * 비밀번호확인 </b></td>
                        <td colspan="2"><input type="password" class="userpw-confirm" id="chkPwd"  maxlength="15" required></input><br><font size="2" id="chkPwd"></font> </td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr style="border-bottom: 1px solid black;">
                        <td><b> * 이름 </b></td>
                        <td colspan="2"><input type="text" id="memberName" name="memberName" required></td>
                        <td><br><font size="2" id="nameFont"></font></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr style="border-bottom: 1px solid black;">
                        <td><b> * 성별 </b></td>
                        <td colspan="2">
                            <input type="radio" class="radio_3"  name="gender" value='남' id="man"  required  checked><label for="man">남자</label>
                            <input type="radio" class="radio_3" name="gender" value="여" id="girl" required ><label for="girl">여자</label>
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr style="border-bottom: 1px solid black;">
                        <td><b> * 이메일 </b></td>
                        <td colspan="2"><input type="text" name="email" id="email" required>
                              &nbsp;@ 
                        </td>
                        <td>
                        <input type="text" list="dotCom" id="dotCom" name=write placeholder="직접 입력하기">
                           <datalist style="padding: 14px; width: 250px;" id="dotCom" label="dotCom" value="직접 입력">
                                <option value="naver.com" label="네이버">naver.com</option>
                                <option value="gmail.com" label="지메일" >gmail.com</option>
                                <option value="daum.com" label="다음">daum.com</option>
                                <option value="kh.com" label="kh정보">kh.com</option>
                            </datalist>
                        </td>
                        <td><font size="2" id="emailFont"></font></td>
                        <td></td>
                    </tr>
                    <tr style="border-bottom: 1px solid black;">
                        <td><b> * 휴대폰번호 </b></td>
                        <td colspan="2"><input type="text" name="phone" id="phone" placeholder="-를 포함하여입력해주세요" required></td>
                        <td><font size="2" id="phoneFont"></font></td>
                        <td></td>
                        <td></td> 
                    </tr>
                    <tr style="border-bottom: 1px solid black;">
                        <td><b> * 주소 </b></td>
                        <td colspan="2"><input type="text" id="sample2_postcode" name="addressNum" readonly placeholder="우편번호"></td>
                        <td colspan="2"><input type="text" id="sample2_address" name="address" placeholder="주소" size="60" readonly></td>
                        <td></td>
                          <td >
                        <!-- <input type="hidden" id="sample2_jibunAddress" name="jibun" placeholder="지번주소"  size="60"> -->
						<input type="hidden" id="sample2_extraAddress" name="extraAddress" placeholder="참고항목"  size="60">
						<!-- <input type="hidden" id="sample2_engAddress" name="eng" placeholder="영문주소"  size="60" > -->
						<div id="layer" style="display:none;overflow:hidden; position:fixed; z-index:1; -webkit-overflow-scrolling:touch;background : linear-gradient(to bottom right, #00e677, #0298f4);">
						<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer; position:absolute; right : -3px; top : -3px; z-index : 1;" onclick='closeDaumPostcode();' alt="닫기 버튼">
						</div>
                          </td> 
                    </tr>
                    <tr style="border-bottom: 1px solid black;">
                    	<td>
                    	
                    		
                    		<input type="button" style="border-radius:30px; box-shadow: 10px 5px 3px 2px yellowgreen; width:250px;" class="btn btn-outline-success" onclick="sample2_execDaumPostcode()" value="우편번호 찾기" id="addressBtn">
                    		
                    		
                    	</td>
                    	<td colspan="3"><input type="text" id="sample2_detailAddress" name="detailAddress" placeholder="상세주소"  size="60"></td>
                    	<td><span id="guide" style="color:#999;display:none"></span></td>
                    </tr>
                    <tr class="birth">
                        <td><b> * 생년월일 </b></td>
                        <td style="padding-left: 0px;"><input type="number" required placeholder="년(4자)" style="width:150px;" name="birthYear" id="birthYear"></td>
                        <td style="padding-top:14px;">   <select class="form-select form-select-lg mb-3" id="birthMonth" name="birthMonth" >
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
                        </select></td>
                        <td><input type="number" required placeholder="일" style="width:150px;" id="birthDay" name="birthDay" min="1"  max="31"></td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
    	</main>
	</form>
<!-- 	<input type="text" id="sample2_postcode" placeholder="우편번호">
<input type="button" onclick="sample2_execDaumPostcode()" value="우편번호 찾기"><br>
<input type="text" id="sample2_address" placeholder="주소"><br>
<input type="text" id="sample2_detailAddress" placeholder="상세주소">
<input type="text" id="sample2_extraAddress" placeholder="참고항목"> -->


</div>
<script>

$(document).ready(function(){

	$(".outer")
	   	.css('opacity',0)
		.slideDown(3000 , 'swing')
		.animate(
		{ opacity : 1 }
		,{ queue : false , duration : 3000}
		,'easeOut');
	
	
	});
		
	/* if($(".outer").css("display")=="none"){
		  $(".outer").slideToggle({duration: 'slow' , queue : false});
		  $(".outer").fadeToggle({duration : 'slow' , queue : false});
	  }
		 */


function selectAll(selectAll)  {
	  const checkboxes 
	       = document.getElementsByName('agree');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked;
	  })
	}

	$(function(){
		$("#allchk").on("checked",function(){
			$(".radioY").css("checked")
		});
		
	});
function idCheck(){
	//아이디에 입력한 값을 데이터베이스에 저장된 아이디와 비교하여 중복인지 판별하기
	let memberId = $(".input_id").val();
	//console.log(memberId);
//	console.log(memberId.value);
	//응답데이터를 NNNNN : 사용할 수 없음 / NNNNY : 사용 가능 
	//중복체크 후 사용가능할때는 회원가입버튼 활성화 시켜주기 
	// 클라이언트 측 코드
	$.ajax({
	    url: "idCheck.me",
	    type: "post",
	    data: { memberId : memberId }, // 입력한 아이디 값을 전송
	    dataType: "json", // 서버로부터 텍스트 형식의 데이터를 받음
	    success: function(result) {
	        if (result == 0) { // 중복된 아이디인 경우
	            $("#chkId").html('중복되는 아이디입니다');
	        	$("#chkId").attr('color','red');
	        	$("#memberId").focus();
	        } else{
				        // 중복되지 않은 아이디인 경우
	            $("#chkId").html("사용가능한 멋진 아이디입니다!");
				$("#chkId").attr('color','blue');
				$("#memberId").attr("readonly",true);
				$("#memberId").attr("color","green")//아이디 변경불가시키기
				$("#enrollbtn").removeAttr("disabled");
				$(".btn").attr("border","3px solid green");
				/* $("#enrollbtn").on("mouseenter":function(){
					$(this).css("color","green").css("outline","green")
				}) */
				/* $("#enrollbtn").attr("outline","5px solid green")
				$("#enrollbtn").attr("outline","5px solid green")
				$("#enrollbtn").attr("outline","5px solid green")
				$("#enrollbtn").attr("outline","5px solid green") */
	        }
	    },
	    error: function() {
	        alert("AJAX 요청 실패: "); // AJAX 요청 실패 시 에러 로그 출력
	    }
	});
}
</script>
<script>



window.onload = function() {
	
	//1)아이디 검사
    //첫글자는 반드시 영문자로, 그리고 영문자,숫자를 포함하여 총4~12자로 입력하시오.
    var regExpId = /^[a-zA-Z][a-zA-Z0-9]{3,11}$/;
    var inputId = document.getElementById("memberId");
    var chkId = document.getElementById("chkId");


    inputId.addEventListener("keyup", function() {
        if (!regExpId.test(inputId.value)) { // If the value is not valid
            chkId.innerHTML = '사용할 수 없는 아이디입니다.';
            chkId.style.color = 'red';
            inputId.focus();
        } else {
            chkId.innerHTML = '멋진 아이디입니다! 중복확인을 꼭 해주세요.';
            chkId.style.color = 'blue';
        }
       
    });

    
	//regExp = /^[A-Za-z0-9_\-]{5,15}$/;
   var regExpPwd = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,15}$/;
   var inputPwd = document.getElementById("memberPwd");
    //2)비밀번호 검사
    //영문자,숫자,특수문자(!@#$%^&*)로 총 8~15자로 입력하시오.
   
     var pwdElement = document.getElementById("pwd"); 
    var inputCp = document.getElementById("chkPwd");
    
    inputPwd.addEventListener("keyup",function(){
    	 if(!regExpPwd.test(inputPwd.value)){
    	       pwdElement.innerHTML = '영문자,숫자,특수문자(!@#$%^&*)포함 총 8~15자로 입력해주세요.';
    	       pwdElement.style.color = 'red';
    	       
             inputPwd.style.background = 'url(resources/사용불가자물쇠.png) no-repeat center right 15px';
  	         inputPwd.style.backgroundSize = '80px';
    	     inputPwd.style.backgroundColor = '#fff';
    	        /* return false; */
    	    }else{
    	    	pwdElement.innerHTML = '사용가능한 비밀번호 입니다.';
    	    	pwdElement.style.color = 'blue';
    	    	
    	    	inputPwd.style.background = 'url(resources/사용가능자물쇠.png) no-repeat center right 15px';
     	        inputPwd.style.backgroundSize = '80px';
       	     	inputPwd.style.backgroundColor = '#fff';
    	    	
    	    }
 
    });
	

    //3)비밀번호와 비밀번호 확인 일치여부 
    inputCp.addEventListener("keyup",function(){
    if(inputPwd.value != inputCp.value){
        $("#chkPwd").html('비밀번호와 비밀번호 확인이 일치하지 않습니다.');
        $("#chkPwd").attr('color','red');
         inputCp.style.background = 'url(resources/사용불가자물쇠.png) no-repeat center right 15px';
	     inputCp.style.backgroundSize = '80px';
	     inputCp.style.backgroundColor = '#fff';
        inputCp.focus();
    	
    }else{
    	$("#chkPwd").html('<b>사용 가능 합니다<b>');
    	$("#chkPwd").attr('color','blue');
    	inputCp.style.background = 'url(resources/사용가능자물쇠.png) no-repeat center right 15px';
	    inputCp.style.backgroundSize = '80px';
	    inputCp.style.backgroundColor = '#fff';
    }
});
    
   
    
   
    
    
    

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
    })
    
    var inputEmail = document.getElementById("email");
	var regExpEmail = /^[a-zA-Z0-9._%+-]{2,}$/;
	var emailFont = document.getElementById("emailFont");

inputEmail.addEventListener("keyup", function() {
    if (!regExpEmail.test(inputEmail.value)) {
        emailFont.innerHTML = "유효하지않은 이메일 형식입니다.";
        emailFont.style.color = 'red';
        inputEmail.focus();
    } else {
        emailFont.innerHTML = "이용 가능한 이메일형식입니다.";
        emailFont.style.color = 'blue';
    }
    
   
    
});


    
    
};

    

</script>


<!-- 우편번호 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
var themeObj = {
		   bgColor: "#B3D6F5", //바탕 배경색
		   searchBgColor: "#0A65C8", //검색창 배경색
		   contentBgColor: "#C1F5FA", //본문 배경색(검색결과,결과없음,첫화면,검색서제스트)
		   pageBgColor: "#708390" //페이지 배경색
		   //textColor: "", //기본 글자색
		   //queryTextColor: "", //검색창 글자색
		   //postcodeTextColor: "", //우편번호 글자색
		   //emphTextColor: "", //강조 글자색
		   //outlineColor: "", //테두리
		};
    // 우편번호 찾기 찾기 화면을 넣을 element
    var element_layer = document.getElementById('layer');

    function closeDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_layer.style.display = 'none';
    }
    function sample2_execDaumPostcode() {
        // 현재 scroll 위치를 저장해놓는다.
        new daum.Postcode({
        	theme : themeObj
            ,oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample2_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample2_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample2_postcode').value = data.zonecode;
                document.getElementById("sample2_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample2_detailAddress").focus();

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_layer.style.display = 'none';

                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                /* document.body.scrollTop = currentScroll; */
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            /* onresize : function(size) {
                element_wrap.style.height = size.height+'500px';
            }, */
            width : '100%',
            height : '100%',
            maxSuggesItems : 5
        }).embed(element_layer);

        // iframe을 넣은 element를 보이게 한다.
        element_layer.style.display = 'block';
        
        //iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다
        initLayerPosition();
    }
    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
    function initLayerPosition(){
        var width = 400; //우편번호서비스가 들어갈 element의 width
        var height = 500; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 5; //샘플에서 사용하는 border의 두께

        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }
</script>



<%@ include file = "../common/footer.jsp" %>

</body>
</html>