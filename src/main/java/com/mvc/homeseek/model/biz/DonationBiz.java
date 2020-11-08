package com.mvc.homeseek.model.biz;

import java.util.List;

import com.mvc.homeseek.model.dto.DonationDto;

public interface DonationBiz {

	public int donationInsert(DonationDto dto);

	// 내가 후원한 내역들 조회
	public List<DonationDto> mypageMyDonaList(String dona_id);

}
