package com.mvc.homeseek.model.dao;

import com.mvc.homeseek.model.dto.WishDto;

public interface WishDao {

	String NAMESPACE = "wish-mapper.";

	// 찜목록 추가 시
	public int insertWish(WishDto dto);

	// 찜목록 삭제 시
	public int deleteWish(WishDto dto);
	
	// 내 찜목록에 해당 글이 있나 없나 확인
	public int selectWishCheck(WishDto dto);

}
