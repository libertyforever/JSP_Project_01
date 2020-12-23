package com.gipkok.domain;

public class CommentVO {
	private int cno;
	private int pno;
	private String writer;
	private String comment;
	private String regdate;
	
	public CommentVO() {}

	public CommentVO(int cno, String comment) {
		this.cno = cno;
		this.comment = comment;
	}
	public CommentVO(int pno, String writer, String comment) {
		this.pno = pno;
		this.writer = writer;
		this.comment = comment;
	}	
	public CommentVO(int cno, int pno, String writer, String comment, String regdate) {
		this.cno = cno;
		this.pno = pno;
		this.writer = writer;
		this.comment = comment;
		this.regdate = regdate;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
}
