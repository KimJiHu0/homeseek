package com.mvc.homeseek.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.homeseek.model.dao.WishDao;
import com.mvc.homeseek.model.dto.RoomDto;
import com.mvc.homeseek.model.dto.WishDto;

@Service
public class WishBizImpl implements WishBiz {
	
	@Autowired
	private WishDao wishdao;

	@Override
	public int insertWish(WishDto dto) {
		return wishdao.insertWish(dto);
	}

	@Override
	public int deleteWish(WishDto dto) {
		return wishdao.deleteWish(dto);
	}

	@Override
	public int selectWishCheck(WishDto dto) {
		return wishdao.selectWishCheck(dto);
	}

	@Override
	public List<WishDto> selectWishList(String wish_id) {
		return wishdao.selectWishList(wish_id);
	}

	@Override
	public int deletemultiWishlist(int wish_no) {
		return wishdao.deletemultiWishlist(wish_no);
	}
}
