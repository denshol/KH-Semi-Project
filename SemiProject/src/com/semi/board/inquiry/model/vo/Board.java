package com.semi.board.inquiry.model.vo;

import java.sql.Date;

public class Board {
	
	private	int	boardNo;			//	BOARD_NO	NUMBER
	private	String	memberNo;			//	MEMBER_NO	NUMBER
	private	int productNo;			//	PRODUCT_NO	NUMBER
	private	int	boardCategory;		//	BOARD_CATEGORY	NUMBER
	private String boardTitle;		//	BOARD_TITLE	VARCHAR2(100 BYTE)
	private String boardContent;	//	BOARD_CONTENT	VARCHAR2(1000 BYTE)
	private String boardAnswered;	//	BOARD_ANSWERED	CHAR(3 BYTE)
	private	int	boardCount;			//	BOARD_COUNT	NUMBER
	private Date createDate;		//	CREATE_DATE	DATE
	private String status;			//	STATUS	CHAR(3 BYTE)
	
	public Board() {
		super();
	}
	
	//FAQ 조회 생성자
		public Board(int boardNo, String boardTitle, String boardContent, Date createDate) {
			super();
			this.boardNo = boardNo;
			this.boardTitle = boardTitle;
			this.boardContent = boardContent;
			this.createDate = createDate;
		}

		//1:1 문의 상세조회 생성자
		public Board(int boardNo, String boardTitle, String boardContent, String boardAnswered) {
			super();
			this.boardNo = boardNo;
			this.boardTitle = boardTitle;
			this.boardContent = boardContent;
			this.boardAnswered = boardAnswered;
		}

		//1:1 문의 조회 생성자
		public Board(int boardNo, String memberNo, int productNo, String boardTitle, String boardContent,
				String boardAnswered, Date createDate) {
			super();
			this.boardNo = boardNo;
			this.memberNo = memberNo;
			this.productNo = productNo;
			this.boardTitle = boardTitle;
			this.boardContent = boardContent;
			this.boardAnswered = boardAnswered;
			this.createDate = createDate;
		}
		
		//공지사항 상세 조회 생성자
		public Board(int boardNo, String memberNo, String boardTitle, String boardContent, int boardCount, Date createDate,
				String status) {
			super();
			this.boardNo = boardNo;
			this.memberNo = memberNo;
			this.boardTitle = boardTitle;
			this.boardContent = boardContent;
			this.boardCount = boardCount;
			this.createDate = createDate;
			this.status = status;
		}

		//공지사항 조회 생성자
		public Board(int boardNo, String memberNo, String boardTitle, String boardContent, int boardCount,
				Date createDate) {
			super();
			this.boardNo = boardNo;
			this.memberNo = memberNo;
			this.boardTitle = boardTitle;
			this.boardContent = boardContent;
			this.boardCount = boardCount;
			this.createDate = createDate;
		}
	
	public Board(int boardNo, String memberNo, int productNo, int boardCategory, String boardTitle, String boardContent,
			String boardAnswered, int boardCount, Date createDate, String status) {
		super();
		this.boardNo = boardNo;
		this.memberNo = memberNo;
		this.productNo = productNo;
		this.boardCategory = boardCategory;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardAnswered = boardAnswered;
		this.boardCount = boardCount;
		this.createDate = createDate;
		this.status = status;
	}
	
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public int getBoardCategory() {
		return boardCategory;
	}
	public void setBoardCategory(int boardCategory) {
		this.boardCategory = boardCategory;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public String getBoardAnswered() {
		return boardAnswered;
	}
	public void setBoardAnswered(String boardAnswered) {
		this.boardAnswered = boardAnswered;
	}
	public int getBoardCount() {
		return boardCount;
	}
	public void setBoardCount(int boardCount) {
		this.boardCount = boardCount;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", memberNo=" + memberNo + ", productNo=" + productNo + ", boardCategory="
				+ boardCategory + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent + ", boardAnswered="
				+ boardAnswered + ", boardCount=" + boardCount + ", createDate=" + createDate + ", status=" + status
				+ "]";
	}
}
