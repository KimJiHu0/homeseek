package com.mvc.homeseek.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.homeseek.model.dao.CommentDao;
import com.mvc.homeseek.model.dto.CommentDto;

@Service
public class CommentBizImpl implements CommentBiz {
	
	@Autowired
	private CommentDao commentDao;

	@Override
	public List<CommentDto> commentList(int qna_no) {
		// TODO Auto-generated method stub
		return commentDao.commentList(qna_no);
	}

	@Override
	public int commentInsert(CommentDto comment) {
		// TODO Auto-generated method stub
		return commentDao.commentInsert(comment);
	}

	@Override
	public int commentUpdate(CommentDto comment) {
		// TODO Auto-generated method stub
		return commentDao.commentUpdate(comment);
	}

	@Override
	public int commentDelete(int comm_no) {
		// TODO Auto-generated method stub
		return commentDao.commentDelete(comm_no);
	}
	
	

}
