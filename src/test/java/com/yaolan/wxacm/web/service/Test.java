package com.yaolan.wxacm.web.service;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by Yaolan on 2015/9/2.
 */
public class Test {
    public static void main(String[]args){
        Pattern pattern = Pattern.compile("http://pic([^\\]|^\\[|^>|^<]*)jpg");
        String test="[img]http://pic.service.yaolan.com/32/20150723/68/1437653694276_1_o.jpg[/img]高密的面食很有特色[img]http://pic.service.yaolan.com/32/20150723/34/1437653696034_1_o.jpg[/img][img]http://pic.service.yaolan.com/32/20150723/30/1437653697694_1_o.jpg[/img]非常不错sdfsf[img]http://pic.service.yaolan.com/32/20150723/67/1437653699395_1_o.jpg[/img][img]http://pic.service.yaolan.com/32/20150723/7/1437653700999_1_o.jpg[/img][img]http://pic.service.yaolan.com/32/20150723/87/1437653702615_1_o.jpg[/img][img]http://pic.service.yaolan.com/32/20150723/100/1437653705060_1_o.jpg[/img][img]http://pic.service.yaolan.com/32/20150723/20/1437653707156_1_o.jpg[/img]" +
                "[img]http://pic.service.yaolan.com/32/20150723/12/1437649675148_1_m.jpg[/img][img=0,1]http://pic.service.yaolan.com/32/20150723/12/1437649675148_1_m.jpg[/img][img=100,100]http://pic.service.yaolan.com/32/20150723/12/1437649675148_1_m.jpg[/img]<img src=\"http://pic.service.yaolan.com/32/20150723/12/1437649675148_1_songyj.jpg\"/>";
        Matcher matcher  = pattern.matcher(test);
        //Matcher matcher  = pattern.matcher("<img src=\"http://pic.service.yaolan.com/32/20150723/12/1437649675148_1_m.jpg\"/><img src=\"http://pic.service.yaolan.com/32/20150723/12/1437649675148_1_m.jpg\"/><img src=\"http://pic.service.yaolan.com/32/20150723/12/1437649675148_1_2.jpg\"/>");
        while(matcher.find()) {
            String mg=matcher.group()+"?t="+matcher.group().split("/")[6].split("_")[0];
            if (test.indexOf(mg)==-1){
                test=test.replace(matcher.group(),mg);
            }
        }
        System.out.println(test);
//        Pattern pattern2 = Pattern.compile("http://", Pattern.DOTALL);
//        Matcher matcher2= pattern2.matcher("<img>http://pic.service.yaolan.com/32/20150723/68/1437653694276_1_o.jpg</img>");
//        String string = matcher2.replaceAll("");
//        System.out.println(string);

    }

}
