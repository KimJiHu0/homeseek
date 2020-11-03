package com.mvc.homeseek.model.dto;

import java.util.Date;

public class QnaDto {
	
	private int qna_no;//PRIMARY KEY
	private String qna_title;//제목
	private String qna_content;//내용
	private Date qna_regdate;//등록일
	private int qna_hit;//조회수
	private char qna_secretflag; //비밀글 여부-- Y : 비밀글 / N : 공개글
	private int qna_pwd;//비밀글 비번
	private char qna_delflag;//QNA 삭제여부-- Y : 삭제O / N : 삭제X
	private String qna_id; //FOREIGN KEY by MEMBER_ID
	
	public QnaDto() {
		
	}

	public QnaDto(int qna_no, String qna_title, String qna_content, Date qna_regdate, int qna_hit, char qna_secretflag,
			int qna_pwd, char qna_delflag, String qna_id) {
		super();
		this.qna_no = qna_no;
		this.qna_title = qna_title;
		this.qna_content = qna_content;
		this.qna_regdate = qna_regdate;
		this.qna_hit = qna_hit;
		this.qna_secretflag = qna_secretflag;
		this.qna_pwd = qna_pwd;
		this.qna_delflag = qna_delflag;
		this.qna_id = qna_id;
	}

	public int getQna_no() {
		return qna_no;
	}

	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}

	public String getQna_title() {
		return qna_title;
	}

	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}

	public String getQna_content() {
		return qna_content;
	}

	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}

	public Date getQna_regdate() {
		return qna_regdate;
	}

	public void setQna_regdate(Date qna_regdate) {
		this.qna_regdate = qna_regdate;
	}

	public int getQna_hit() {
		return qna_hit;
	}

	public void setQna_hit(int qna_hit) {
		this.qna_hit = qna_hit;
	}

	public char getQna_secretflag() {
		return qna_secretflag;
	}

	public void setQna_secretflag(char qna_secretflag) {
		this.qna_secretflag = qna_secretflag;
	}

	public int getQna_pwd() {
		return qna_pwd;
	}

	public void setQna_pwd(int qna_pwd) {
		this.qna_pwd = qna_pwd;
	}

	public char getQna_delflag() {
		return qna_delflag;
	}

	public void setQna_delflag(char qna_delflag) {
		this.qna_delflag = qna_delflag;
	}

	public String getQna_id() {
		return qna_id;
	}

	public void setQna_id(String qna_id) {
		this.qna_id = qna_id;
	}
}
