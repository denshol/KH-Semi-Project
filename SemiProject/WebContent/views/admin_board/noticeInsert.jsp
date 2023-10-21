<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.semi.member.model.vo.Member"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="resources/adminPage_files/cssFolder/admin_insertNotice.css">
</head>
<body>
    <div class="wrap">

        <%@include file="/views/common/admin_Category.jsp" %>
        
        <form action="<%=contextPath%>/insertNotice.admin" method="post" enctype="multipart/form-data">
        <input type="hidden" name="memberNo" value="<%=loginUser.getMemberNo()%>"> <!-- 회원번호 -->
        <div class="noticeContent">
            <div class="header">
                <div>
                    <div id="notice_head_img">
                        <img src="resources/adminPage_files/iconFolder/insert_notice_icon.png">
                    </div>
                    <div id="notice_head_hd">
                      	 공지사항 등록
                    </div>
                </div>
            </div>
            <div class="body">
                <div>
                    <div id="body_head">
                        <div>
                            <div id="notice_head_title">
                          		공지사항 제목 : 
                            </div>
                            <div id="notice_head_input">
                                <input type="text" name="titleNotice" id="titleNotice" placeholder="공지사항 제목 들어갈 공간" required>
                            </div>
                        </div>
                    </div>
                    <br>
                    <div>
                       <p>공지사항 내용</p>
                       <br>
                       <textarea name="contentNotice" id="contentNotice" cols="30" rows="30" style="resize: none;" placeholder="공지사항 내용 들어갈 공간" required></textarea>
                    </div>
                    <br>
                    <div id="body_foot">
                        <div id="body_foot_div1">
                            <img id="body_foot_img1">
                        </div>
                        <div id="body_foot_div2">
                            <img id="body_foot_img2">
                        </div>
                        <div id="body_foot_div3">
                            <img id="body_foot_img3">
                        </div>
                        <div id="body_foot_div4">
                            <img id="body_foot_img4">
                        </div>
                        <!-- 파일 첨부 버튼 -->
                        <input type="file" name="noticeImg1" id="noticeImg1" onchange="loadImg(this,1);">
                        <input type="file" name="noticeImg2" id="noticeImg2" onchange="loadImg(this,2);">
                        <input type="file" name="noticeImg3" id="noticeImg3" onchange="loadImg(this,3);">
                        <input type="file" name="noticeImg4" id="noticeImg4" onchange="loadImg(this,4);">
                    </div>
                </div>
            </div>
            <div class="footer">
                <input type="submit" value="등록하기">
                <button type="button" onclick="history.back()">취소</button>
            </div>
        </div>
    </form>

        <!-- ========================= 스크립트 영역 ========================= -->

    <script>

        $(function(){ //미리보기 영역 클릭시 파일첨부버튼 클릭하는 기능

            //해당 사진영역 클릭시 파일첨부
            $("#body_foot_img1").click(function(){
                $("#noticeImg1").click();
            });

            $("#body_foot_img2").click(function(){
                $("#noticeImg2").click();
            });

            $("#body_foot_img3").click(function(){
                $("#noticeImg3").click();
            });

            $("#body_foot_img4").click(function(){
                $("#noticeImg4").click();
            });
        });

        
        function loadImg(inputFile,num){//파일첨부의 값이 변화했을 때

            if(inputFile.files.length == 1){ //첨부파일이 존재한다면

                var reader = new FileReader(); //파일 읽어줄 객체 생성

                reader.readAsDataURL(inputFile.files[0]); //해당 파일의 정보를 읽어준다.(고유 url 부여)

                reader.onload = function(e){
                	console.log(e.target.result);
                    switch(num){ //해당 영역의 src에 첨부한파일의 고유한 url을 넣어준다.
                        case 1: $("#body_foot_img1").attr("src",e.target.result)
                        	break;
                        case 2: $("#body_foot_img2").attr("src",e.target.result)
                        	break;
                        case 3: $("#body_foot_img3").attr("src",e.target.result)
                        	break;
                        case 4: $("#body_foot_img4").attr("src",e.target.result)
                        	break;
                    }
                }
            }else{ //첨부파일이 존재하지 않다면
            	switch(num){
	            	case 1: $("#body_foot_img1").attr("src",null)
	            		break;
		            case 2: $("#body_foot_img2").attr("src",null)
		            	break;
		            case 3: $("#body_foot_img3").attr("src",null)
		            	break;
		            case 4: $("#body_foot_img4").attr("src",null)
		            	break;
            	}
            }
        };

    </script>

    </div>
</body>
</html>