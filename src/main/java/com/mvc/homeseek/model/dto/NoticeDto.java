package com.mvc.homeseek.model.dto;

import java.util.Date;

public class NoticeDto {
	
	private int notice_no;
	private String notice_title;
	private String notice_content;
	private Date notice_regdate;
	private int notice_hit;
	private char notice_delflag;
	private String notice_id;
	
	public NoticeDto() {
		
	}

	public NoticeDto(int notice_no, String notice_title, String notice_content, Date notice_regdate, int notice_hit,
			char notice_delflag, String notice_id) {
		super();
		this.notice_no = notice_no;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_regdate = notice_regdate;
		this.notice_hit = notice_hit;
		this.notice_delflag = notice_delflag;
		this.notice_id = notice_id;
	}

	public int getNotice_no() {
		return notice_no;
	}

	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public Date getNotice_regdate() {
		return notice_regdate;
	}

	public void setNotice_regdate(Date notice_regdate) {
		this.notice_regdate = notice_regdate;
	}

	public int getNotice_hit() {
		return notice_hit;
	}

	public void setNotice_hit(int notice_hit) {
		this.notice_hit = notice_hit;
	}

	public char getNotice_delflag() {
		return notice_delflag;
	}

	public void setNotice_delflag(char notice_delflag) {
		this.notice_delflag = notice_delflag;
	}

	public String getNotice_id() {
		return notice_id;
	}

	public void setNotice_id(String notice_id) {
		this.notice_id = notice_id;
	}
}
