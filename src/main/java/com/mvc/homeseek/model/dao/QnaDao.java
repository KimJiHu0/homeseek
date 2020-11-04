package com.mvc.homeseek.model.dao;

import java.util.List;

import com.mvc.homeseek.model.dto.QnaDto;

public interface QnaDao {
	
	String NAMESPACE = "qna.";
	
	public List<QnaDto> selectList();

	public QnaDto selectOne(int seq);

	public int insert(QnaDto dto);

	public int update(QnaDto dto);

	public int delete(int seq);
	
	public List<QnaDto> selectList(String keyword);

}
