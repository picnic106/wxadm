package com.yaolan.wxacm.core.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by Yaolan on 2015/8/13.
 */
public class StringUtils {
    public static String getXmlByPattern(String xml,String name){
        xml=xml.toLowerCase();
        Pattern pattern2=Pattern.compile("<"+name+">(.*?)</"+name+">");
        Matcher matcher2=pattern2.matcher(xml);
        String data1=null;
        while(matcher2.find()){
             data1=matcher2.group(1);
        }

        return data1;
    }


    public static void main(String[] args){
        String xml="<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n" +
                "<root><pic><id>49106893</id><url>http://pic.service.yaolan.com/32/20150813/96/1439459549024_1_[model].jpg</url><message>添加图片成功！</message></pic></root>\n";
        System.out.println(StringUtils.getXmlByPattern(xml,"url"));
    }
}
