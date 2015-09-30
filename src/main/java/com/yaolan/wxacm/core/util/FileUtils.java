package com.yaolan.wxacm.core.util;

import com.yaolan.wxacm.core.spring.ConfigurerInfo;
import org.apache.log4j.Logger;

import java.io.*;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;

/**
 * Created by Yaolan on 2015/8/13.
 */
public class FileUtils {
    /**
     * NIO way
     *
     * @param filename
     * @return
     * @throws IOException
     */
    public static byte[] toByteArray2(String filename) throws IOException {

        File f = new File(filename);
        if (!f.exists()) {
            throw new FileNotFoundException(filename);
        }

        FileChannel channel = null;
        FileInputStream fs = null;
        try {
            fs = new FileInputStream(f);
            channel = fs.getChannel();
            ByteBuffer byteBuffer = ByteBuffer.allocate((int) channel.size());
            while ((channel.read(byteBuffer)) > 0) {
                // do nothing
                // System.out.println("reading");
            }
            return byteBuffer.array();
        } catch (IOException e) {
            e.printStackTrace();
            throw e;
        } finally {
            try {
                channel.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
            try {
                fs.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }


    public  static File BetyToFile(String filePath,byte[] data)
    {
        File file = new File(filePath);
        BufferedOutputStream stream = null;
        FileOutputStream fstream = null;
        try {
            fstream = new FileOutputStream(file);
            stream = new BufferedOutputStream(fstream);
            stream.write(data);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (stream != null) {
                    stream.close();
                }
                if (null != fstream) {
                    fstream.close();
                }
            } catch (IOException e1) {
                e1.printStackTrace();
            }
        }
        return file;
    }
}
