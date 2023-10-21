package com.semi.member.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.semi.member.model.service.MemberService;
import com.semi.member.model.vo.Member;

/**
 * Servlet implementation class memberUpdateController
 */
@WebServlet("/updateMember.admin")
public class MemberUpdateAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateAdminController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int umno = Integer.parseInt(request.getParameter("umno"));
		
		Member m = new MemberService().detailMemberAdmin(umno);
		
		response.setContentType("json/application; charset=UTF-8");
		
		Gson gson = new Gson();
		gson.toJson(m,response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		//조건에 넣을 회원 번호
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		
		//수정할 데이터 받기
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String userName = request.getParameter("userName");
		String userBirth = request.getParameter("userBirth");
		String gender = request.getParameter("gender");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		
		Member m = new Member(memberNo,userId,userPwd,userName,userBirth,gender,phone,email,address);
		
		int result =  new MemberService().updateMemberAdmin(m);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "회원정보가 수정되었습니다.");
			response.sendRedirect(request.getContextPath()+"/member.admin");
		}else {
			request.getSession().setAttribute("alertMsg", "회원정보 수정에 실패하였습니다.");
			response.sendRedirect(request.getContextPath()+"/member.admin");
		}
	}

}
