package com.mvc.homeseek.model.dto;

public class WishDto {
	
	private int wish_no;
	private String wish_id;
	private String wish_sell_id;
	private int room_no;
	
	public WishDto() {
		
	}

	public WishDto(int wish_no, String wish_id, String wish_sell_id, int room_no) {
		super();
		this.wish_no = wish_no;
		this.wish_id = wish_id;
		this.wish_sell_id = wish_sell_id;
		this.room_no = room_no;
	}

	public int getWish_no() {
		return wish_no;
	}

	public void setWish_no(int wish_no) {
		this.wish_no = wish_no;
	}

	public String getWish_id() {
		return wish_id;
	}

	public void setWish_id(String wish_id) {
		this.wish_id = wish_id;
	}

	public String getWish_sell_id() {
		return wish_sell_id;
	}

	public void setWish_sell_id(String wish_sell_id) {
		this.wish_sell_id = wish_sell_id;
	}

	public int getRoom_no() {
		return room_no;
	}

	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}
	
	

}
