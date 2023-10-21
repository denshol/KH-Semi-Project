package com.semi.member.controller.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.member.model.service.MemberService;
import com.semi.member.model.vo.Member;

/**
 * Servlet implementation class memberSearchController
 */
@WebServlet("/searchMember.admin")
public class MemberSearchAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberSearchAdminController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		//select의 value값
		int num = Integer.parseInt(request.getParameter("ms_select"));
		
		//입력한 검색값
		String search = request.getParameter("memberSearch");
		//select의 value값에 따른 반환값을 list에 담아주기
		ArrayList<Member> list = new ArrayList<>();
		
		
		switch(num) {
			//아이디로 검색
			case 1 : list = new MemberService().searchIdAdmin(search);
				break;
			//이름으로 검색
			case 2 : list = (new MemberService().searchNameAdmin(search));
				break;
			//생년월일로 검색
			case 3 : list = (new MemberService().searchBirthAdmin(search));
				break;
			//전화번호로 검색
			case 4 : list = (new MemberService().searchPhoneAdmin(search));
				break; 
			//이메일로 검색
			case 5 : list = (new MemberService().searchEmailAdmin(search));
				break;
			//주소로 검색
			case 6 : list = (new MemberService().searchAddressAdmin(search));
				break;
			//회원등급으로 검색
			case 7 : list = (new MemberService().searchGradeAdmin(search));
				break;
		}
		
		if(list.isEmpty()) {
			request.getSession().setAttribute("alertMsg", "다시 입력해주세요");
			response.sendRedirect(request.getContextPath()+"/member.admin");
			
		}else {
			request.setAttribute("list", list);
			request.getRequestDispatcher("/member.admin").forward(request, response);
		}
	}

}
