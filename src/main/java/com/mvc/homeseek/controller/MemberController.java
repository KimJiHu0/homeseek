package com.mvc.homeseek.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mvc.homeseek.model.biz.MemberBiz;
import com.mvc.homeseek.model.dto.MemberDto;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
public class MemberController {

	private Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberBiz memberBiz;

	@RequestMapping("loginform.do")
	public String loginForm() {
		logger.info("login.do");
		return "login";
	}

	@ResponseBody
	@RequestMapping(value = "/ajaxlogin.do", method = RequestMethod.POST)
	public Map<String, Boolean> login(@RequestBody MemberDto dto, HttpSession session) {
		logger.info("ajaxlogin.do");

		MemberDto res = memberBiz.login(dto);

		boolean check = false;

		if (res != null) {
			session.setAttribute("login", res);
			session.setAttribute("member_id", dto.getMember_id());
			logger.info("---------------------------------");
			logger.info("| 현재 로그인한 사용자 : " + dto.getMember_id() + " |");
			logger.info("---------------------------------");
			
		
			check = true;
		}

		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("check", check);
		
		return map;

	}

	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		logger.info("logout.do");
		session.invalidate();
		return "redirect:/main.do";
	}
	@RequestMapping("registform.do")
	public String registForm() {
		logger.info("registform.do");
		
		return "regist";
	}
	@RequestMapping("registres.do")
	public String registRes(MemberDto dto) {
		logger.info("registres.do");
		
		
		if(memberBiz.insert(dto) > 0) {
			return "redirect:/main.do";
		}
		
		
		return "redirect:registform.do";
		
	}
	@ResponseBody
	@RequestMapping(value="/checkid.do", method = RequestMethod.POST)
	public String chkId(@RequestParam("member_id") String member_id) {
		
		String str = "";
		int res = memberBiz.checkId(member_id);
		if(res == 1){ //이미 존재하는 계정
			str = "NO";	
		}else{	//사용 가능한 계정
			str = "YES";	
		}
		return str;


	}
	
	@RequestMapping(value="/sendsms.do", method = RequestMethod.POST)
    @ResponseBody
    public String sendSMS(@RequestParam("phoneNumber") String phoneNumber) {

        Random rand  = new Random();
        String numStr = "";
        for(int i=0; i<4; i++) {
            String ran = Integer.toString(rand.nextInt(10));
            numStr+=ran;
        }

        System.out.println("수신자 번호 : " + phoneNumber);
        System.out.println("인증번호 : " + numStr);
        String api_key = "NCS2ZUPG3LMOQ0H3";
        String api_secret = "JA50IZAE97G9MEQQ1BJVUBTOUIMLWHYZ";
        Message coolsms = new Message(api_key, api_secret);

        // 4 params(to, from, type, text) are mandatory. must be filled
        HashMap<String, String> params = new HashMap<String, String>();
        params.put("to", phoneNumber);    // 수신전화번호
        params.put("from", "01099731489");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
        params.put("type", "SMS");
        params.put("text", " homeseek 회원가입  인증번호는 " + "["+numStr+"]" + "입니다.");
        params.put("app_version", "test app 1.2"); // application name and version

        try {
            JSONObject obj = (JSONObject) coolsms.send(params);
            System.out.println(obj.toString());
        } catch (CoolsmsException e) {
            System.out.println(e.getMessage());
            System.out.println(e.getCode());
        }
        return numStr;
    }

}