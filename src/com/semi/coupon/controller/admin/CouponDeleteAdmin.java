package com.semi.coupon.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.coupon.model.service.CouponService;

/**
 * Servlet implementation class CouponDeleteAdmin
 */
@WebServlet("/cdelete.admin")
public class CouponDeleteAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CouponDeleteAdmin() {
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
		
		int cno = Integer.parseInt(request.getParameter("couponNo"));
		
		int result = new CouponService().deleteCouponAdmin(cno);
		
		if(result>0) {
			request.getSession().setAttribute("alertMsg", "해당 쿠폰이 삭제되었습니다");
			response.sendRedirect(request.getContextPath()+"/coupon.admin");
		}else {
			request.getSession().setAttribute("alertMsg", "쿠폰 삭제에 실패하였습니다.");
			response.sendRedirect(request.getContentType()+"/coupon.admin");
		}
		
	}

}
