package com.sp.app.chat;

import java.io.IOException;
import java.util.Calendar;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

/*
 - type : client -> server
   connect : 처음 접속한 경우 - uid, nickName
   message : 채팅 메시지 전송 - chatMsg
   whisper : 귓속말 - receiver, chatMsg
   
 - type : server -> client
   userList : 처음 접속한 경우 점속한 사용자 리스트 전송 - users
   userConnect : 다른 접속 사용자에게 지금 접속한 유저 전송 - uid, nickName
   message : 채팅 메시지 - uid, nickName, chatMag
   whisper : 귓속말 - uid, nickMsg, chatMsg
   userDisconnect : 접속한 사용자에게 접속 해제한 유저 전송 - uid, nickName
 */

public class MySocketHandler extends TextWebSocketHandler {
	private final Logger logger = LoggerFactory.getLogger(MySocketHandler.class);

	private Map<String, User> sessionMap = new Hashtable<>();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		super.afterConnectionEstablished(session);
		// WebSocket 연결이 열리고 사용이 준비될 때 호출
	}

	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		super.handleMessage(session, message);

		// 클라이언트로부터 메시지가 도착했을 때 호출
		JSONObject jsonReceive = null;
		try {
			jsonReceive = new JSONObject(message.getPayload().toString());
		} catch (Exception e) {
			// logger.error(e.toString()); // 일정시간 메시지 송수신이 없으면 계속 에러 메시지가 출력
			return;
		}
		// System.out.println(jsonReceive.toString());
		
		String type = jsonReceive.getString("type");
		if (type == null || type.equals("")) {
			return;
		}

		if (type.equals("connect")) { // 처음 접속한 경우
			// 접속한 사용자의 아이디를 키로 session과 유저 정보를 저장
			String uid = jsonReceive.getString("uid");
			String nickName = jsonReceive.getString("nickName");

			User user = new User();
			user.setUid(uid);
			user.setNickName(nickName);
			user.setSession(session);

			sessionMap.put(uid, user);

			// 처음 접속 사용자에게 현재 접속 중인 다른 유저를 전송
			Iterator<String> it = sessionMap.keySet().iterator();
			
			JSONArray arrUsers = new JSONArray();
			while (it.hasNext()) {
				String key = it.next();

				if ( uid.equals(key) ) { // 자기 자신
					continue;
				}
				
				User vo = sessionMap.get(key);

				JSONArray arr = new JSONArray();
				arr.put(vo.getUid());
				arr.put(vo.getNickName());
				arrUsers.put(arr);
			}
			
			JSONObject jsonUsers = new JSONObject();
			jsonUsers.put("type", "userList");
			jsonUsers.put("users", arrUsers);
			
			sendTextMessageToOne(jsonUsers.toString(), session);

			// 다른 클라이언트에게 접속 사실을 알림
			JSONObject ob = new JSONObject();
			ob.put("type", "userConnect");
			ob.put("uid", uid);
			ob.put("nickName", nickName);

			sendTextMessageToAll(ob.toString(), uid);

		} else if (type.equals("message")) { // 채팅 문자열을 전송 한 경우
			User vo = getUser(session);
			String msg = jsonReceive.getString("chatMsg");

			JSONObject ob = new JSONObject();
			ob.put("type", "message");
			ob.put("chatMsg", msg);
			ob.put("uid", vo.getUid());
			ob.put("nickName", vo.getNickName());

			// 다른 사용자에게 전송하기
			sendTextMessageToAll(ob.toString(), vo.getUid());
			
		} else if (type.equals("whisper")) { // 위스퍼을 전송 한 경우
			User user = getUser(session);

			String msg = jsonReceive.getString("chatMsg");
			String receiver = jsonReceive.getString("receiver");

			User receiverVo = sessionMap.get(receiver);
			if (receiverVo == null) {
				return;
			}

			JSONObject ob = new JSONObject();
			ob.put("type", "whisper");
			ob.put("chatMsg", msg);
			ob.put("uid", user.getUid());
			ob.put("nickName", user.getNickName());

			// 귓속말 대상자에게 메시지 보내기
			sendTextMessageToOne(ob.toString(), receiverVo.getSession());
		}
	}

	/*
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String msg=message.getPayload();
	}
	*/

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		super.afterConnectionClosed(session, status);

		// WebSocket 연결이 닫혔을 때 호출
		String uid = removeUser(session);

		logger.info("remove session : " + uid);
	}
	
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		// this.logger.error("web socket error!", exception);
		removeUser(session);
	}

	// 모든 사용자에게 메시지 전송
	/**
	 * @param message	전송할 메시지
	 * @param exclude	제외할 유저
	 */
	protected void sendTextMessageToAll(String message, String exclude) {
		Iterator<String> it = sessionMap.keySet().iterator();
		while (it.hasNext()) {
			String key = it.next();
			if (exclude != null && exclude.equals(key))  { // 자기 자신
				continue;
			}

			User user = sessionMap.get(key);
			WebSocketSession session = user.getSession();

			try {
				if (session.isOpen()) {
					session.sendMessage(new TextMessage(message));
				}
			} catch (IOException e) {
				removeUser(session);
			}
		}
	}

	// 특정 사용자에게 메시지 전송
	protected void sendTextMessageToOne(String message, WebSocketSession session) {
		if (session.isOpen()) {
			try {
				session.sendMessage(new TextMessage(message));
			} catch (Exception e) {
				logger.error("fail to send message!", e);
			}
		}
	}

	// session 에 대한 접속 유저 정보를 반환하는 메소드
	protected User getUser(WebSocketSession session) {
		Iterator<String> it = sessionMap.keySet().iterator();

		while (it.hasNext()) {
			String key = it.next();

			User dto = sessionMap.get(key);
			if (dto.getSession() == session) {
				return dto;
			}
		}

		return null;
	}

	// 유저가 채팅 방을 나간 경우 호출하는 메소드
	protected String removeUser(WebSocketSession session) {
		User user = getUser(session);

		if (user == null) {
			return null;
		}

		// 다른 클라이언트에게 접속 해제 사실을 알림
		JSONObject job = new JSONObject();
		job.put("type", "userDisconnect");
		job.put("uid", user.getUid());
		job.put("nickName", user.getNickName());
		sendTextMessageToAll(job.toString(), user.getUid());

		try {
			user.getSession().close();
		} catch (Exception e) {
		}
		sessionMap.remove(user.getUid());

		return user.getUid();
	}

	// 1분 마다 클라이언트에게 시간 전송(초 분 시 일 월 주 [년도]) 
	@Scheduled(cron="0 0/1 * * * *")
	public void schedule() {
		Calendar cal = Calendar.getInstance();
		
		int h = cal.get(Calendar.HOUR_OF_DAY);
		// Calendar.HOUR 는 12시를 0으로 반환
		int m = cal.get(Calendar.MINUTE);
		int s = cal.get(Calendar.SECOND);

		JSONObject job = new JSONObject();
		job.put("type", "time");
		job.put("hour", h);
		job.put("minute", m);
		job.put("second", s);

		sendTextMessageToAll(job.toString(), null);
	}
}
