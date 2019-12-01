package com.thinkgem.jeesite.video.javacv.Entity;

public class MessageSend {

    private String messageType;

    private Object messageValue;

    private String currentTime;

    public String getMessageType() {
        return messageType;
    }

    public void setMessageType(String messageType) {
        this.messageType = messageType;
    }

    public Object getMessageValue() {
        return messageValue;
    }

    public void setMessageValue(Object messageValue) {
        this.messageValue = messageValue;
    }

    public String getCurrentTime() {
        return currentTime;
    }

    public void setCurrentTime(String currentTime) {
        this.currentTime = currentTime;
    }
}
