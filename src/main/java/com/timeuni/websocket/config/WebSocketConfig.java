package com.timeuni.websocket.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

import com.timeuni.websocket.controller.SellerWebSocketController;
import com.timeuni.websocket.controller.UserWebSocketController;
import com.timeuni.websocket.interceptor.SellerHandShakeInterceptor;
import com.timeuni.websocket.interceptor.UserHandShakeInterceptor;

@Configuration
@EnableWebMvc
@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer {

	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(userWebSocketController(), "/userwebsocket").addInterceptors(new UserHandShakeInterceptor());
		registry.addHandler(sellerWebSocketController(), "/sellerwebsocket").addInterceptors(new SellerHandShakeInterceptor());
	}
	
	@Bean
    public WebSocketHandler userWebSocketController() {
        return new UserWebSocketController();
    }
	
	@Bean
	public WebSocketHandler sellerWebSocketController() {
		return new SellerWebSocketController();
	}
}
