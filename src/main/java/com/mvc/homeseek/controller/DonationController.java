package com.mvc.homeseek.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.mvc.homeseek.model.biz.DonationBiz;
import com.mvc.homeseek.model.dto.DonationDto;
import com.mvc.homeseek.model.dto.MemberDto;

@Controller
public class DonationController {
	
	private Logger logger = LoggerFactory.getLogger(DonationController.class);
	
	@Autowired
	private DonationBiz biz;
	
	@RequestMapping("donateform.do")
	public String donateForm() {
		

		return "donation";
	}

	//후원완료후 
	@RequestMapping(value= "donateres.do", method=RequestMethod.POST )
	public void getResult(HttpServletRequest request, HttpServletResponse response, HttpSession session, DonationDto dto) {
		
		MemberDto memberDto = (MemberDto) session.getAttribute("login");
		String member_id = memberDto.getMember_id();
		
		// mainpay.js에서 보낸 obj(JSON문자열)를 받아서 string 변수에 담음
	    String obj = request.getParameter("obj");
	    System.out.println(obj);

	    JsonParser parser = new JsonParser();
	    
	    JsonElement element = parser.parse(obj);

	    // JSON element 값을 JSON object 형태로 바꿔서 꺼냄
	    JsonObject tmp = element.getAsJsonObject();

	    // json 형태인 {"key":"value"}에서 key("price", "pruchased_at")를 호출한 뒤 변수에 담아줌
	    int pay_amount = tmp.get("price").getAsInt();
	    String pay_date2 = tmp.get("purchased_at").getAsString();
	    System.out.println(pay_amount + pay_date2);

	    // String형태의 dano_date2라는 변수를 Date로 형변환
	    SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    Date pay_date = null;
	    try {
		pay_date = (Date) transFormat.parse(pay_date2);
	    } catch (ParseException e) {
		e.printStackTrace();
	    }

	    // dto에 세팅
	    //DonationDto dto = new DonationDto();
	    dto.setDona_bill(pay_amount);
	    dto.setDona_date(pay_date);
	    dto.setDona_id(member_id);

	    // db에 넣기
	    int res = biz.donationInsert(dto);

	    // db에 있는 값 꺼내서 후원내역 테이블에서 보여주려면
	    // db에 저장된 값(dona_db>0)을 mainpay.js의 msg에 응답 시키기
	    // 아래 코드를 통해서 다시 mainpay.js ajax의 success로 돌아감
	    try {
			response.getWriter().print(res);
		} catch (IOException e) {
			logger.info("[ERROR]");
			e.printStackTrace();
		}
		
		//return "index";
	}
	
	
	
	
	
	
	
	@RequestMapping()
	public String donateRes(@RequestBody DonationDto donaDto,HttpServletRequest request, HttpSession session) {
		
		MemberDto memberDto = (MemberDto) session.getAttribute("login");
		String user = memberDto.getMember_id();
		
		String obj = request.getParameter("obj");
		
		ObjectMapper objm = new ObjectMapper();
		
		
		return "donateRes";
	}

}











