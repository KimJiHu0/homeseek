package com.mvc.homeseek.model.dto;


//매물 테이블 Dto
public class RoomDto {
	
	private int room_no;
	private String room_name;
	private String room_photo;
	private String room_type;
	private int room_deposit;
	private int room_price;
	private int room_extent;
	private String room_addr;
	private String room_kind;
	private String room_structure;
	private String room_floor;
	private String room_regdate;
	private String room_cpdate;
	private String room_avdate;
	private int room_longi;
	private int room_lati;
	private String room_detail;
	private String room_id;
	
	
	
	public RoomDto() {
		
	}
	public RoomDto(int room_no, String room_name, String room_photo, String room_type, int room_deposit, int room_price,
			int room_extent, String room_addr, String room_kind, String room_structure, String room_floor,
			String room_regdate, String room_cpdate, String room_avdate, int room_longi, int room_lati, String room_detail,
			String room_id) {
		super();
		this.room_no = room_no;
		this.room_name = room_name;
		this.room_photo = room_photo;
		this.room_type = room_type;
		this.room_deposit = room_deposit;
		this.room_price = room_price;
		this.room_extent = room_extent;
		this.room_addr = room_addr;
		this.room_kind = room_kind;
		this.room_structure = room_structure;
		this.room_floor = room_floor;
		this.room_regdate = room_regdate;
		this.room_cpdate = room_cpdate;
		this.room_avdate = room_avdate;
		this.room_longi = room_longi;
		this.room_lati = room_lati;
		this.room_detail = room_detail;
		this.room_id = room_id;
	}



	public int getRoom_no() {
		return room_no;
	}



	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}



	public String getRoom_name() {
		return room_name;
	}



	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}



	public String getRoom_photo() {
		return room_photo;
	}



	public void setRoom_photo(String room_photo) {
		this.room_photo = room_photo;
	}

	public String getRoom_type() {
		return room_type;
	}

	public void setRoom_type(String room_type) {
		this.room_type = room_type;
	}



	public int getRoom_deposit() {
		return room_deposit;
	}



	public void setRoom_deposit(int room_deposit) {
		this.room_deposit = room_deposit;
	}



	public int getRoom_price() {
		return room_price;
	}



	public void setRoom_price(int room_price) {
		this.room_price = room_price;
	}



	public int getRoom_extent() {
		return room_extent;
	}



	public void setRoom_extent(int room_extent) {
		this.room_extent = room_extent;
	}



	public String getRoom_addr() {
		return room_addr;
	}



	public void setRoom_addr(String room_addr) {
		this.room_addr = room_addr;
	}

	public String getRoom_kind() {
		return room_kind;
	}

	public void setRoom_kind(String room_kind) {
		this.room_kind = room_kind;
	}

	public String getRoom_structure() {
		return room_structure;
	}

	public void setRoom_structure(String room_structure) {
		this.room_structure = room_structure;
	}



	public String getRoom_floor() {
		return room_floor;
	}



	public void setRoom_floor(String room_floor) {
		this.room_floor = room_floor;
	}



	public String getRoom_regdate() {
		return room_regdate;
	}



	public void setRoom_regdate(String room_regdate) {
		this.room_regdate = room_regdate;
	}



	public String getRoom_cpdate() {
		return room_cpdate;
	}



	public void setRoom_cpdate(String room_cpdate) {
		this.room_cpdate = room_cpdate;
	}



	public String getRoom_avdate() {
		return room_avdate;
	}



	public void setRoom_avdate(String room_avdate) {
		this.room_avdate = room_avdate;
	}



	public int getRoom_longi() {
		return room_longi;
	}



	public void setRoom_longi(int room_longi) {
		this.room_longi = room_longi;
	}



	public int getRoom_lati() {
		return room_lati;
	}



	public void setRoom_lati(int room_lati) {
		this.room_lati = room_lati;
	}



	public String getRoom_detail() {
		return room_detail;
	}



	public void setRoom_detail(String room_detail) {
		this.room_detail = room_detail;
	}



	public String getRoom_id() {
		return room_id;
	}



	public void setRoom_id(String room_id) {
		this.room_id = room_id;
	}
	
	
	
}
