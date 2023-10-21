package com.semi.board.inquiry.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.semi.board.inquiry.model.dao.BoardDao;
import com.semi.board.inquiry.model.vo.Board;
import com.semi.common.JDBCTemplate;
import com.semi.product.model.vo.Attachment;

public class BoardService {

	public int insertQna(Board b) {
		
		//qna 작성
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new BoardDao().insertQna(conn,b);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
		
	}
	

	//공지사항 조회
	public ArrayList<Board> selectNoticeList() {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Board> list = new BoardDao().selectNoticeList(conn);
		
		JDBCTemplate.close(conn);
		
		return list;
	}
	
	//공지사항 등록
	public int insertNotice(Board b, ArrayList<Attachment> list, int memberNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		//게시글 작성 성공여부
		int result = new BoardDao().insertNotice(conn,b,memberNo);
		
		//파일첨부 성공여부
		int result2 = new BoardDao().insertAttachment(conn,list);
		
		if(result>0 && result2>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result*result2;
	}
	
	//공시사항 상세조회
	public Board detailBoardAdmin(int bno) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		Board b = new BoardDao().detailBoardAdmin(conn,bno);
		
		JDBCTemplate.close(conn);
		
		return b;
	}

	//공지사항 상세조회 파일
	public ArrayList<Attachment> detailAttachmentAdmin(int bno) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Attachment> list = new BoardDao().detailAttachmentAdmin(conn,bno);
		
		JDBCTemplate.close(conn);
		
		return list;
	}

	public Board updateNotice(int bno) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		Board b = new BoardDao().updateNotice(conn,bno);
		
		JDBCTemplate.close(conn);
		
		return b;
	}

	//공지사항 첨부파일 수정 
	public ArrayList<Attachment> updateAttachment(int bno) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Attachment> list = new BoardDao().updateAttachment(conn,bno);
		
		JDBCTemplate.close(conn);
		
		return list;
	}

	//공지사항 수정
	public int updateNoticeAdmin(Board b, ArrayList<Attachment> list) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new BoardDao().updateNoticeAdmin(conn,b);
		int result2 = 1;
		if(!(list.isEmpty())) {
			for(Attachment at : list) {
				if(at.getAttachmentId() != 0) {
					result2 = new BoardDao().updateAttachmentAdmin(conn,list);
				}else {
					result2 = new BoardDao().newAtAdmin(conn,list);
				}
			}
		}
		
		if(result > 0 && result2 > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result*result2;
	}

	//공지사항 삭제
	public int deleteNoticeAdmin(int bno) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new BoardDao().deleteNoticeAdmin(conn,bno);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	//1:1 문의 조회
	public ArrayList<Board> selectInquireList() {
		
		Connection conn = JDBCTemplate.getConnection();
				
		ArrayList<Board> list = new BoardDao().selectInquireList(conn);
		
		JDBCTemplate.close(conn);
		
		return list;
	}

	// 해당 1:1 문의 정보 가져오기 
	public Board inquireDetailAdmin(int bno) {
		
		Connection conn = JDBCTemplate.getConnection();
				
		Board b = new BoardDao().inquireDetailAdmin(conn,bno);
		
		JDBCTemplate.close(conn);
		
		return b;
	}

	//해당 1:1문의 답변 등록
	public int inquireAnswer(int bno, String answer) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new BoardDao().inquireAnswer(conn,bno,answer);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		return result;
	}

	//FAQ조회
	public ArrayList<Board> selectFaqAdmin() {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Board> list = new BoardDao().selectFaqAdmin(conn);
		
		JDBCTemplate.close(conn);
		
		return list;
	}
	
	//FAQ등록
	public int insertFaqAdmin(int mno, String faqtitle, String faqcontent) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new BoardDao().insertFaqAdmin(conn,mno,faqtitle,faqcontent);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	//FAQ 수정전 정보조회
	public Board selFaqAdmin(int bno) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		Board b = new BoardDao().selFaqAdmin(conn,bno);
		
		JDBCTemplate.close(conn);
		
		return b;
	}

	//FAQ 수정
	public int updateFaqAdmin(int bno, String title, String content) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new BoardDao().updateFaqAdmin(conn,bno,title,content);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return result;
	}

	//FAQ 삭제
	public int delFaqAdmin(int bno) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new BoardDao().delFaqAdmin(conn,bno);
		
		if(result > 0 ) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return result;
	}

}
