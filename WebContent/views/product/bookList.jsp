<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,com.semi.product.model.vo.Product,com.semi.common.vo.PageInfo"%>
<%
	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <style>
        div{
            /* border: 1px solid black; */
            box-sizing: border-box;
        }
        /*-----------------콘텐츠------------------------*/
        #content{
            /* background-color: antiquewhite; */
            width: 1400px;
            margin: auto;
            /*display: flex; /*이미지 중앙 정렬*/
            /*position: relative; /*출석판 위 출석하기 정렬 1단계*/
        }
        #con_1{
            width: 1400px;
            height: 150px;
            /* background-color: aqua; */
        }
        #con_1 p{
            margin: 0px;
            padding: 0px;
        }
        #con_title{
            width: 1150px;
            height: 65%;
            /* background-color: blue; */
            font-size: 30px;
            font-weight: 600;
            position: relative;
            left: 118px;
            top: 15px;
            line-height: 125px;
            color: rgb(14, 10, 41);
            cursor: default;
        }
        #con_subtitle{
            width: 1150px;
            height: 35%;
            /* background-color: blueviolet; */
            font-size: 16px;
            position: relative;
            left: 118px;
            top: 5px;
            color: rgb(148, 146, 146);
            cursor: default;
        }
        /*카테고리 메뉴------------------------*/
        #con_menu{
            /* background-color: aqua; */
            width: 1200px;
            height: 57px;
            margin: auto;
        }
        #con_menu_2,#con_menu_3{
            display: block;
            float: left;
            width: 145px;
            height: 50px;
            text-decoration: none;
            text-align: center;
            font-size: 16px;
            font-weight: 550;
            color: rgb(190, 187, 187);
            line-height: 50px;
            border: 1px solid rgb(221, 219, 219);
            border-bottom: 0px;
            border-top-left-radius: 12px;
            border-top-right-radius: 12px;
        }
        #con_menu_1{
            display: block;
            float: left;
            width: 145px;
            height: 50px;
            text-decoration: none;
            text-align: center;
            font-size: 16px;
            font-weight: 550;
            color: rgb(44, 43, 43);
            line-height: 50px;
            border: 1px solid rgb(44, 43, 43);
            border-bottom-style: none; /*검색 우 선*/
            border-top-left-radius: 12px;
            border-top-right-radius: 12px;
        }
        #con_menu a:hover{
            border: 1px solid rgb(44, 43, 43);
            border-bottom-style: none;
            color: rgb(44, 43, 43);
        }
        /*리스트 메뉴바------------------------------------------*/
        #list_menu{
            width: 1205px;
            height: 55px;
            /* background-color: antiquewhite; */
            margin: auto;
            border: 1px solid rgb(221, 219, 219);
            border-left: none;
            border-right: none;
            border-bottom: none;
        }
        #list_menu>*{
            float: left;
        }
        #list_menu_1{
            /* background-color: aqua; */
            height: 80%;
            width: 30%;
        }
        #list_num{
            /* background-color: blue; */
            height: 100%;
            width: 40%;
        }
        #list_menu_3{
            /* background-color: aqua; */
            height: 100%;
            width: 30%;
        }
        /*카테고리*/
        #list_menu_1{
            position: relative;
            top: 12px;
            left: 10px;
            font-size: 15px;
        }
        #list_menu_1>button{
            background-color: white;
            border: 1px solid rgb(230, 227, 227);
            height: 30px;
            width: 50px;
            border-radius: 5px;
        }
        #list_menu_1>button:hover{
            background-color: rgb(246, 243, 243);
        }
        /*페이지*/

        /*전체선택, 장바구니*/
        #list_menu_3>input{
            border: 1px solid rgb(202, 195, 195);
        }
        #list_menu_3{
            position: relative;
            left: 173px;
            line-height: 53px;
            font-size: 15px;
        }
        #list_menu_3>button{
            background-color: white;
            border: 1px solid rgb(202, 195, 195);
            width: 100px;
            height: 45px;
            border-radius: 10px;
        }
        #list_menu_3>button:hover{
            background-color: rgb(246, 243, 243);
        }
        /*도서 목록-----------------------------------------*/
        #book{
            /* background-color: aqua; */
            width: 1205px;
            height: 300px;
            margin: auto;
            border: 1px solid rgb(221, 219, 219);
            border-left: none;
            border-right: none;
        }
        #book>div{
            height: 100%;
            float: left;
        }
        #book_1{
            width: 5%;
            /* background-color: blue; */
        }
        #book_2{
            width: 80%;
            /* background-color: blueviolet; */
        }
        #book_3{
            width: 15%;
            /* background-color: brown; */
        }

        #book_2>img{
            width:165px;
            height:210px;
            position: relative;
            top: 40px;
        }

        #book_3>button{
            /* display:inline-block; */
            position: relative;
            top: 90px;
            left: 40px;
            margin: 3px;
            height: 50px;
            width: 100px;
            border-radius: 10px;
            border: 1px solid rgb(148, 146, 146);
            background-color: none;
        }
        /*체크박스-----------------------------------------------------------*/
        #check{
            width: 30px;
            height: 18px;
            /* background-color: aqua; */
            position: relative;
            left: 10px;
            top: 27px;
        }
        /*썸네일----------------------------*/
        #imgthumb{
            position: relative;
            left: -8px;
        }

        #page{
            /* background-color: aqua; */
            width: 1200px;
            height: 50px;
            margin: auto;
            text-align: center;
        }
        </style>
