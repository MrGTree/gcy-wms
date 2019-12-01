package com.thinkgem.jeesite.websocket;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

import static com.thinkgem.jeesite.common.config.Global.MESSAGE_TYPE_2;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.video.javacv.Entity.MessageSend;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class WsHandler extends TextWebSocketHandler {

    private Logger logger = LoggerFactory.getLogger(getClass());


    private final static List<WebSocketSession> users;

    static {
        users = new CopyOnWriteArrayList<WebSocketSession>();
    }

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        //建立连接后的操作
        users.add(session);
        logger.info("some one use websocket {}" , session);
        Date date = new Date();
        MessageSend messageSend = new MessageSend();
        messageSend.setCurrentTime(DateUtils.formatDateTime(date));
        messageSend.setMessageType(MESSAGE_TYPE_2);
        HashMap<String, String> messageMap = new HashMap<>();
        messageMap.put("closeValue",String.valueOf(Global.getTooCloseValue()));
        messageSend.setMessageValue(messageMap);
        TextMessage textMessage = new TextMessage(JsonMapper.getInstance().toJson(messageSend));
        session.sendMessage(textMessage);
        super.afterConnectionEstablished(session);
    }

    @Override
    public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
        //收到消息后的操作
        logger.error("{}send message -->{}" ,session,message);
        super.handleMessage(session, message);
    }

    @Override
    public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
        users.remove(session);
        //连接出错后的操作
        super.handleTransportError(session, exception);
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus closeStatus) throws Exception {
        //连接关闭后的操作
        users.remove(session);
        super.afterConnectionClosed(session, closeStatus);
    }

    /**
     * 给所有在线用户发送消息
     *
     * @param message
     */
    public void sendMessageToUsers(TextMessage message) {
        for (WebSocketSession user : users) {
            try {
                if (user.isOpen()) {
                    user.sendMessage(message);
                }
            } catch (IOException e) {
                logger.error("send message error",e);
            }
        }

    }

}