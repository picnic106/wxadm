package com.yaolan.wxacm.core.util;

import com.yaolan.wxacm.core.spring.ConfigurerInfo;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.HttpMethod;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.multipart.*;
import org.apache.log4j.Logger;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;


/**
 * Created by Yaolan on 2015/8/13.
 */
public class HttpClientUtils {
    static Logger logger=Logger.getLogger(HttpClientUtils.class);



    /**
     * 执行HttpMethod对应的http请求
     * <p>
     * 注意事项
     * <p>
     * 例如<br/>
     *
     * <p>
     * @see
     * @param method
     */
    private static String doHttpMethod(HttpMethod method){
        String responseBody =null;
        HttpClient client = new HttpClient();
        try {
            client.getHttpConnectionManager().getParams().setConnectionTimeout(50000);// 设置连接时间
            // Execute the method.
            int statusCode = client.executeMethod(method);

            if (statusCode != HttpStatus.SC_OK) {
               logger.warn("Method failed: " + method.getStatusLine()+"URL=>"+method.getURI() );

            }else{//只有200的才解读数据包
                //Read the response body.
                responseBody = method.getResponseBodyAsString();

                    logger.debug("	StatusLine=>"+method.getStatusLine()+" URL=>"+method.getURI()+"	\r\nresponseBody=>" + responseBody);
            }


        } catch (HttpException e) {
                logger.error("Fatal protocol violation: ", e);
        } catch (IOException e) {
                logger.error("Fatal transport violation: ", e);
        } finally {
            // Release the connection.
            method.releaseConnection();
        }
        return responseBody;
    }

    /**
     * 执行POST的HTTP请求,默认提交的编码是UTF-8
     * <p>
     * 注意事项
     * <p>
     * 例如<br/>
     *
     * <p>
     * @see
     * @param url
     * @param args
     */
    public static String doPostUploadFile(String url,Map<String,Object> args){

        // Create a method instance.
        //GetMethod method = new GetMethod(url);
        PostMethod postMethod=new PostMethod(url);

            //FilePart：用来上传文件的类
            try {
                Part[] parts = new Part[args.size()];
                if (args!=null){
                    int i=0;
                    for (String key:args.keySet()){
                        Object value=args.get(key);
                        if (value instanceof  File) {
                            parts[i]=new FilePart(key, (File)args.get(key));
                        }else if (value instanceof byte[]) {
                            parts[i]=new FilePart(key, new ByteArrayPartSource("file",(byte[])args.get(key)));
                        }else if (args.get(key) instanceof  String){
                            parts[i]=new StringPart(key, (String)args.get(key));
                        }
                        i++;
                    }

                    //对于MIME类型的请求，httpclient建议全用MulitPartRequestEntity进行包装
                    MultipartRequestEntity mre = new MultipartRequestEntity(parts, postMethod.getParams());
                    postMethod.setRequestEntity(mre);
                    return doHttpMethod(postMethod);
                }else{
                    logger.warn("没有传递参数");
                }

            } catch (FileNotFoundException e) {
                logger.error("FileNotFoundException:", e);
            }

        return null;

    }

//    public static String doPostP(String url,Object... args){
//        Map<String,Object> map=new LinkedHashMap<String,Object>();
//
//    }

    public static void main(String[] args){

        //File file2=new File("D:\\cache\\fileJellyfish.jpg");
        Map<String,Object> map=new LinkedHashMap<String,Object>();
        byte[] file2= null;
        try {
            file2= FileUtils.toByteArray2("D:\\cache\\fileJellyfish.jpg");
            map.put("file",file2);
            map.put("type","ml");
            map.put("userid","1");

            HttpClientUtils.doPostUploadFile(url,map);
            //ByteArrayPartSource file=new ByteArrayPartSource("file","");
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
