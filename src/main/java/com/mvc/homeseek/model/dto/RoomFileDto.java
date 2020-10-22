package com.mvc.homeseek.model.dto;

import org.springframework.web.multipart.MultipartFile;

public class RoomFileDto {
	
	private String room_file_name;
	private MultipartFile room_file;
	
	public String getRoom_file_name() {
		return room_file_name;
	}
	public void setRoom_file_name(String room_file_name) {
		this.room_file_name = room_file_name;
	}
	public MultipartFile getRoom_file() {
		return room_file;
	}
	public void setRoom_file(MultipartFile room_file) {
		this.room_file = room_file;
	}
	
	
	
	

}
