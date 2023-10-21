package com.semi.board.model.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import com.semi.board.model.vo.Board;
import com.semi.common.JDBCTemplate;
import com.semi.product.model.vo.Attachment;

public class BoardDao {
	
	private Properties prop = new Properties();
	
	public BoardDao() {
		
		String filePath = BoardDao.class.getResource("/sql/board/board-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (InvalidPropertiesFormatException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//공지사항 조회
	public ArrayList<Board> selectNoticeList(Connection conn) {
		ArrayList<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNoticeList");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(rset.getInt("BOARD_NO")
								  ,rset.getString("MEMBER_NAME")
								  ,rset.getString("BOARD_TITLE")
								  ,rset.getString("BOARD_CONTENT")
								  ,rset.getInt("BOARD_COUNT")
								  ,rset.getDate("CREATE_DATE")));
			}
			System.out.println("DAO : "+list);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}
	
	//공지사항 등록
	public int insertNotice(Connection conn, Board b, int memberNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, memberNo);
			pstmt.setString(2, b.getBoardTitle());
			pstmt.setString(3, b.getBoardContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	//공지사항 등록 첨부파일
	public int insertAttachment(Connection conn, ArrayList<Attachment> list) {
		
		int result = 1;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAttachment");
		
		try {
			for(Attachment at : list) {	
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, at.getAttachmentName());
				pstmt.setString(2, at.getAttachmentChange());
				pstmt.setString(3, at.getAttachmentPath());
				pstmt.setInt(4, at.getFileLivel());
				
				result *= pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			result = 0;
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	//공지사항 상세조회
	public Board detailBoardAdmin(Connection conn, int bno) {
		
		Board b = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("detailBoardAdmin");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new Board(rset.getInt("BOARD_NO")
							 ,rset.getString("MEMBER_NAME")
							 ,rset.getString("BOARD_TITLE")
							 ,rset.getString("BOARD_CONTENT")
							 ,rset.getInt("BOARD_COUNT")
							 ,rset.getDate("CREATE_DATE")
							 ,rset.getString("STATUS"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return b;
	}

	//공지사항 상세조회 파일
	public ArrayList<Attachment> detailAttachmentAdmin(Connection conn, int bno) {
		
		ArrayList<Attachment> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("detailAttachmentAdmin");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Attachment(rset.getInt("ATTACHMENT_ID")
									   ,rset.getString("ATTACHMENT_NAME")
									   ,rset.getString("ATTACHMENT_CHANGE")
									   ,rset.getString("ATTACHMENT_PATH")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return list;
	}

	public Board updateNotice(Connection conn, int bno) {
		Board b = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("detailBoardAdmin");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new Board(rset.getInt("BOARD_NO")
							 ,rset.getString("MEMBER_NAME")
							 ,rset.getString("BOARD_TITLE")
							 ,rset.getString("BOARD_CONTENT")
							 ,rset.getInt("BOARD_COUNT")
							 ,rset.getDate("CREATE_DATE")
							 ,rset.getString("STATUS"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return b;
	}

	public ArrayList<Attachment> updateAttachment(Connection conn, int bno) {
		
		ArrayList<Attachment> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("detailAttachmentAdmin");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Attachment(rset.getInt("ATTACHMENT_ID")
						   ,rset.getString("ATTACHMENT_NAME")
						   ,rset.getString("ATTACHMENT_CHANGE")
						   ,rset.getString("ATTACHMENT_PATH")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return list;
	}

	public int updateNoticeAdmin(Connection conn, Board b) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateNoticeAdmin");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, b.getBoardTitle());
			pstmt.setString(2, b.getBoardContent());
			pstmt.setInt(3, b.getBoardNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public int updateAttachmentAdmin(Connection conn, ArrayList<Attachment> list) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateAttachmentAdmin");
		
		try {
			for(Attachment at : list) {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, at.getAttachmentName());
				pstmt.setString(2, at.getAttachmentChange());
				pstmt.setString(3, at.getAttachmentPath());
				pstmt.setInt(4, at.getAttachmentId());
				
				result *= pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			result = 0;
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int newAtAdmin(Connection conn, ArrayList<Attachment> list) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("newAtAdmin");
		
		try {
			for(Attachment at : list) {
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, at.getBoardNo());
				pstmt.setString(2, at.getAttachmentName());
				pstmt.setString(3, at.getAttachmentChange());
				pstmt.setString(4, at.getAttachmentPath());
			}
			
			result *= pstmt.executeUpdate();
			
		} catch (SQLException e) {
			result=0;
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

}
