package com.timeuni.websocket.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;

public class SellerWebSocketController implements WebSocketHandler {
	public static final Map<String, WebSocketSession> map = new HashMap<String, WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		map.put(((Integer)session.getHandshakeAttributes().get("sellerId")).toString(), session);
	}

	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus closeStatus) throws Exception {
		map.remove(((Integer)session.getHandshakeAttributes().get("sellerId")).toString());
	}

	@Override
	public boolean supportsPartialMessages() {
		return false;
	}

}
