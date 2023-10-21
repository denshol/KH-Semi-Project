package com.semi.coupon.controller.admin;

import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.semi.coupon.model.service.CouponService;
import com.semi.coupon.model.vo.Coupon;

/**
 * Servlet implementation class CouponUpdateAdminController
 */
@WebServlet("/updateCoupon.admin")
public class CouponUpdateAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CouponUpdateAdminController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int ucno = Integer.parseInt(request.getParameter("ucno"));
		
		Coupon cp = new CouponService().detailCouponAdmin(ucno);
		
		response.setContentType("json/application; charset=UTF-8");
		
		Gson gson = new Gson();
		gson.toJson(cp,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		
		int couponNo = Integer.parseInt(request.getParameter("couponNo"));
		
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		String couponName = request.getParameter("couponName");
		double discount = Double.parseDouble(request.getParameter("discount"));
		String period = request.getParameter("period");
		String sdate = request.getParameter("sdate");
		String status = request.getParameter("status");
		
		Coupon cp = new Coupon(couponNo,memberNo,couponName,discount,period,sdate,status);
		
		int result = new CouponService().updateCouponAdmin(cp);
		
		if(result>0) {
			request.getSession().setAttribute("alertMsg", "쿠폰 정보가 수정처리되었습니다");
			response.sendRedirect(request.getContextPath()+"/coupon.admin");
		}else {
			request.getSession().setAttribute("alertMsg", "회원정보 수정에 실패하였네요.");
			response.sendRedirect(request.getContextPath()+"/coupon.admin");
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
