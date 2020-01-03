package com.thinkgem.jeesite.websocket;

import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.utils.VideoAnalizyUtils;
import com.thinkgem.jeesite.video.javacv.ConvertVideoPakcet;
import com.thinkgem.jeesite.video.javacv.Entity.UrlMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;

@Component
public class WsPictureHandler extends TextWebSocketHandler {

    private Logger logger = LoggerFactory.getLogger(getClass());

    @Autowired
    private ThreadPoolTaskExecutor threadPoolTaskExecutor;

    private final static Map<String, List<WebSocketSession>> cameraUsers;

    private final static Map<WebSocketSession,String> sessionCamera;

    Map<String, UrlMapper> cameraNameUrlMap = SpringContextHolder.getBean("cameraNameUrlMap");

    Map<UrlMapper, ConvertVideoPakcet> convertVideoPakcetMap = SpringContextHolder.getBean("convertVideoPakcetMap");

    static {
        cameraUsers = new ConcurrentHashMap<>();
        sessionCamera = new ConcurrentHashMap<>();
    }

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        //建立连接后的操作
        super.afterConnectionEstablished(session);
    }

    @Override
    public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
        //收到消息后的操作
        logger.error("{}send message -->{}", session, message);
        if (message instanceof TextMessage) {
            String cameraName = String.valueOf(message.getPayload());
            //String cameraName = JsonMapper.getInstance().fromJson(messageStr, String.class);
            sessionCamera.put(session,cameraName);
            List<WebSocketSession> webSocketSessions = cameraUsers.get(cameraName);
            if (Objects.isNull(webSocketSessions)) {
                webSocketSessions = new CopyOnWriteArrayList<>();
                cameraUsers.put(cameraName, webSocketSessions);
            }
            webSocketSessions.add(session);

            UrlMapper urlMapper = cameraNameUrlMap.get(cameraName);
            ConvertVideoPakcet convertVideoPakcet = convertVideoPakcetMap.get(urlMapper);
            if (convertVideoPakcet != null){
                convertVideoPakcet.pictureOpen = true;
            }
        }
        super.handleMessage(session, message);
    }

    @Override
    public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
        //连接出错后的操作
        pictureThreadOpen(session);
        super.handleTransportError(session, exception);
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus closeStatus) throws Exception {
        //连接关闭后的操作
        pictureThreadOpen(session);
        super.afterConnectionClosed(session, closeStatus);
    }

    private void pictureThreadOpen(WebSocketSession session){
        String cameraName = sessionCamera.get(session);
        sessionCamera.remove(session);
        if (StringUtils.isNotEmpty(cameraName)){
            List<WebSocketSession> webSocketSessions = cameraUsers.get(cameraName);
            if (webSocketSessions != null && !webSocketSessions.isEmpty()) {
                webSocketSessions.remove(session);
            }
            if (webSocketSessions == null || webSocketSessions.isEmpty()) {
                UrlMapper urlMapper = cameraNameUrlMap.get(cameraName);
                ConvertVideoPakcet convertVideoPakcet = convertVideoPakcetMap.get(urlMapper);
                convertVideoPakcet.pictureOpen = false;
            }
        }
        if (sessionCamera.isEmpty()){
            VideoAnalizyUtils.pictureThreadOpen = false;
        }
    }

    /**
     * 给所有在线用户发送消息
     *
     * @param message
     */
    public void sendMessageToCameraUsers(TextMessage message, String cameraName) {
        List<WebSocketSession> users = cameraUsers.get(cameraName);
        for (WebSocketSession user : users) {
            try {
                if (user.isOpen()) {
                    user.sendMessage(message);
                } else {
                    users.remove(user);
                    sessionCamera.remove(user);
                }
            } catch (IOException e) {
                logger.error("send message error", e);
            }
        }

    }

}