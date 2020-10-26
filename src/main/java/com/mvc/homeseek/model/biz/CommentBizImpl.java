package com.mvc.homeseek.model.biz;

import org.springframework.beans.factory.annotation.Autowired;

import com.mvc.homeseek.model.dao.CommentDao;
import com.mvc.homeseek.model.dto.CommentDto;

public class CommentBizImpl implements CommentBiz {
	
	@Autowired
	private CommentDao commentdao;

	@Override
	public int insertComment(CommentDto commentdto) {
		return commentdao.insertComment(commentdto);
	}

}
