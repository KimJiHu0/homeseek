package com.mvc.homeseek.model.dto;

import java.util.Date;

public class MessageDto {
	
	private int message_no;
	private String message_senid;
	private String message_reid;
	private String message_title;
	private String message_content;
	private Date message_date;
	private char message_sendel;
	private char message_redel;

	public MessageDto() {
		
	}

	public MessageDto(int message_no, String message_senid, String message_reid, String message_title,
			String message_content, Date message_date, char message_sendel, char message_redel) {
		super();
		this.message_no = message_no;
		this.message_senid = message_senid;
		this.message_reid = message_reid;
		this.message_title = message_title;
		this.message_content = message_content;
		this.message_date = message_date;
		this.message_sendel = message_sendel;
		this.message_redel = message_redel;
	}

	public int getMessage_no() {
		return message_no;
	}

	public void setMessage_no(int message_no) {
		this.message_no = message_no;
	}

	public String getMessage_senid() {
		return message_senid;
	}

	public void setMessage_senid(String message_senid) {
		this.message_senid = message_senid;
	}

	public String getMessage_reid() {
		return message_reid;
	}

	public void setMessage_reid(String message_reid) {
		this.message_reid = message_reid;
	}

	public String getMessage_title() {
		return message_title;
	}

	public void setMessage_title(String message_title) {
		this.message_title = message_title;
	}

	public String getMessage_content() {
		return message_content;
	}

	public void setMessage_content(String message_content) {
		this.message_content = message_content;
	}

	public Date getMessage_date() {
		return message_date;
	}

	public void setMessage_date(Date message_date) {
		this.message_date = message_date;
	}

	public char getMessage_sendel() {
		return message_sendel;
	}

	public void setMessage_sendel(char message_sendel) {
		this.message_sendel = message_sendel;
	}

	public char getMessage_redel() {
		return message_redel;
	}

	public void setMessage_redel(char message_redel) {
		this.message_redel = message_redel;
	}
}
