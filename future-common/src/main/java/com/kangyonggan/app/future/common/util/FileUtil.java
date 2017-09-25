package com.kangyonggan.app.future.common.util;

import lombok.extern.log4j.Log4j2;
import org.apache.tika.mime.MimeType;
import org.apache.tika.mime.MimeTypes;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;

/**
 * @author kangyonggan
 * @since 2017/5/10 0010
 */
@Log4j2
public class FileUtil {

    /**
     * 写文本文件到本地服务器
     *
     * @param filePath
     * @param fileContent
     * @throws Exception
     */
    public static void writeTextToFile(String filePath, String fileContent) throws Exception {
        BufferedWriter writer = null;
        try {
            File file = new File(filePath);
            if (!file.getParentFile().exists()) {
                file.getParentFile().mkdirs();
            }

            writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file), "UTF-8"));
            writer.write(fileContent);
            writer.flush();
        } catch (Exception e) {
            throw e;
        } finally {
            if (writer != null) {
                writer.close();
            }
        }
    }

    /**
     * 读取文件内容
     *
     * @param filePath
     * @throws Exception
     */
    public static String readFile(String filePath) throws Exception {
        BufferedReader reader = null;
        try {
            File file = new File(filePath);

            reader = new BufferedReader(new InputStreamReader(new FileInputStream(file), "UTF-8"));
            String line;
            StringBuilder sb = new StringBuilder();
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }

            return sb.toString();
        } catch (Exception e) {
            throw e;
        } finally {
            if (reader != null) {
                reader.close();
            }
        }
    }

    /**
     * 通过url获取图片并保存在本地
     *
     * @param urlStr
     * @param savePath
     */
    public static void saveToFile(String urlStr, String savePath) {
        FileOutputStream fos = null;
        BufferedInputStream bis = null;
        HttpURLConnection httpUrl = null;
        URL url;
        int BUFFER_SIZE = 1024;
        byte[] buf = new byte[BUFFER_SIZE];
        int size;
        try {
            url = new URL(urlStr);
            httpUrl = (HttpURLConnection) url.openConnection();
            httpUrl.connect();
            String Type = httpUrl.getHeaderField("Content-Type");
            if (Type.equals("image/gif")) {
                savePath += ".gif";
            } else if (Type.equals("image/png")) {
                savePath += ".png";
            } else if (Type.equals("image/jpeg")) {
                savePath += ".jpg";
            } else {
                log.warn("未知图片格式");
                return;
            }
            bis = new BufferedInputStream(httpUrl.getInputStream());
            fos = new FileOutputStream(savePath);
            while ((size = bis.read(buf)) != -1) {
                fos.write(buf, 0, size);
            }
            fos.flush();
        } catch (Exception e) {
            log.warn("保存图片异常", e);
        } finally {
            try {
                if (fos != null) {
                    fos.close();
                }
                if (bis != null) {
                    bis.close();
                }
                if (httpUrl != null) {
                    httpUrl.disconnect();
                }
            } catch (Exception e) {
                log.warn("关闭流异常", e);
            }
        }
    }

    /**
     * 从网络Url中下载文件
     *
     * @param urlStr
     * @param savePath
     * @throws IOException
     */
    public static void downloadFromUrl(String urlStr, String savePath) throws IOException {
        URL url = new URL(urlStr);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        //设置超时间为10秒
        conn.setConnectTimeout(10 * 1000);
        //防止屏蔽程序抓取而返回403错误
        conn.setRequestProperty("User-Agent", "Mozilla/4.0 (compatible; MSIE 5.0; Windows NT; DigExt)");

        //得到输入流
        InputStream inputStream = conn.getInputStream();
        //获取自己数组
        byte[] getData = readInputStream(inputStream);

        //文件保存位置
        File file = new File(savePath);
        FileOutputStream fos = new FileOutputStream(file);
        fos.write(getData);
        if (fos != null) {
            fos.close();
        }
        if (inputStream != null) {
            inputStream.close();
        }
    }

    /**
     * 从输入流中获取字节数组
     *
     * @param inputStream
     * @return
     * @throws IOException
     */
    public static byte[] readInputStream(InputStream inputStream) throws IOException {
        byte[] buffer = new byte[1024];
        int len;
        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        while ((len = inputStream.read(buffer)) != -1) {
            bos.write(buffer, 0, len);
        }
        bos.close();
        return bos.toByteArray();
    }

    /**
     * 根据MIMEType获取后缀
     *
     * @param mimeType
     * @return
     * @throws Exception
     */
    public static String getExtension(String mimeType) throws Exception {
        MimeTypes allTypes = MimeTypes.getDefaultMimeTypes();
        MimeType type = allTypes.forName(mimeType);
        return type.getExtension();
    }

    /**
     * 删除文件
     *
     * @param path
     */
    public static void delete(String path) {
        new File(path).delete();
    }
}
