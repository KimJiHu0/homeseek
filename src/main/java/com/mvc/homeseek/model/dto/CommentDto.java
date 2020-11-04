package com.mvc.homeseek.model.dto;

import java.util.Date;

public class CommentDto {
	
	private int comm_no;
	private String comm_content;
	private Date comm_regdate;
	private char comm_delflag;
	private int qna_no;
	private String comm_id;
	
	@Override
	public String toString() {
		return "CommentDto [comm_no=" + comm_no + ", comm_content=" + comm_content + ", comm_regdate=" + comm_regdate
				+ ", comm_delflag=" + comm_delflag + ", qna_no=" + qna_no + ", comm_id=" + comm_id + "]";
	}

	public CommentDto() {
		
	}

	public CommentDto(int comm_no, String comm_content, Date comm_regdate, char comm_delflag, int qna_no,
			String comm_id) {
		super();
		this.comm_no = comm_no;
		this.comm_content = comm_content;
		this.comm_regdate = comm_regdate;
		this.comm_delflag = comm_delflag;
		this.qna_no = qna_no;
		this.comm_id = comm_id;
	}

	public int getComm_no() {
		return comm_no;
	}

	public void setComm_no(int comm_no) {
		this.comm_no = comm_no;
	}

	public String getComm_content() {
		return comm_content;
	}

	public void setComm_content(String comm_content) {
		this.comm_content = comm_content;
	}

	public Date getComm_regdate() {
		return comm_regdate;
	}

	public void setComm_regdate(Date comm_regdate) {
		this.comm_regdate = comm_regdate;
	}

	public char getComm_delflag() {
		return comm_delflag;
	}

	public void setComm_delflag(char comm_delflag) {
		this.comm_delflag = comm_delflag;
	}

	public int getQna_no() {
		return qna_no;
	}

	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}

	public String getComm_id() {
		return comm_id;
	}

	public void setComm_id(String comm_id) {
		this.comm_id = comm_id;
	}
}
