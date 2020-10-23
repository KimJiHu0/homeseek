package com.mvc.homeseek.model.dto;

import java.util.Date;

public class ReportDto {
	
	private int report_no;
	private String report_senid;
	private String report_reid;
	private String report_title;
	private String report_content;
	private Date report_date;

	public ReportDto() {
		
	}

	public ReportDto(int report_no, String report_senid, String report_reid, String report_title, String report_content,
			Date report_date) {
		super();
		this.report_no = report_no;
		this.report_senid = report_senid;
		this.report_reid = report_reid;
		this.report_title = report_title;
		this.report_content = report_content;
		this.report_date = report_date;
	}

	public int getReport_no() {
		return report_no;
	}

	public void setReport_no(int report_no) {
		this.report_no = report_no;
	}

	public String getReport_senid() {
		return report_senid;
	}

	public void setReport_senid(String report_senid) {
		this.report_senid = report_senid;
	}

	public String getReport_reid() {
		return report_reid;
	}

	public void setReport_reid(String report_reid) {
		this.report_reid = report_reid;
	}

	public String getReport_title() {
		return report_title;
	}

	public void setReport_title(String report_title) {
		this.report_title = report_title;
	}

	public String getReport_content() {
		return report_content;
	}

	public void setReport_content(String report_content) {
		this.report_content = report_content;
	}

	public Date getReport_date() {
		return report_date;
	}

	public void setReport_date(Date report_date) {
		this.report_date = report_date;
	}

	
}
