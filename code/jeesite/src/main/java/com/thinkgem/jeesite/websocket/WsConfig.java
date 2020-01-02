package com.thinkgem.jeesite.websocket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

@Configuration
@EnableWebSocket
public class WsConfig implements WebSocketConfigurer {
    @Autowired
    private WsHandshakeInterceptor wsHandshakeInterceptor;
    @Autowired
    private WsPictureHandler wsPictureHandler;

    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        registry.addHandler(wsHandler(), "/wsHandler") //注册 handler,这里的 url 要与页面的 url 一致
                .setAllowedOrigins("*") // 允许请求的域名
                .addInterceptors(wsHandshakeInterceptor);  //添加握手拦截
        //旧版浏览器可能不支持 websocket，通过 sockjs 模拟 websocket 的行为，所以下面要配 sockjs 支持。
        registry.addHandler(wsHandler(), "/sockjs").setAllowedOrigins("*")
                .addInterceptors(wsHandshakeInterceptor).withSockJS();


        registry.addHandler(wsPictureHandler, "/WsPictureHandler") //注册 handler,这里的 url 要与页面的 url 一致
                .setAllowedOrigins("*") // 允许请求的域名
                .addInterceptors(wsHandshakeInterceptor);  //添加握手拦截
        //旧版浏览器可能不支持 websocket，通过 sockjs 模拟 websocket 的行为，所以下面要配 sockjs 支持。
        registry.addHandler(wsHandler(), "/sockjs").setAllowedOrigins("*")
                .addInterceptors(wsHandshakeInterceptor).withSockJS();
    }

    @Bean
    public WebSocketHandler wsHandler() {
        return new WsHandler();
    }

}