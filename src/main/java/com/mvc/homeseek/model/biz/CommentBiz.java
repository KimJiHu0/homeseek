package com.mvc.homeseek.model.biz;

import java.util.List;

import com.mvc.homeseek.model.dto.CommentDto;

public interface CommentBiz {

	// 댓글 목록
	public List<CommentDto> commentList(int qna_no);

	// 댓글 작성
	public int commentInsert(CommentDto comment);

	// 댓글 수정
	public int commentUpdate(CommentDto comment);

	// 댓글 삭제
	public int commentDelete(int comm_no);

}
