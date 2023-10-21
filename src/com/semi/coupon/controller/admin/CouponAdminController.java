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
 * Servlet implementation class couponController
 */
@WebServlet("/coupon.admin")
public class CouponAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CouponAdminController() {
        super();
        // TODO Auto-generated constructor stub
    }

protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getAttribute("clist") == null) {
			ArrayList<Coupon> clist = new CouponService().selectCouponAdmin();
			request.setAttribute("clist", clist);
		}else { // 검색할 시
			request.getAttribute("clist");
			System.out.println("검색으로 뽑아온 clist"+request.getAttribute("clist"));
		}
		request.getRequestDispatcher("views/admin_event/adminCoupon.jsp").forward(request, response);
		}
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
