package com.semi.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.board.model.service.BoardService;
import com.semi.common.vo.PageInfo;
import com.semi.member.model.service.MemberService;
import com.semi.member.model.vo.Member;

/**
 * Servlet implementation class memberController
 */
@WebServlet("/member.admin")
public class MemberAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberAdminController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int bar = 0;
		int barNum = 0;
		String barSearch = "";
		
		if(request.getAttribute("list") == null) {
			
			int listCount; //총 게시글 개수
			int currentPage; // 현재 페이지
			int pageLimit; //페이징 바 최대 개수
			int boardLimit; // 한 페이지 게시글 최대 개수
			int maxPage; //마지막 페이지 
			int startPage; //페이징 바의 시작 수
			int endPage; // 페이징바의 마지막 수
			
			listCount = new MemberService().selMemberAdminCount();
			
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			
			pageLimit = 10;
			boardLimit = 10;
			maxPage = (int)Math.ceil((double)listCount/boardLimit);
			
			startPage = (currentPage-1)/pageLimit * pageLimit+1;
			endPage = startPage+pageLimit-1;
			
			if(endPage > maxPage) {
				endPage = maxPage;
			}
			
			PageInfo pi = new PageInfo(listCount,currentPage,pageLimit,boardLimit,maxPage,startPage,endPage);
			ArrayList<Member> list = new MemberService().selectMemberAdmin(pi);
			
			request.setAttribute("pi", pi);
			request.setAttribute("list", list);
			request.setAttribute("bar", bar);
			request.setAttribute("barNum", barNum);
			request.setAttribute("barSearch", barSearch);
			
		}else { // 검색할 시
			bar = 1;
			barNum = (int)request.getAttribute("barNum");
			barSearch = (String)request.getAttribute("barSearch");
			
			PageInfo pi = (PageInfo)request.getAttribute("pi");
			ArrayList<Member> list =  (ArrayList<Member>)request.getAttribute("list");
			request.setAttribute("Pi", pi);
			request.setAttribute("list", list);
			request.setAttribute("bar", bar);
			request.setAttribute("barNum", barNum);
			request.setAttribute("barSearch", barSearch);
		}
		
		request.getRequestDispatcher("views/admin_member/adminMember.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
