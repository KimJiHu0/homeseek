package com.mvc.homeseek.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.homeseek.model.dao.DonationDao;
import com.mvc.homeseek.model.dto.DonationDto;

@Service
public class DonationBizImpl implements DonationBiz {

	@Autowired
	private DonationDao donaDao;	
	
	@Override
	public int donationInsert(DonationDto dona_dto) {
		return donaDao.donationInsert(dona_dto);
	}

	@Override
	public List<DonationDto> mypageMyDonaList(String dona_id) {
		return donaDao.mypageMyDonaList(dona_id);
	}

}
