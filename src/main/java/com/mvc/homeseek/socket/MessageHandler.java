package com.mvc.homeseek.socket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.mvc.homeseek.model.dto.MemberDto;

public class MessageHandler extends TextWebSocketHandler {
	
	private Logger logger = LoggerFactory.getLogger(MessageHandler.class); 
	
	// 로그인 한 전체
	private List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();

	// 로그인 중인 개별 유저
	private Map<String, WebSocketSession> userSessionMap = new HashMap<String, WebSocketSession>();
	
	// 클라이언트가 서버로 연결 시 들어오는 메소드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		// 접속되어 있는 유저들을 담는다
		sessions.add(session);
		
		String userId = UserId(session);
		
		logger.info(" \n [ " + userId + " ] 연결됨 ");
		userSessionMap.put(userId, session);
		logger.info(" \n 유저세선스맵에 방금 로그인한애 담겼어?? : " + userSessionMap);
	}
	
	// 클라이언트가 Data 전송 시 실행되는 메소드
	// 클라이언트가 서버로 메세지를 전송했을 때 실행되는 메소드
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		// WebSocket Id = 8 << 이런식으로 뜸 내가 로그인한것만 뜨는데?
		logger.info(" \n [ 로그인 한 회원이 세션에 값이 잘 담겼니? ] : " + session.toString());
		
		// session.getId는 자꾸 숫자가 ++ 되고있는데?
		logger.info(" \n [ messageHandler ]에서 " + session.getId() + "로부터 message 받음 : " + message);
		
		
	    String msg = message.getPayload();
	    System.out.println("\n 으아악 msg첨가해! : " + msg);
	    
	    //----------위에하고 바로 끊긴거네?--------------
	    if(StringUtils.isNotEmpty(msg)) {
	    	String[] strs = msg.split(",");
	    	
	    	if(strs != null && strs.length == 3) {
	    		String cmd = strs[0];
	    		String message_senid = strs[1];
	    		String message_reid = strs[2];
	    		
	    		logger.info(" \n 여기 cmd는모야 : " + cmd);
	    		logger.info(" \n 여기 메세지 받는 사람 보낸 사람 누구야 : " + message_senid);
	    		logger.info(" \n 여기 메세지 받는 사람 받는 사람 누구야 : " + message_reid);
	    		
	    		// 작성자가 로그인해있다면
	    		WebSocketSession boardWriterSession = userSessionMap.get(message_reid);
	    		
	    		// 얘가 널인데 위에꺼 작동 안해.
	    		logger.info(" \n 작성자 지금 로그인중이냥 ? : " + boardWriterSession);
	    		
	    		//if("message".equals(cmd) && boardWriterSession != null) {
	    		//	TextMessage tmpMsg = new TextMessage(message_senid + "님이 " + message_reid + "님에게 쪽지를 보냈습니다.");
	    		//	boardWriterSession.sendMessage(tmpMsg);
	    		//}
	    	}
	    }
	}
	
	// 연결 해제될 때
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		userSessionMap.remove(session.getId());
		sessions.remove(session);
		logger.info(" \n [ " + session.getId() + " ] 연결 끊김");
		
	}
	
	// 에러 발생시
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {

		logger.info(session.getId() + " Exception 발생 : " + exception.getMessage());
		
	}
	
	// 웹소켓 id가져오기
	private String UserId(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		MemberDto loginUser = (MemberDto)httpSession.get("login");
		
		if(loginUser != null) {
			return loginUser.getMember_id();
		} else {
			return session.getId();
		}
	}
}
