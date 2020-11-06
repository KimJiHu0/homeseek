package com.mvc.homeseek.model.dao;

import java.util.List;

import com.mvc.homeseek.model.dto.NoticeDto;


public interface NoticeDao {
	
	String NAMESPACE = "notice.";
	
	public List<NoticeDto> selectList();

	public NoticeDto selectOne(int seq);

	public int insert(NoticeDto dto);

	public int update(NoticeDto dto);

	public int delete(int seq);
	//검색
	public List<NoticeDto> selectList(String keyword);
	//조회수(HIT)
	public int hit(int notice_no);
	
	

}
