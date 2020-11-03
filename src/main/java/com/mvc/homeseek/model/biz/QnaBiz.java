package com.mvc.homeseek.model.biz;

import java.util.List;

import com.mvc.homeseek.model.dto.QnaDto;

public interface QnaBiz {
	public List<QnaDto> selectList();

	public QnaDto selectOne(int seq);

	public int insert(QnaDto dto);

	public int update(QnaDto dto);

	public int delete(int seq);

}