</head>
<body>
	<%@include file = "../common/header.jsp" %>
	
        <div id="content">
         <div id="con_1">
            <p id="con_title">도서 전체 목록</p>
            <p id="con_subtitle">파란 서점에서 판매되는 전체 도서 목록입니다.</p>
         </div>
         <div id="con_menu">
            <a href="<%=contextPath %>/book.list?currentPage=1" id="con_menu_1">전체 도서</a>
            <a href="" id="con_menu_2">베스트 셀러</a>
            <a href="" id="con_menu_3">신간 도서</a> <!--비동기통신 예정-->
         </div>
         <div id="list_menu">
            <div id="list_menu_1">도서 카테고리 : 
                <select name="" id="">
                    <option value="소설">소설</option>
                    <option value="에세이">에세이</option>
                    <option value="자기계발">자기계발</option>
                    <option value="경제/경영">경제/경영</option>
                    <option value="인문학">인문학</option>
                    <option value="정치/사회">정치/사회</option>
                </select>
                <button>검색</button>
            </div>
            <div id="list_num"><!-- 페이징 처리 -->
            	<!-- 왼쪽 가기 버튼 -->
                <%if(pi.getCurrentPage()!=1) {%>
                	<button onclick="location.href='<%=contextPath %>/book.list?currentPage=<%=pi.getCurrentPage()-1 %>'">&lt;</button>
                <%} %>
                
                <%for(int i=pi.getStartPage(); i<=pi.getEndPage(); i++) {%>
                	<%if(i!=pi.getCurrentPage()) {%>
                		<button onclick="location.href='<%=contextPath%>/book.list?currentPage=<%=i%>';"><%=i %></button>
                	<%}else {%>
                		<button disabled><%=i %></button>
                	<%} %>
                <%} %>
                <!-- 오른쪽으로 가는 버튼 -->
                <%if(pi.getCurrentPage()!=pi.getMaxPage()) {%>
                	<button onclick="location.href='<%=contextPath%>/book.list?currentPage=<%=pi.getCurrentPage()+1%>'">&gt;</button>
                <%} %>
            </div>
            <div id="list_menu_3">
                <input type="checkbox" id="checkbox" name="cart" onclick="selectAll(this)" >전체선택
                <button>장바구니</button>
            </div>
         </div>
               
                
                
            	<%if(list.isEmpty()) {%>
            		<tr>
            			<td>도서 목록이 존재하지 않습니다.</td>
            		</tr>
            	<%} else {%>
            	
            	<%for(Product p : list) {%>
            	
         <div id="book">
            <div id="book_1">
                <label for="check"></label>
                <input type="checkbox" id="check" name="cart" value="상품번호출력">
            </div>
            <div id="book_2">
           
                <table >
                    <tr>
                        <td rowspan="4" style="width: 150px; height: 250px;"><img src="<%=contextPath + p.getTitleImg() %>" alt="" width="135px" height="200px" id="imgthumb"></td>
                        <td style="font-size: 16px; font-weight: 600; position: relative; top: 45px;"><%=p.getProductName() %></td>
                    </tr>
                    <tr>
                        <td style="font-size: 12px; font-weight: 300; position: relative; top: 25px;"><%=p.getAuthor() %> ⊙ <%=p.getProductPublisher() %> ⊙ <%=p.getCreateDate() %></td>
                    </tr>
                    <tr>
                        <td style="position: relative; top: 25px; font-size: 12px; font-weight: 600;"><%=p.getProductPrice() %></td>
                    </tr>
                    <tr>
                        <td>
                            <p style="position: relative; top: -10px; font-size: 12px; font-weight: 300;">
                            <%if(p.getProductText().length()>=250) {%><!-- 텍스트 글자 250 이상 -->
	                            <%=p.getProductText().substring(0,250)%></p>
                            <%}else {%><!-- 텍스트 글자 250이하 -->
                            	<%=p.getProductText() %>
                            <%} %>
                        </td>
                    </tr>
                </table>
            </div>
            <div id="book_3">
                <button>장바구니</button>
                <button>바로구매</button>
            </div>
        </div>
                <%} %>
				<%} %>
         <div id="page">
             <!-- 왼쪽 가기 버튼 -->
                <%if(pi.getCurrentPage()!=1) {%>
                	<button onclick="location.href='<%=contextPath %>/book.list?currentPage=<%=pi.getCurrentPage()-1 %>'">&lt;</button>
                <%} %>
                
                <%for(int i=pi.getStartPage(); i<=pi.getEndPage(); i++) {%>
                	<%if(i!=pi.getCurrentPage()) {%>
                		<button onclick="location.href='<%=contextPath%>/book.list?currentPage=<%=i%>';"><%=i %></button>
                	<%}else {%>
                		<button disabled><%=i %></button>
                	<%} %>
                <%} %>
                <!-- 오른쪽으로 가는 버튼 -->
                <%if(pi.getCurrentPage()!=pi.getMaxPage()) {%>
                	<button onclick="location.href='<%=contextPath%>/book.list?currentPage=<%=pi.getCurrentPage()+1%>'">&gt;</button>
                <%} %>
         </div>
        </div>
        
        <script>
            function selectAll(selectAll){
                var checkboxes = document.getElementsByName('cart');
                /*console.log(checkboxes)*/

                checkboxes.forEach((checkboxes)=>checkboxes.checked=selectAll.checked);
            }
        </script>
        
       	<%@include file = "../common/footer.jsp" %>
</body>
</html>