package com.mvc.homeseek.model.biz;

import java.util.List;

import com.mvc.homeseek.model.dto.NoticeDto;

public interface NoticeBiz {
	public List<NoticeDto> selectList();

	public NoticeDto selectOne(int seq);

	public int insert(NoticeDto dto);

	public int update(NoticeDto dto);

	public int delete(int seq);
	//ajax검색
	public List<NoticeDto> selectList(String keyword);


}
