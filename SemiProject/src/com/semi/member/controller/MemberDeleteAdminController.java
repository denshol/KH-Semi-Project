package com.semi.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.semi.member.model.service.MemberService;

/**
 * Servlet implementation class memberDeleteController
 */
@WebServlet("/delete.admin")
public class MemberDeleteAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberDeleteAdminController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int mno = Integer.parseInt(request.getParameter("memberNo"));
		
		int result = new MemberService().deleteMemberAdmin(mno);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "해당 회원이 삭제되었습니다.");
			response.sendRedirect(request.getContextPath()+"/member.admin?currentPage=1");
		}else {
			request.getSession().setAttribute("alertMsg", "회원 삭제에 실패하였습니다.");
			response.sendRedirect(request.getContextPath()+"/member.admin?currentPage=1");
		}
		
	}

}
