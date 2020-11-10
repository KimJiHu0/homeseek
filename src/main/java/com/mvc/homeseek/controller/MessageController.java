package com.mvc.homeseek.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mvc.homeseek.model.biz.MemberBiz;
import com.mvc.homeseek.model.biz.MessageBiz;
import com.mvc.homeseek.model.dto.MemberDto;
import com.mvc.homeseek.model.dto.MessageDto;

@Controller
public class MessageController {

	private Logger logger = LoggerFactory.getLogger(MessageController.class);

	@Autowired
	private MessageBiz messagebiz;

	@Autowired
	private MemberBiz memberbiz;

	// 쪽지보내기 Form
	@RequestMapping("messagemember.do")
	public String insertMessageForm(@RequestParam("room_id") String message_reid, HttpSession session, Model model) {

		logger.info("[ MessageController ] insertMessageForm");

		// message_reid : 쪽지 받을 id
		// message_senid : 쪽지 보내는 id

		// 쪽지 받는 사람의 정보를 담을 dto
		MemberDto reuser = memberbiz.selectMemberById(message_reid);
		// 쪽지 보내는 사람의 정보를 담을 dto
		MemberDto senuser = (MemberDto) session.getAttribute("login");

		model.addAttribute("message_reuser", reuser);
		model.addAttribute("message_senuser", senuser);

		return "messageMemberForm";
	}

	// 쪽지보내기 처리하는 메소드
	@RequestMapping(value = "messagememberres.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> insertMessageRes(@RequestBody MessageDto messagedto, Model model) {

		Map<Object, Object> map = new HashMap<Object, Object>();

		logger.info("[ MessageController ] insertMessageRes");

		int res = messagebiz.insertMessage(messagedto);

		map.put("res", res);
		map.put("message_senid", messagedto.getMessage_senid());
		map.put("message_reid", messagedto.getMessage_reid());
		map.put("message_date", messagedto.getMessage_date());

		// model.addAttribute("res", res);
		return map;
	}

	// 받은쪽지함에서 다중삭제
	@RequestMapping("muldeleteremsglist.do")
	@ResponseBody
	public int muldeleteReMsgList(@RequestParam(value = "message_no[]") int[] message_nos, HttpSession session) {

		MemberDto dto = (MemberDto) session.getAttribute("login");

		String message_senid = dto.getMember_id();

		int res = 0;

		if (message_senid != null) {
			for (int message_no : message_nos) {
				messagebiz.muldelMyReMsgList(message_no);
			}
			res = 1;
		}
		return res;
	}

	// 보낸쪽지함에서 다중삭제
	@RequestMapping("muldeletesenmsglist.do")
	@ResponseBody
	public int muldeleteSenMsgList(@RequestParam(value = "message_no[]") int[] message_nos, HttpSession session) {

		MemberDto dto = (MemberDto) session.getAttribute("login");

		String message_senid = dto.getMember_id();

		int res = 0;

		if (message_senid != null) {
			for (int message_no : message_nos) {
				messagebiz.muldelMySenMsgList(message_no);
			}
			res = 1;
		}
		return res;
	}

	// 받은쪽지 하나만 삭제
	@ResponseBody
	@RequestMapping(value = "deleteremsg.do", method = RequestMethod.POST)
	public int deleteReMsg(int message_no) {

		int res = 0;

		res = messagebiz.muldelMyReMsgList(message_no);

		return res;
	}

	// 그냥 하나만 삭제
	@ResponseBody
	@RequestMapping(value = "deletesenmsg.do", method = RequestMethod.POST)
	public int deleteSenMsg(int message_no) {

		int res = 0;

		res = messagebiz.muldelMySenMsgList(message_no);

		return res;
	}

	// 내가 보낸 메세지 조회
	@RequestMapping("mypagemysenmsglist.do")
	public String mypagesenmsglist(HttpSession session, Model model) {

		List<MessageDto> senmsglist = null;
		MemberDto dto = (MemberDto) session.getAttribute("login");

		// 메세지 보낸사람 = 내아이디
		String message_senid = dto.getMember_id();

		senmsglist = messagebiz.selectMySenMsgList(message_senid);

		model.addAttribute("senmsglist", senmsglist);

		return "mypageMySenmsg";
	}

	// 내가 받은 메세지 조회
	@RequestMapping("mypagemyremsglist.do")
	public String mypageremsglist(HttpSession session, Model model,
				@RequestParam(value="nowPage", required=false)String nowPage,
				@RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		List<MessageDto> remsglist = null;

		MemberDto dto = (MemberDto) session.getAttribute("login");

		String message_reid = dto.getMember_id();
		int total = messagebiz.countMsgByReid(message_reid);

		remsglist = messagebiz.selectMyReMsgList(message_reid);

		model.addAttribute("remsglist", remsglist);

		return "mypageMyRemsg";
	}

	// 받은 메세지 상세보기
	@RequestMapping("mypageremsgdetail.do")
	public String mypageReMsgDetail(int message_no, Model model) {

		// 쪽지 상세보기 뽑은 messagedto
		MessageDto messagedto = messagebiz.selectMyMsgDetail(message_no);

		// 쪽지 보낸 사람의 id를가지고 member_name을 찾아오기 위한 변수
		String member_id = messagedto.getMessage_senid();

		// 위에서 조회한 id를 통해서 그 사람에 대한 모든 정보를 담은 dto
		MemberDto memberdto = memberbiz.selectMemberById(member_id);

		model.addAttribute("messagedto", messagedto);
		model.addAttribute("memberdto", memberdto);

		return "mypageMyremsgDetail";
	}

	// 보낸 메세지 상세보기
	@RequestMapping("mypagesenmsgdetail.do")
	public String mypageSenMsgDetail(int message_no, Model model) {

		logger.info("버ㅗ낸메세지 상세보기좀 하자 : " + message_no);
		// 쪽지 상세보기 뽑은 messagedto
		MessageDto messagedto = messagebiz.selectMyMsgDetail(message_no);

		// 쪽지 받는 사람의 id를 가지고 member_name을 찾아오기
		String member_id = messagedto.getMessage_reid();

		MemberDto memberdto = memberbiz.selectMemberById(member_id);

		model.addAttribute("messagedto", messagedto);
		model.addAttribute("memberdto", memberdto);
		return "mypageMysenmsgDetail";
	}
}
