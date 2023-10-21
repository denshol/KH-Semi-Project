package com.semi.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.semi.board.model.service.BoardService;
import com.semi.board.model.vo.Board;
import com.semi.common.MyFileRenamePolicy;
import com.semi.product.model.vo.Attachment;

/**
 * Servlet implementation class NoticeUpdateAdminController
 */
@WebServlet("/noticeUpdate.admin")
public class NoticeUpdateAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdateAdminController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int bno = Integer.parseInt(request.getParameter("boardNo"));
		
		Board b = new BoardService().updateNotice(bno);
		
		//첨부파일도 가져오기
		ArrayList<Attachment> list = new BoardService().updateAttachment(bno);
		
		request.setAttribute("Board", b);
		request.setAttribute("alist", list);
		request.getRequestDispatcher("views/admin_board/noticeUpdate.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10 * 1024 * 1024;
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/adminNotice_files");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			int memberNo = Integer.parseInt(multiRequest.getParameter("memberNo"));
			int boardNo = Integer.parseInt(multiRequest.getParameter("boardNo"));
			String titleNotice = multiRequest.getParameter("titleNotice");
			String contentNotice = multiRequest.getParameter("contentNotice");
			
			Board b = new Board();
			b.setBoardNo(boardNo);
			b.setBoardTitle(titleNotice);
			b.setBoardContent(contentNotice);
			
			ArrayList<Attachment> list = new ArrayList<>();
			
			Attachment at = null;
			
			for(int i=0; i<4; i++) {
				
				if(multiRequest.getOriginalFileName("noticeImg"+i) != null) {
					
					at = new Attachment();
					
					at.setAttachmentName(multiRequest.getOriginalFileName("noticeImg"+i));
					at.setAttachmentChange(multiRequest.getFilesystemName("noticeImg"+i));
					at.setAttachmentPath("/resources/adminNotice_files/");
					
					if(multiRequest.getParameter("fileNo"+i) != null) {
						at.setAttachmentId(Integer.parseInt(multiRequest.getParameter("fileNo"+i)));
						
						new File(savePath+"/"+multiRequest.getParameter("originFileName"+i)).delete();
					}else {
						at.setBoardNo(boardNo);
					}
					list.add(at);
				}
			}
			
			int result = new BoardService().updateNoticeAdmin(b,list);
			
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "공지사항 수정 완료");
				request.getSession().setAttribute("bno", boardNo);
				response.sendRedirect(request.getContextPath()+"/notice.admin");
			}else {
				request.setAttribute("errorMsg", "게시글 수정 실패");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
		}
		
	}

}
