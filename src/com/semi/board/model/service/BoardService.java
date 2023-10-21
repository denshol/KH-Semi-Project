package com.semi.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.semi.board.model.dao.BoardDao;
import com.semi.board.model.vo.Board;
import com.semi.common.JDBCTemplate;
import com.semi.product.model.vo.Attachment;

public class BoardService {

	//공지사항 조회
	public ArrayList<Board> selectNoticeList() {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Board> list = new BoardDao().selectNoticeList(conn);
		
		JDBCTemplate.close(conn);
		System.out.println("service : "+list);
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

	public ArrayList<Attachment> updateAttachment(int bno) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Attachment> list = new BoardDao().updateAttachment(conn,bno);
		
		JDBCTemplate.close(conn);
		
		return list;
	}

	public int updateNoticeAdmin(Board b, ArrayList<Attachment> list) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new BoardDao().updateNoticeAdmin(conn,b);
		int result2 = 1;
		System.out.println("list : " + list.size());
		if(!(list.isEmpty())) {
			System.out.println("list 통과함 : " + list.size());
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
		System.out.println("결과 : " + result*result2);
		return result*result2;
	}

}
