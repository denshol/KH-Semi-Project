package com.semi.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.board.model.service.BoardService;
import com.semi.board.model.vo.Board;

/**
 * Servlet implementation class InquireAnswerAdminController
 */
@WebServlet("/inquireAnswer.admin")
public class InquireAnswerAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquireAnswerAdminController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		//해당 번호로 해당 번호게시물의 내용들 추출
		
		Board b = new BoardService().inquireDetailAdmin(bno);
		
		request.setAttribute("board", b);
		
		request.getRequestDispatcher("views/admin_board/inquireInsert.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		//해당 게시글의 답변내용
		String answer = request.getParameter("contentAnswer");
		
		//해당 게시글 번호
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		int result = new BoardService().inquireAnswer(bno,answer);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "문의 답변 완료");
			response.sendRedirect(request.getContextPath()+"/inquire.admin");
		}else {
			request.setAttribute("errorMsg", "문의 답변 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
		
	}

}
