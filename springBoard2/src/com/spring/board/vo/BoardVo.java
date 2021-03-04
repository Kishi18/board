package com.spring.board.vo;

public class BoardVo {
	
	/*
	 CREATE TABLE BOARD(
  		BOARD_TYPE VARCHAR2(5 BYTE) NOT NULL,
		BOARD_NUM NUMBER(4, 0) NOT NULL,
		BOARD_TITLE VARCHAR2(50 BYTE),
		BOARD_COMMENT VARCHAR2(1000 BYTE),
		CREATOR VARCHAR2(15 BYTE),
		CREATE_TIME VARCHAR2(14 BYTE),
		MODIFIER VARCHAR2(15 BYTE),
		MODIFIED_TIME VARCHAR2(14 BYTE),
		FILE_ROOT VARCHAR2(200 BYTE),
		CONSTRAINT TABLE1_PK PRIMARY KEY(
			BOARD_NUM,
			BOARD_TYPE
		)

COMMENT ON COLUMN BOARD.BOARD_TYPE IS '게시글타입';
COMMENT ON COLUMN BOARD.BOARD_NUM IS '게시글 번호';
COMMENT ON COLUMN BOARD.BOARD_TITLE IS '게시글 제목';
COMMENT ON COLUMN BOARD.BOARD_COMMENT IS '게시글 내용';
COMMENT ON COLUMN BOARD.CREATOR IS '생성자';
COMMENT ON COLUMN BOARD.CREATE_TIME IS '생성시간';
COMMENT ON COLUMN BOARD.MODIFIER IS '수정자';
COMMENT ON COLUMN BOARD.MODIFIED_TIME IS '수정시간';
COMMENT ON COLUMN BOARD.FILE_ROOT IS '파일';
	 */
	
	private String 	boardType;
	private int 	boardNum;
	private String 	boardTitle;
	private String 	boardComment;
	private String 	creator;
	private String	modifier;
	private int totalCnt;
	
	
	public int getTotalCnt() {
		return totalCnt;
	}
	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public String getBoardType() {
		return boardType;
	}
	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardComment() {
		return boardComment;
	}
	public void setBoardComment(String boardComment) {
		this.boardComment = boardComment;
	}
	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
	public String getModifier() {
		return modifier;
	}
	public void setModifier(String modifier) {
		this.modifier = modifier;
	}
	
	
}
