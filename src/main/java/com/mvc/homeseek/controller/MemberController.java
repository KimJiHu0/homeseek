package com.mvc.homeseek.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mvc.homeseek.auth.SNSLogin;
import com.mvc.homeseek.auth.SnsValue;
import com.mvc.homeseek.model.biz.MemberBiz;
import com.mvc.homeseek.model.dto.MemberDto;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
public class MemberController {

	private Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	private SnsValue naverSns;
	
	@Inject
	private SnsValue googleSns;
	
	@Inject
	private GoogleConnectionFactory googleConnectionFactory;
	
	@Inject
	private OAuth2Parameters googleOAuth2Parameters;

	@Autowired
	private MemberBiz memberBiz;

	@RequestMapping("loginform.do")
	public String loginForm(Model model) {
		logger.info("login.do");
		SNSLogin snsLogin = new SNSLogin(naverSns);
		model.addAttribute("naver_url", snsLogin.getNaverAuthURL());
		
//		SNSLogin googleLogin = new SNSLogin(googleSns);
//		model.addAttribute("google_url", googleLogin.getGoogleAuthURL());
		
		/* 구글code 발행을 위한 URL 생성 */
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
		model.addAttribute("google_url", url);
		
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
	
	/*
	 * @RequestMapping(value = "/snslogin.do", method = RequestMethod.GET) public
	 * void snslogin(Model model) throws Exception{ logger.info("snslogin.do");
	 * 
	 * }
	 */
	
	@RequestMapping(value = "/homeseek/auth/{snsService}/callback",
			method = { RequestMethod.GET, RequestMethod.POST})
	public String snsLoginCallback(@PathVariable String snsService,
			Model model, @RequestParam String code, HttpSession session) throws Exception {
		
		logger.info("snsLoginCallback: service={}", snsService);
		SnsValue sns = null; 
		if (StringUtils.equals("naver", snsService))
			sns = naverSns;
		else
			sns = googleSns;
		
		// 1. code를 이용해서 access_token 받기
		// 2. access_token을 이용해서 사용자 profile 정보 가져오기
		SNSLogin snsLogin = new SNSLogin(sns);
		MemberDto snsUser = snsLogin.getUserProfile(code);
		System.out.println("Profile>>" + snsUser);
		
		
		// 3. DB 해당유저가 존재하는지 체크 (googleid, naverid 컬럼 추가)
		MemberDto user = memberBiz.getBySns(snsUser);
		if(user ==null) {
			model.addAttribute("result", "존재하지 않는 사용자입니다. 가입해 주세요.");
			
			//미존재시 가입 페이지로!!
			
			
		}else {
			model.addAttribute("result", user.getMember_name() +"님 반갑습니다.");
		
			// 4. 존재시 강제로그인, 미존재시 가입페이지로!!
			session.setAttribute("member_id",user);
		}

		return "loginResult";
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
	public String registRes(String member_id, @RequestParam("email") String email, MemberDto dto) {
		logger.info("registres.do");
		
		String memberId = member_id + "@" + email;//이메일 형식
		dto.setMember_id(memberId);
		
		System.out.println(email + "*****!!!!!!!^^^#%$#$%$%&^&^&%#$%^#$@$#%");
		
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