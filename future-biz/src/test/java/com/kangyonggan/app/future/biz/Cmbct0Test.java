package com.kangyonggan.app.future.biz;

import com.kangyonggan.app.future.common.util.Excel;
import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

/**
 * @author kangyonggan
 * @since 10/9/17
 */
public class Cmbct0Test {

    @Test
    public void test() throws Exception {

        String compareDataFile = "/Users/kyg/Downloads/民生T0提供卡bin数据.xlsx";
        String targetDataFile = "/Users/kyg/Downloads/民生T0出款成功卡号前10位.xlsx";
        String resultDataFile = "/Users/kyg/Downloads/民生T0出款成功卡号前10位-副本.xlsx";

        List<String[]> compareData = Excel.excelToList(compareDataFile, 2);
        List<String[]> targetData = Excel.excelToList(targetDataFile, 2);
        List<String[]> resultData = new ArrayList();

        String header[] = {"民生T0出款成功卡号前10位", "卡bin是否在提供范围内(是/否)", "卡bin(否则放空)"};
        resultData.add(header);

        for (int i = 0; i < targetData.size(); i++) {
            String data = targetData.get(i)[0];
            boolean isFound = false;
            String cardBin = null;
            for (int j = 0; j < compareData.size(); j++) {
                cardBin = compareData.get(j)[0];
                if (data.startsWith(cardBin)) {
                    isFound = true;
                    break;
                }
            }

            String line[];
            if (isFound) {
                line = new String[]{data, "是", cardBin};
                System.out.println("找到" + data + "的卡bin:" + cardBin);
            } else {
                line = new String[]{data, "否", ""};
                System.out.println("没有找到" + data + "的卡bin");
            }
            resultData.add(line);
        }

        Excel.exportExcel(resultDataFile, resultData);

    }

    @Test
    public void test2() throws Exception {

        String compareDataFile = "/Users/kyg/Downloads/民生T0提供卡bin数据.xlsx";
        String targetDataFile = "/Users/kyg/Downloads/民生T0出款失败交易-全卡号.xlsx";

        List<String[]> compareData = Excel.excelToList(compareDataFile, 2);
        List<String[]> targetData = Excel.excelToList(targetDataFile, 2);

        List<String> resultList = new ArrayList();
        for (int i = 0; i < targetData.size(); i++) {
            if ("07".equals(targetData.get(i)[5].trim())) {
                String data = targetData.get(i)[4];
                boolean isFound = false;
                String cardBin = null;
                for (int j = 0; j < compareData.size(); j++) {
                    cardBin = compareData.get(j)[0];
                    if (data.startsWith(cardBin)) {
                        isFound = true;
                        break;
                    }
                }
                if (isFound) {
                    System.out.println("找到" + data + "的卡bin:" + cardBin);
                    resultList.add(cardBin);
                } else {
                    System.out.println("没有找到" + data + "的卡bin, 截取前10位：" + data.substring(0, 10));
                    resultList.add(data.substring(0, 10));
                }

            }
        }

        System.out.println("卡bin：");
        for (int i = 0; i < resultList.size(); i++) {
            System.out.println(resultList.get(i));
        }
    }

}
