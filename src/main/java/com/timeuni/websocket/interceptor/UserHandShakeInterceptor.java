package com.timeuni.websocket.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

public class UserHandShakeInterceptor extends HttpSessionHandshakeInterceptor {
	// 握手前
    @Override
    public boolean beforeHandshake(ServerHttpRequest request,
            ServerHttpResponse response, WebSocketHandler wsHandler,
            Map<String, Object> attributes) throws Exception {
    	HttpServletRequest servletRequest = ((ServletServerHttpRequest) request).getServletRequest();
    	String parameter = servletRequest.getParameter("id");
    	attributes.put("id", parameter);
        return super.beforeHandshake(request, response, wsHandler, attributes);
    }
}
