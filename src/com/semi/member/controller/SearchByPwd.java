package com.semi.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.JsonArray;
import com.semi.member.model.service.MemberService;
import com.semi.member.model.vo.Member;

/**
 * Servlet implementation class SearchByPwd
 */
@WebServlet("/findpwd.me")
public class SearchByPwd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchByPwd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			String memberId = request.getParameter("memberId");
			String memberName = request.getParameter("memberName");
			String memberBirth = request.getParameter("memberBirth");
			String phone = request.getParameter("phone");
			String memberPwd = "";
			Member srcPwdM = new Member(memberId,memberPwd,memberName,memberBirth,phone);
			System.out.println(srcPwdM);
			
			Member pwdM = new MemberService().searchPwd(srcPwdM);
			
			System.out.println(pwdM);
			System.out.println(pwdM.getMemberPwd());
			
			
			response.setContentType("text/html; charset=UTF-8");
	       		
			response.getWriter().print(pwdM.getMemberPwd());
			
	}

}
