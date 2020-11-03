package com.mvc.homeseek.model.dto;

import java.util.Date;

public class NoticeDto {

	private int notice_no;//PRIMARY KEY
	private String notice_title;//제목
	private String notice_content;//내용
	private Date notice_regdate;//작성일
	private Date notice_updatedate;//추가 : 수정일
	
	private int notice_hit;//조회수
	private char notice_delflag;//삭제여부
	private String notice_id;//아이디

	public NoticeDto() {
		
	}
	
	public NoticeDto(int notice_no, String notice_title, String notice_content, Date notice_regdate, int notice_hit,
			char notice_delflag, String notice_id, Date notice_updatedate) {
		super();
		this.notice_no = notice_no;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_regdate = notice_regdate;
		this.notice_hit = notice_hit;
		this.notice_delflag = notice_delflag;
		this.notice_id = notice_id;
		this.notice_updatedate = notice_updatedate;
	}

	@Override
	public String toString() {
		return "NoticeDto [notice_no=" + notice_no + ", notice_title=" + notice_title + ", notice_content="
				+ notice_content + ", notice_regdate=" + notice_regdate + ", notice_hit=" + notice_hit
				+ ", notice_delflag=" + notice_delflag + ", notice_id=" + notice_id + ", notice_updatedate="
				+ notice_updatedate + "]";
	}

	public Date getNotice_updatedate() {
		return notice_updatedate;
	}

	public void setNotice_updatedate(Date notice_updatedate) {
		this.notice_updatedate = notice_updatedate;
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
