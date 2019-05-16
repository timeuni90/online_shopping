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
import com.timeuni.bean.Seller;
import com.timeuni.dao.SellerMapper;
import com.timeuni.mybean.ReceiveMessage;
import com.timeuni.mybean.SendMessage;
import com.timeuni.resourcebundle.ResourceLocation;

public class SellerWebSocketController implements WebSocketHandler {
	public static final Map<String, WebSocketSession> map = new HashMap<String, WebSocketSession>();
	@Autowired
	private SellerMapper sellerMapper;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		map.put(((Integer)session.getHandshakeAttributes().get("sellerId")).toString(), session);
	}

	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		 ObjectMapper objectMapper = new ObjectMapper();
	     ReceiveMessage receiveMessage = objectMapper.readValue(message.getPayload().toString(), ReceiveMessage.class);
	     /* 封装发送消息 */
	     SendMessage sendMessage = new SendMessage();
	     sendMessage.setFromId(receiveMessage.getToId());
	     sendMessage.setMessage(receiveMessage.getMessage());
	     sendMessage.setTime(new Date());
	     Seller seller = sellerMapper.selectByPrimaryKey((Integer) session.getHandshakeAttributes().get("sellerId"));
	     sendMessage.setName(seller.getStoreName());
	     sendMessage.setImage(new ResourceLocation().getStoreLogoLocation() + seller.getStoreCover());
	     Map<String, Object> map = new HashMap<String, Object>();
	     map.put("messager", sendMessage);
	     map.put("isFromSelf", false);
	     /* 给普通用户发消息 */
	     WebSocketSession userSession = UserWebSocketController.map.get(receiveMessage.getToId());
	     TextMessage textMessage = new TextMessage(objectMapper.writeValueAsString(map), true);
	     userSession.sendMessage(textMessage);
	     /* 给商家发消息 */
	     map.put("isFromSelf", true);
	     textMessage = new TextMessage(objectMapper.writeValueAsString(map), true);
	     session.sendMessage(textMessage);
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
