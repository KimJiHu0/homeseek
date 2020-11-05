package com.mvc.homeseek.model.biz;

import java.util.List;

import com.mvc.homeseek.model.dto.WishDto;

public interface WishBiz {

	// 찜목록 추가 시
	public int insertWish(WishDto dto);

	// 찜목록 삭제 시
	public int deleteWish(WishDto dto);

	// 내 찜목록에 해당 글이 있나 없나 확인
	public int selectWishCheck(WishDto dto);
	
	// 마이페이지에서 찜목록 리스트 뽑기
	public List<WishDto> selectWishList(String wish_id);
}
