package com.mvc.homeseek.socket;

import java.util.ArrayList;
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

public class messageHandler extends TextWebSocketHandler {
	
	private Logger logger = LoggerFactory.getLogger(messageHandler.class); 
	
	// 로그인 한 전체
	private List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();

	// 로그인 중인 개별 유저
	private Map<String, WebSocketSession> userSessionMap = new ConcurrentHashMap<String, WebSocketSession>();
	
	// 클라이언트가 서버로 연결 시 들어오는 메소드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		// 접속되어 있느 ㄴ유저들을 담는다
		sessions.add(session);
		
		String userId = UserId(session);
		
		logger.info(" [ " + userId + " ] 연결됨 ");
		userSessionMap.put(userId, session);
	}
	
	// 클라이언트가 Data 전송 시 실행되는 메소드
	// 클라이언트가 서버로 메세지를 전송했을 때 실행되는 메소드
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		logger.info(" [ messageHandler ]에서 " + session.getId() + "로부터 message 받음 : " + message);
		
		
	    String msg = message.getPayload();
	    if(StringUtils.isNotEmpty(msg)) {
	    	String[] strs = msg.split(",");
	    	
	    	if(strs != null && strs.length == 4) {
	    		String cmd = strs[0];
	    		String senid = strs[1];
	    		String reid = strs[2];
	    		String messagedate = strs[3];
	    		
	    		// 작성자가 로그인해있다면
	    		WebSocketSession boardWriterSession = userSessionMap.get(reid);
	    		
	    		if("message".equals(cmd) && boardWriterSession != null) {
	    			TextMessage tmpMsg = new TextMessage(senid + "님이 " + reid + "님에게 쪽지를 보냈습니다. <br/> 일시 : " + messagedate);
	    			boardWriterSession.sendMessage(tmpMsg);
	    		}
	    	}
	    }
	}
	
	// 연결 해제될 때
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		userSessionMap.remove(session.getId());
		sessions.remove(session);
		logger.info(" [ " + session.getId() + " ] 연결 끊김");
		
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
		
		if(loginUser == null) {
			return session.getId();
		} else {
			return loginUser.getMember_email();
		}
	}
}
