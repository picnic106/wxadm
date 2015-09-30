package com.yaolan.wxacm.web.model;

/**
 * Created by Yaolan on 2015/8/19.
 */
public class Message {
    private String message;

    public Message(){
    }
    public Message(String message){
        this.message=message;

    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

}
