package com.semi.coupon.controller.admin;

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
 * Servlet implementation class CouponInsertAdminController
 */
@WebServlet("/insertCoupon.admin")
public class CouponInsertAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CouponInsertAdminController() {
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
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10 * 1024 * 1024;
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/adminNotice_files/");
			
			MultipartRequest multiRequest = new MultipartRequest(request,savePath,maxSize,"UTF-8",new MyFileRenamePolicy());
			
			Board b = new Board();
			
			int memberNo = Integer.parseInt(multiRequest.getParameter("memberNo"));
			b.setBoardTitle(multiRequest.getParameter("titleNotice"));
			b.setBoardContent(multiRequest.getParameter("contentNotice"));
			
			ArrayList<Attachment> list = new ArrayList<>();
			
			for(int i=0; i<4; i++) {
				String key = "noticeImg"+(i+1);
				
				if(multiRequest.getOriginalFileName(key) != null) {
					
					Attachment at = new Attachment();
					
					at.setAttachmentName(multiRequest.getOriginalFileName(key));
					at.setAttachmentChange(multiRequest.getFilesystemName(key));
					at.setAttachmentPath("/resources/adminNotice_files/");
					
					if(i==1) {
						at.setFileLivel(1);
					}else {
						at.setFileLivel(2);
					}
					
					list.add(at);
				}
			}
			
			int result = new BoardService().insertNotice(b,list,memberNo);
			
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "공지사항 등록 완료");
				response.sendRedirect(request.getContextPath()+"/notice.admin");
			}else {
				request.setAttribute("errorMsg", "공지사항 등록 실패");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
			
		}
		
	}

}
