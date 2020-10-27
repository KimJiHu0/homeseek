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

import com.mvc.homeseek.auth.KakaoAPI;
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

	@Autowired
	private KakaoAPI kakao;

	private final static String id = "2dc56fd515158890d47575ddc651d7e8";
	private final static String url = "http://localhost:8787/homeseek/auth/kakao/callback.do";

	@RequestMapping("loginform.do")
	public String loginForm(Model model) {
		logger.info("login.do");
		
		// 네이버 로그인 URL받기
		SNSLogin snsLogin = new SNSLogin(naverSns);
		model.addAttribute("naver_url", snsLogin.getNaverAuthURL());
		
		// 카카오 로그인 URL받기
		String kakaoUrl = "https://kauth.kakao.com/oauth/authorize?" + "client_id=" + id + "&redirect_uri=" + url
				+ "&response_type=code";
		model.addAttribute("kakao_url", kakaoUrl);

		// 구글code발행을 위한 URL 생성 
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

	@RequestMapping(value = "auth/{snsService}/callback.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String snsLoginCallback(@PathVariable String snsService, Model model, MemberDto dto, @RequestParam String code,
			HttpSession session, HttpServletRequest request) throws Exception {
		
		
		logger.info("snsLoginCallback: service={}", snsService);
		SnsValue sns = null;
		if (StringUtils.equals("naver", snsService)) {
			System.out.println("★naver★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
			sns = naverSns;
		} else {
			sns = googleSns;
		}


		// 1. code를 이용해서 access_token 받기
		// 2. access_token을 이용해서 사용자 profile 정보 가져오기
		SNSLogin snsLogin = new SNSLogin(sns);
		MemberDto snsUser = snsLogin.getUserProfile(code);
		System.out.println("Profile>>" + snsUser);
		
		System.out.println("확인용!!!!"+ snsUser.getMember_naverid());
		// 3. DB 해당유저가 존재하는지 체크 (googleid, naverid  추가해야함 !!! 그래야 select해볼수있음!)
		MemberDto usertest = memberBiz.getBySns(snsUser);
		
		System.out.println(snsUser.getMember_id());
		

		if (usertest == null) {  // 존재하지 않을시, 회원가입 시켜야됨 -> 가입페이지로
			
			System.out.println("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
			model.addAttribute("naveremail", snsUser.getMember_id());
			
			return "regist";
			
		} else { // 존재시, 세션주고 로그인 시켜줌 -> main페이지
			
			model.addAttribute("result" ,"기존에 가입한 회원 . 로그인시켜도됨 ");

			session.setAttribute("login", usertest);
			
			return "redirect:/main.do";
		}
	}
	

	@RequestMapping(value = "auth/kakao/callback.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(@RequestParam("code") String code, HttpSession session, Model model, MemberDto dto) {
		System.out.println("★★★KAKAO★★★★★★★★★★KAKAO★★★★★KAKAO★★★★★★★★★★KAKAO★★★★★★★★★★★★★★");
		String access_Token = kakao.getAccessToken(code);
		MemberDto snsUser = kakao.getUserInfo(access_Token);
		System.out.println("login Controller : " + snsUser);
		
		MemberDto usertest = memberBiz.getBySns(snsUser);

		// 클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
//		if (userInfo.get("kakaoemail") != null) {
		if (usertest == null) {
			session.setAttribute("kakaoemail", snsUser.getMember_id());
			session.setAttribute("access_Token", access_Token);
			System.out.println("★★★KAKAO★★★★★★★★★★KAKAO★★★★★KAKAO★★★★★★★★★★KAKAO★★★★★★★★★★★★★★");
			model.addAttribute("nickname", snsUser.getMember_kakaoid());
			model.addAttribute("kakaoemail", snsUser.getMember_id());

			return "regist";
		} else {

			//session.setAttribute("login", snsUser.getMember_kakaoid());
			session.setAttribute("login", usertest);
			return "redirect:/main.do";
		}
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

		String memberId = member_id + "@" + email;// 이메일 형식
		dto.setMember_id(memberId);

		System.out.println(email + "*****!!!!!!!^^^#%$#$%$%&^&^&%#$%^#$@$#%");

		if (memberBiz.insert(dto) > 0) {
			return "redirect:/main.do";
		}

		return "redirect:registform.do";

	}
	
	@RequestMapping("auth/naver/registres.do")
	public String naverRegistRes(String member_id, MemberDto dto) {
		logger.info("auth/naver/registres.do");

		
		if (memberBiz.insert(dto) > 0) {
			return "redirect:/main.do";
		}

		return "redirect:registform.do";

	}
	
	@RequestMapping("auth/kakao/registres.do")
	public String kakaoRegistRes(String member_id, MemberDto dto) {
		logger.info("auth/kakao/registres.do");

		
		if (memberBiz.insert(dto) > 0) {
			return "redirect:/main.do";
		}

		return "redirect:registform.do";

	}

	@ResponseBody
	@RequestMapping(value = "/checkid.do", method = RequestMethod.POST)
	public String chkId(@RequestParam("member_id") String member_id) {
		logger.info("checkid.do");
		String str = "";
		int res = memberBiz.checkId(member_id);
		if (res == 1) { // 이미 존재하는 계정
			str = "NO";
		} else { // 사용 가능한 계정
			str = "YES";
		}
		return str;

	}
	
	@ResponseBody
	@RequestMapping(value = "/checkphone.do", method = RequestMethod.POST)
	public String chkPhone(@RequestParam("member_phone") String member_phone,@RequestParam("member_name") String member_name) {
		
		logger.info("checkphone.do");
		
		MemberDto dto = new MemberDto(member_name,member_phone);

		String str = "";
		int res = memberBiz.checkPhone(dto);
		if (res >= 1) { // 이미 존재하는 번호
			str = "NO";
		} else { // 사용 가능한 번호
			str = "YES";
		}
		return str;

	}
	
	@RequestMapping("findidform.do")
	public String findIdForm() {
		logger.info("findidform.do");

		return "findId";
	}
	
	@ResponseBody
	@RequestMapping(value = "/findid.do", method = RequestMethod.POST)
	public String findId(@RequestParam("id_phone") String id_phone,@RequestParam("id_name") String id_name) {
		logger.info("findid.do");
		MemberDto memberdto = new MemberDto(id_name,id_phone);
		String str = "";
		int res = memberBiz.findId(memberdto);
		if (res == 1) { // 존재하는 계정
			str = "NO";
		} else { // 존재하지않는 계정
			str = "YES";
		}
		return str;

	}
	
	@ResponseBody
	@RequestMapping(value = "/selectid.do", method = RequestMethod.POST)
	public String selectId(@RequestParam("id_phone") String id_phone, @RequestParam("id_name") String id_name) {
		logger.info("selectid.do");
		MemberDto memberdto = new MemberDto(id_name,id_phone);
		String str = "";
		String res = memberBiz.selectId(memberdto);
		if (res == null) { // 존재하는 계정
			str = "NO";
		} else { // 존재하지않는 계정
			str = memberBiz.selectId(memberdto);
		}
		return str;

	}


	@RequestMapping(value = "/sendsms.do", method = RequestMethod.POST)
	@ResponseBody
	public String sendSMS(@RequestParam("phoneNumber") String phoneNumber) {

		Random rand = new Random();
		String numStr = "";
		for (int i = 0; i < 4; i++) {
			String ran = Integer.toString(rand.nextInt(10));
			numStr += ran;
		}

		System.out.println("수신자 번호 : " + phoneNumber);
		System.out.println("인증번호 : " + numStr);
		String api_key = "NCS2ZUPG3LMOQ0H3";
		String api_secret = "JA50IZAE97G9MEQQ1BJVUBTOUIMLWHYZ";
		Message coolsms = new Message(api_key, api_secret);

		// 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", phoneNumber); // 수신전화번호
		params.put("from", "01099731489"); // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
		params.put("type", "SMS");
		params.put("text", " homeseek 회원가입  인증번호는 " + "[" + numStr + "]" + "입니다.");
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