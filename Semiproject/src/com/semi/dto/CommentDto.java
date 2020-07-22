package com.semi.dto;

import java.util.Date;

public class CommentDto {

	private int boardNo;
	private int comment_No;
	private String comment_Content;
	private String comment_Id;
	private Date regdate;
	private int comment_Parent;

	public CommentDto() {
		super();
	}

	public CommentDto(int boardNo, int comment_No, String comment_Content, String comment_Id, Date regdate,
			int comment_Parent) {
		super();
		this.boardNo = boardNo;
		this.comment_No = comment_No;
		this.comment_Content = comment_Content;
		this.comment_Id = comment_Id;
		this.regdate = regdate;
		this.comment_Parent = comment_Parent;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getComment_No() {
		return comment_No;
	}

	public void setComment_No(int comment_No) {
		this.comment_No = comment_No;
	}

	public String getComment_Content() {
		return comment_Content;
	}

	public void setComment_Content(String comment_Content) {
		this.comment_Content = comment_Content;
	}

	public String getComment_Id() {
		return comment_Id;
	}

	public void setComment_Id(String comment_Id) {
		this.comment_Id = comment_Id;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getComment_Parent() {
		return comment_Parent;
	}

	public void setComment_Parent(int comment_Parent) {
		this.comment_Parent = comment_Parent;
	}

}
