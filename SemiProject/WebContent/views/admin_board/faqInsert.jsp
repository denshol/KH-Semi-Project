<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.semi.member.model.vo.Member"%>
<%
	Member m = (Member)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="resources/adminPage_files/cssFolder/admin_insertFAQ.css">
</head>
<body>
    <div class="wrap">

        <%@include file="/views/common/admin_Category.jsp" %>
        
        <form action="<%=contextPath%>/faqInsert.admin" method="post">
        <input type="hidden" name="mno" value="<%=m.getMemberNo()%>">
        <div class="noticeContent">
            <div class="header">
                <div>
                    <div id="notice_head_img">
                        <img src="resources/adminPage_files/iconFolder/insert_notice_icon.png">
                    </div>
                    <div id="notice_head_hd">
                      	 FAQ 등록
                    </div>
                </div>
            </div>
            <div class="body">
                <div>
                    <div id="body_head">
                        FAQ 제목
                        <div id="head_faq">
                            <div id="notice_head_title">
                            </div>
                            <div id="notice_head_input">
                                <input type="text" name="faqTitle" id="titleNotice" placeholder="FAQ 제목 들어갈 공간" required>
                            </div>
                        </div>
                    </div>
                    <br>
                    <div id="body_faq">
                       <p>FAQ 내용</p>
                       <br>
                       <textarea name="faqContent" id="contentNotice" cols="30" rows="30" style="resize: none;" placeholder="FAQ 내용 들어갈 공간" required></textarea>
                    </div>
                </div>
            </div>
            <div class="footer">
                <input type="submit" value="등록하기">
                <button type="button" onclick="history.back()">취소</button>
            </div>
        </div>
    </form>
    
    </div>
</body>
</html>