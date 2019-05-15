package com.timeuni.websocket.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.timeuni.bean.User;
import com.timeuni.dao.UserMapper;
import com.timeuni.mybean.ReceiveMessage;
import com.timeuni.mybean.SendMessage;
import com.timeuni.resourcebundle.ResourceLocation;

public class UserWebSocketController implements WebSocketHandler {
	public static final Map<String, WebSocketSession> map = new HashMap<String, WebSocketSession>();
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		map.put((String) session.getHandshakeAttributes().get("id"), session);
	}
	
	/* 处理收到的消息 */
	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		 ObjectMapper objectMapper = new ObjectMapper();
	     ReceiveMessage receiveMessage = objectMapper.readValue(message.getPayload().toString(), ReceiveMessage.class);
	     SendMessage sendMessage = new SendMessage();
	     sendMessage.setFromId((String) session.getHandshakeAttributes().get("id"));
	     sendMessage.setMessage(receiveMessage.getMessage());
	     sendMessage.setTime(new Date());
	     User user = userMapper.selectByPrimaryKey((Integer)session.getHandshakeAttributes().get("userId"));
	     sendMessage.setName(user.getName());
	     sendMessage.setImage(new ResourceLocation().getUserImageLocation() + user.getProfilePhoto());
	     WebSocketSession sellerSession = SellerWebSocketController.map.get(receiveMessage.getToId());
	     TextMessage textMessage = new TextMessage(objectMapper.writeValueAsString(sendMessage), true);
	     sellerSession.sendMessage(textMessage);
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus closeStatus) throws Exception {
		map.remove((String) session.getHandshakeAttributes().get("id"));
	}

	@Override
	public boolean supportsPartialMessages() {
		return false;
	}
	
}
