package com.semi.dto;

public class BoardDto {

	private int boardNum;
	private String boardTitle;
	private String userID;
	private String boardDate;
	private String boardContent;
	private int boardAvailable;
	
	public BoardDto() {
		super();
	}

	public BoardDto(int boardNum, String boardTitle, String userID, String boardDate, String boardContent,
			int boardAvailable) {
		super();
		this.boardNum = boardNum;
		this.boardTitle = boardTitle;
		this.userID = userID;
		this.boardDate = boardDate;
		this.boardContent = boardContent;
		this.boardAvailable = boardAvailable;
	}

	public int getBoardNum() {
		return boardNum;
	}

	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getBoardDate() {
		return boardDate;
	}

	public void setBoardDate(String boardDate) {
		this.boardDate = boardDate;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public int getBoardAvailable() {
		return boardAvailable;
	}

	public void setBoardAvailable(int boardAvailable) {
		this.boardAvailable = boardAvailable;
	}

	@Override
	public String toString() {
		return "BoardDto [boardNum=" + boardNum + ", boardTitle=" + boardTitle + ", userID=" + userID + ", boardDate="
				+ boardDate + "]";
	}
	
	
	
	}

