package com.mvc.homeseek.model.biz;

import org.springframework.beans.factory.annotation.Autowired;

import com.mvc.homeseek.model.dao.CommentDao;

public class CommentBizImpl implements CommentBiz {
	
	@Autowired
	private CommentDao commentdao;

}
