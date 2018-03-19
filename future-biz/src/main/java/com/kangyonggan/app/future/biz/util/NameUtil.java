package com.kangyonggan.app.future.biz.util;

/**
 * @author kangyonggan
 * @since 3/18/18
 */
public class NameUtil {

    /**
     * 随机生成一个汉字
     *
     * @return
     */
    public static String randomOne() {
        return String.valueOf((char) (0x4e00 + (int) (Math.random() * (0x9fa5 - 0x4e00 + 1))));
    }

    /**
     * 随机成功两个汉字
     *
     * @return
     */
    public static String randomTwo() {
        return randomOne() + randomOne();
    }

    /**
     * 随机成功一个或两个汉字
     *
     * @return
     */
    public static String randomOneOrTwo() {
        int r = (int) (Math.random() * 1000) % 2;
        if (r == 0) {
            return randomOne();
        }
        return randomTwo();
    }

}
