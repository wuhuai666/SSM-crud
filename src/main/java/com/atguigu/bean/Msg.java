package com.atguigu.bean;

import java.util.HashMap;
import java.util.Map;

/**
 * @author 吴淮
 * @program SSM-crud
 * @description 作为json字符串的形式告知浏览器处理信息
 * @create 2021-08-16 16:11
 **/
public class Msg {
    /**
     *  告知浏览器状态码,1表示成功,0表示失败
     */
    private int code;
    /**
     * 告知信息
     */
    private  String  msg;
    /**
     * 存储要向浏览器展示的信息
     */
    private Map<String,Object> map=new HashMap<String, Object>();

    /**
     * 返回处理的信息,成功或者失败
     * @return 消息对象
     */
    public static  Msg success(){
        Msg msg = new Msg();
        msg.setCode(1);
        msg.setMsg("操作成功");
        return msg;
    }

    public static Msg fail() {
        Msg msg = new Msg();
        msg.setCode(0);
        msg.setMsg("操作失败");
        return msg;
    }

    /**
     * 存储用户想要看到的数据
     * @return msg对象
     */
    public Msg add(String key,Object value){
      this.getMap().put(key,value);
      return this;
    }
    public Msg() {
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getMap() {
        return map;
    }

    public void setMap(Map<String, Object> map) {
        this.map = map;
    }

    @Override
    public String toString() {
        return "Msg{" +
                "code='" + code + '\'' +
                ", msg='" + msg + '\'' +
                ", map=" + map +
                '}';
    }
}
