package com.semi.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.board.model.service.BoardService;

/**
 * Servlet implementation class FaqInsertAdminController
 */
@WebServlet("/faqInsert.admin")
public class FaqInsertAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaqInsertAdminController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("views/admin_board/faqInsert.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		int mno = Integer.parseInt(request.getParameter("mno"));
		String faqtitle = request.getParameter("faqTitle");
		String faqcontent = request.getParameter("faqContent");
		
		int result = new BoardService().insertFaqAdmin(mno,faqtitle,faqcontent);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "FAQ등록 완료");
			response.sendRedirect(request.getContextPath()+"/faq.admin");
		}else {
			request.setAttribute("errorMsg", "FAQ등록 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
	}

}
