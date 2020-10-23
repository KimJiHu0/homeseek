package com.mvc.homeseek.controller;


import java.text.SimpleDateFormat;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.homeseek.filevalidator.RoomInsertFileVali;
import com.mvc.homeseek.model.biz.RoomBiz;
import com.mvc.homeseek.model.biz.RoomListBiz;
import com.mvc.homeseek.model.dto.MemberDto;
import com.mvc.homeseek.model.dto.RoomDto;

@Controller
public class RoomController {

	private Logger logger = LoggerFactory.getLogger(RoomController.class);

	@Autowired
	private RoomBiz roomBiz;

	@Autowired
	private RoomInsertFileVali validator;

	@Autowired
	private RoomListBiz roomListBiz;

	@RequestMapping("insertroom.do")
	public String selectRoomInsertForm(RoomDto room_dto, Model model, HttpSession session) {

		logger.info("[insert.do] jsp로이동");

		MemberDto dto = (MemberDto) (session.getAttribute("login"));
		logger.info("----------------------------------");
		logger.info("| " + dto.getMember_id() + " 사용자가 매물 올리는 중 |");
		logger.info("----------------------------------");
		return "roomInsert";
	}

	@RequestMapping("insertres.do")
	public String selectRoomInsert(RoomDto room_dto, Model model) {
		logger.info("[inertres.do] : 매물 올리기 제출중");

		// <input type="date"/> 의 value값의 타입은 String 타입이에요.
		// 그리고 값은 2020-10-24 식으로 현재 이 컨트롤러로 들어오게 되고, RoomDto에서 cpdate와 avdate를 String 타입으로 선언이 되었기 때문에 파라미터로 RoomDto room_dto로
		// 선언을 해도 잘 넘어와요.
		
		// 그럼 현재 room_dto에 담겨져있는 cpdate는 '2020-10-24'로 담겨져있고, 
		// avdate는 '2020-10-24' 형태이고 둘 다 String 타입이에요.
		
		// 아래의 명령문들은 작성하지 않으셔도 돼요!! 어차피 원하는 값의 형태이기 때문이에요.
		String prv_room_cpdate = room_dto.getRoom_cpdate().substring(0,10);
		String prv_room_avdate = room_dto.getRoom_avdate().substring(0,10); 
		logger.info(prv_room_cpdate); 
		logger.info(prv_room_avdate);
		
		// 컨트롤러에서 -를 /으로 바꾸게되면 '2020/10/24'로 update되게 되겠죠??
		// 근데 db에서는 String타입을 Date타입으로 변환해주는게
		// TO_DATE()라는 것이고, 괄호 안에는 TO_DATE('문자열', '변환하고싶은날짜데이터형태')를 넣을 수 있어요
		// 태현씨가 문자열에 넣을 값은 '2020/10/24'가 아니라 '20201024'입니다.(실제 mapper에서는 #{room_cpdate}로 넣어주셔야해요!)
		// 그럼 아래의 명령어또한 의미가 없어요!
		String new_room_avdate = prv_room_avdate.replaceAll("-", "/"); 
		String new_room_cpdate = prv_room_cpdate.replaceAll("-", "/");
		
		logger.info(new_room_avdate);
		logger.info(new_room_cpdate);
		
		
		// 이제 '2020-10-24' 형태로 넘어온 값을 '20201024'형태로 변환하는 방법은 두가지가 있어요.
		
		// 1. format을 해준다.
		// 아래와같이 작성을 해주게되면 yyyy-MM-dd 형태로 변환해주는 SimpleDatFormat객체를 format이라는 이름으로 선언만 해준거에요.
		// 하지만 저희는 yyyyMMdd 형태를 원합니다.(위에 code67번째줄에서 설명했습니다.)
		// 제가 변환할 형태를 yyyy-MM-dd밖에 안해봤는데 yyyyMMdd는 안해봐서 모르겠어요. 한번 해보시고 되시면 이렇게 써도 될 것 같아요.
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		// String 변수명 = format.(변환할값); 형태로 쓰면 돼요.
		// 예) String room_cpdate = format.format(dto.getRoom_cpdate);
		// 위처럼 진행을 하면 room_cpdate에 원하는 '20201024'형태로 값이 들어갔기 때문에
		// room.setRoom_cpdate(room_cpdate); 를 작성해주시면 dto의 setter로 넘어가서 수정이 되게 됩니다.
		// 그리고 얘를 int res = roomBiz.selectRoomInsert(room_dto);를 진행해주시면 RoomDaoImpl로 넘어가게 되겠죠??
		
		// 2. split을 해준다.
		// input type="date"의 value는 "2020-10-24"로 넘어온다구 했죠??
		// 그럼 저희는 "2020-10-24"라는 값이 필요하기 때문에 split("-")로 -를 기준으로 값을 배열에 담아주는거에요
		// String[] cpdate = dto.getRoom_cpdate().split("-"); 를 하게되면 -를 기준으로 짤린 3개의 값이 배열에 담겨요.
		// cpdate[0]는 "2020", cpdate[1]는 "10", cpdate[2]는 "24"가 들어가기 되겠죠?
		// 최종적으로 필요한건 저 세개의 값을 모두 더한거에요
		// String real_cpdatae = cpdate[0] + cpdate[1] + cpdate[2];를 해주면 real_cpdate라는 String변수에 2020,10,24가 다 더해진 값인
		// "20201024"가 구해질거에요.
		// 그리고 이를 똑같이 setter에 보내줘서 초기화해준 다음에 아래에서 selectRoomInsert를 해주게 되면 dao에서 mapper문을 실행하게되요.
		
//		room_dto.setRoom_cpdate(new_room_cpdate);
//		room_dto.setRoom_avdate(new_room_avdate);
		
		
		int res = roomBiz.selectRoomInsert(room_dto);

		if (res > 0) {
			logger.info("입력성공");
		}

		return "roomInsertRes";
	}
	
	
	

	//------------------Summernote Image Upload-------------------------------------
	
	
	
	
	
	
	
	//-------------------------------------------------------
	

	public String selectRoomDelete(int room_no) {

		logger.info("[delete.do]");

		return "";
	}

	public String selectRoomUpdateForm(Model model, int room_no) {
		logger.info("[update.do] jsp로 이동");

		return "";
	}

	// @RequestMapping(value="/updateres.do", method=RequestMethod.POST)
	public String selectRoomUpdate(RoomDto roodDto) {
		logger.info("[updateres.do]");

		return "";

	}

}
