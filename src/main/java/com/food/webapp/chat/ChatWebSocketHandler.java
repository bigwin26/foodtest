package com.food.webapp.chat;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class ChatWebSocketHandler extends TextWebSocketHandler {
	private Map<String, WebSocketSession> users = new HashMap<String, WebSocketSession>();

	@Override
	public void afterConnectionEstablished(
			WebSocketSession session) throws Exception {
		log(session.getId() + " ���� ��");
		users.put(session.getId(), session);
		log("1:" + users.values());
	}
	@Override
	public void afterConnectionClosed(
			WebSocketSession session, CloseStatus status) throws Exception {
		log(session.getId() + " ���� �����");
		users.remove(session.getId());
	}
	@Override
	protected void handleTextMessage(
			WebSocketSession session, TextMessage message) throws Exception {
		log(session.getId() + "�κ��� �޽��� ����: " + message.getPayload());
		TextMessage msg = new TextMessage( message.getPayload().substring(4));
		
		for (WebSocketSession s : users.values()) {
			s.sendMessage(msg);
			log(s.getId() + "�� �޽��� �߼�: " + message.getPayload());
		}
	}
	@Override
	public void handleTransportError(
			WebSocketSession session, Throwable exception) throws Exception {
		log(session.getId() + " �ͼ��� �߻�: " + exception.getMessage());
	}

	private void log(String logmsg) {
		System.out.println(logmsg);
	}

}
