package com.mvc.homeseek.model.dao;

import com.mvc.homeseek.model.dto.DonationDto;

public interface DonationDao {
	
	String NAMESPACE = "donationInsert.";
	
	public int donationInsert(DonationDto dto);

}
