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

COMMENT ON COLUMN BOARD.BOARD_TYPE IS '�Խñ�Ÿ��';
COMMENT ON COLUMN BOARD.BOARD_NUM IS '�Խñ� ��ȣ';
COMMENT ON COLUMN BOARD.BOARD_TITLE IS '�Խñ� ����';
COMMENT ON COLUMN BOARD.BOARD_COMMENT IS '�Խñ� ����';
COMMENT ON COLUMN BOARD.CREATOR IS '������';
COMMENT ON COLUMN BOARD.CREATE_TIME IS '�����ð�';
COMMENT ON COLUMN BOARD.MODIFIER IS '������';
COMMENT ON COLUMN BOARD.MODIFIED_TIME IS '�����ð�';
COMMENT ON COLUMN BOARD.FILE_ROOT IS '����';
	 */
	
	private String 	boardType;
	private int 	boardNum;
	private String 	boardTitle;
	private String 	boardComment;
	private String 	creator;
	private String	modifier;
	private int totalCnt;
	
	private String	code_Name;
	private String	code_Type;
	private String	code_Id;
	private int numRow;
	
	
	public String getCode_Name() {
		return code_Name;
	}
	public void setCode_Name(String code_Name) {
		this.code_Name = code_Name;
	}
	public String getCode_Type() {
		return code_Type;
	}
	public void setCode_Type(String code_Type) {
		this.code_Type = code_Type;
	}
	public String getCode_Id() {
		return code_Id;
	}
	public void setCode_Id(String code_Id) {
		this.code_Id = code_Id;
	}
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
	public int getNumRow() {
		return numRow;
	}
	public void setNumRow(int numRow) {
		this.numRow = numRow;
	}
	
	
}
