package com.semi.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.semi.board.model.service.BoardService;
import com.semi.board.model.vo.Board;
import com.semi.product.model.vo.Attachment;

/**
 * Servlet implementation class NoticeDetailAdminController
 */
@WebServlet("/detailNotice.admin")
public class NoticeDetailAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDetailAdminController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int bno = Integer.parseInt(request.getParameter("bno"));

		Board b = new BoardService().detailBoardAdmin(bno);
		
		response.setContentType("json/application; charset=UTF-8");
		Gson gson = new Gson();
		gson.toJson(b,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int bno = Integer.parseInt(request.getParameter("bno"));

		ArrayList<Attachment> list = new BoardService().detailAttachmentAdmin(bno);
		
		response.setContentType("json/application; charset=UTF-8");
		Gson gson = new Gson();
		gson.toJson(list,response.getWriter());
	}

}
