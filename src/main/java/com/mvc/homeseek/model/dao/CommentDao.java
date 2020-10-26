package com.mvc.homeseek.model.dao;

import com.mvc.homeseek.model.dto.CommentDto;

public interface CommentDao {
	
	String NAMESPACE = "comment-mapper.";
	
	// 쪽지 보내기
	public int insertComment(CommentDto commentdto);

}
