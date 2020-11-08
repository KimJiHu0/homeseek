package com.mvc.homeseek.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mvc.homeseek.model.biz.CommentBiz;
import com.mvc.homeseek.model.dto.CommentDto;
import com.mvc.homeseek.model.dto.MemberDto;

@Controller
public class CommentController {
	
	private Logger logger = LoggerFactory.getLogger(CommentController.class);
	
	@Autowired
	private CommentBiz commentBiz;

	
	@RequestMapping("commentlist.do") //댓글 리스트
    @ResponseBody
    private List<CommentDto> mCommentServiceList(@RequestParam int qna_no) throws Exception{
		logger.info("댓글 리스트");
		//여기서 날짜 포멧 변환 -> setter로 넣어줌
		return commentBiz.commentList(qna_no);
    }
    
    @RequestMapping("commentinsert.do") //댓글 작성 
    @ResponseBody
    private int mCommentServiceInsert(@RequestParam int qna_no, @RequestParam String comm_content, HttpSession session) throws Exception{
    	logger.info("댓글 작성 ");
    	
    	MemberDto member_dto = (MemberDto) session.getAttribute("login");
    	
        CommentDto comment = new CommentDto();
        comment.setComm_id(member_dto.getMember_id());  
        
        System.out.println(comment.getComm_content());
        comment.setQna_no(qna_no);
        comment.setComm_content(comm_content);
        //로그인 기능을 구현했거나 따로 댓글 작성자를 입력받는 폼이 있다면 입력 받아온 값으로 사용하면 됩니다.
        
        return commentBiz.commentInsert(comment);
    }
    
    @RequestMapping("commentupdate.do") //댓글 수정  
    @ResponseBody
    private int mCommentServiceUpdateProc(@RequestParam int comm_no, @RequestParam String comm_content, Model model) throws Exception{
    	logger.info("댓글 수정  ");
    	
        CommentDto comment = new CommentDto();
        comment.setComm_no(comm_no);
        comment.setComm_content(comm_content);
        System.out.println(comment.getComm_content());
        
        model.addAttribute("dto", commentBiz.commentUpdate(comment));
        
        return commentBiz.commentUpdate(comment);
    }
    
    @RequestMapping("commentdelete.do") //댓글 삭제  
    @ResponseBody
    private int mCommentServiceDelete(@RequestParam int comm_no) throws Exception{
    	logger.info("댓글 삭제  ");
    	
        return commentBiz.commentDelete(comm_no);
    }


}
