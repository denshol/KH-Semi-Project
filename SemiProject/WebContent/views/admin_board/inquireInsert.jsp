<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.semi.board.model.vo.Board"%>
<%
	Board b = (Board)request.getAttribute("board");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="resources/adminPage_files/cssFolder/admin_inquireInsert.css">
</head>
<body>
    <div class="wrap">

        <%@include file="/views/common/admin_Category.jsp" %>
        
        <form action="<%=contextPath%>/inquireAnswer.admin" method="post">
        <input type="hidden" name="bno" value="<%=b.getBoardNo()%>">
        <div class="noticeContent">
            <div class="header">
                <div>
                    <div id="notice_head_img">
                        <img src="resources/adminPage_files/iconFolder/insert_notice_icon.png">
                    </div>
                    <div id="notice_head_hd">
                      	 1:1 문의사항 답변
                    </div>
                </div>
            </div>
            <div class="body">
                <div>
	                <div id="notice_head_title">
	               		문의사항 제목
	                </div>
                    <div id="body_head">
                        <div>
                            <div id="notice_head_input">
                                <input type="text" name="titleNotice" id="titleNotice" placeholder="문의사항 제목 들어갈 공간" value="<%=b.getBoardTitle() %>" readonly>
                            </div>
                        </div>
                    </div>
                    <br>
                    <div>
                       <p>문의사항 내용</p>
                       <br>
                       <textarea name="contentNotice" id="contentNotice" cols="30" rows="15" style="resize: none;" placeholder="문의사항 내용 들어갈 공간" readonly><%=b.getBoardContent() %></textarea>
                       <p id="panwser">문의 답변</p>
                    	<textarea name="contentAnswer" id="contentNotice2" rows="30" cols="15" style="resize: none;" placeholder="문의 답변 내용 들어갈 공간"><%=b.getBoardAnswered() %></textarea>
                    </div>
                    <br>
                    <div>
                    	
                    </div>
                </div>
            </div>
            <div class="footer">
                <input type="submit" id="inButton" value="답변 등록">
                <input type="submit" id="upButton" value="답변 수정">
                <button type="button" onclick="history.back()">취소</button>
            </div>
        </div>
    </form>
    </div>
    
    <script>
    
    	$(function(){
    		if('<%=b.getBoardAnswered()%>' == 'null'){
    			$("#contentNotice2").val("");
    		}
    		
    		if($("#contentNotice2").val() != ""){
    			$("#upButton").show();
    		}else{
    			$("#inButton").show();
    		}
    	});
    </script>
</body>
</html>