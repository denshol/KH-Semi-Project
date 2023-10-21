package com.semi.coupon.controller.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.coupon.model.service.CouponService;
import com.semi.coupon.model.vo.Coupon;

/**
 * Servlet implementation class CouponSearchController
 */
@WebServlet("/searchCoupon.admin")
public class CouponSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CouponSearchController() {
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
		
		
		// 검색항목 밸류값(select)
		 int nuc = Integer.parseInt(request.getParameter("ms_select"));
		
		String search = request.getParameter("couponSearch");
		
		System.out.println(nuc);
		System.out.println(search);
		 
		 
		ArrayList<Coupon> clist = new ArrayList<>();
		
		switch(nuc) {
			//쿠폰 번호로 검색
			case 1 : clist = new CouponService().searchCidAdmin(search);
				break;
			//회원번호로 쿠폰 조회
			case 2 : clist = new CouponService().searchMnoAdmin(search);
				break;
			//쿠폰 명으로 검색
			case 3 : clist = new CouponService().searchCnameAdmin(search);
				break;
			// 할인율로 검색
			case 4 : clist = new CouponService().searchDcAdmin(search);
				break;
			// 유효기간으로 검색
			case 5 : clist = new CouponService().searchPeriodAdmin(search);
				break;
			// 등록일로 검색
			case 6 : clist = new CouponService().searchEnrollAdmin(search);
				break;
			// 상태값으로 검색
			case 7 : clist = new CouponService().searchStAdmin(search);
				break;
				
		}
		
		System.out.println(clist);
		
		if(clist.isEmpty()) {
			request.getSession().setAttribute("alertMsg", "다시 입력해주세요");
			response.sendRedirect(request.getContextPath()+"/coupon.admin");
		}else {
			request.setAttribute("clist", clist);
			request.getRequestDispatcher("/coupon.admin").forward(request, response);
		}
		 
	}

}
