package com.mvc.homeseek.model.dto;

import java.util.Date;

public class DonationDto {
	
	private int dona_no;
	private int dona_bill;
	private Date dona_date;
	private String dona_id;
	
	public DonationDto() {
		
	}

	public DonationDto(int dona_no, int dona_bill, Date dona_date, String dona_id) {
		super();
		this.dona_no = dona_no;
		this.dona_bill = dona_bill;
		this.dona_date = dona_date;
		this.dona_id = dona_id;
	}

	public int getDona_no() {
		return dona_no;
	}

	public void setDona_no(int dona_no) {
		this.dona_no = dona_no;
	}

	public int getDona_bill() {
		return dona_bill;
	}

	public void setDona_bill(int dona_bill) {
		this.dona_bill = dona_bill;
	}

	public Date getDona_date() {
		return dona_date;
	}

	public void setDona_date(Date dona_date) {
		this.dona_date = dona_date;
	}

	public String getDona_id() {
		return dona_id;
	}

	public void setDona_id(String dona_id) {
		this.dona_id = dona_id;
	}
}
