package com.yaolan.wxacm.core.util;

import com.yaolan.wxacm.core.spring.ConfigurerInfo;
import org.apache.log4j.Logger;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Created by Yaolan on 2015/8/14.
 */
public class ImgUtils {
    static Logger logger=Logger.getLogger(ImgUtils.class);
    public static String UpFile(byte[] file){
        Map<String,Object> map=new LinkedHashMap<String,Object>();
            map.put("file",file);
            map.put("type","ml");
            map.put("userid","1");
            String url=(String) ConfigurerInfo.getContextProperty("img.server.url");
            String xml=HttpClientUtils.doPostUploadFile(url,map);
            String imgurl= StringUtils.getXmlByPattern(xml,"url");
            logger.info("保存文件成功，文件路径"+url);
            return imgurl;

    }

    public static String getOrgImgUrl(String imgurl){
        return imgurl.replace("[model]","m");
    }

    public static String getTinyImgUrl(String imgurl){
        return imgurl.replace("[model]","l");
    }
}
