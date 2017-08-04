package com.kangyonggan.app.future.biz.service.impl;

import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.profile.DefaultProfile;
import com.aliyuncs.profile.IClientProfile;
import com.kangyonggan.app.future.biz.service.SmsService;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

/**
 * @author kangyonggan
 * @since 2017/2/9
 */
@Log4j2
public class SmsServiceImpl implements SmsService {

    @Setter
    private String signName;

    @Setter
    private String templateCode;

    @Setter
    private String debug;

    private IAcsClient client;

    public SmsServiceImpl(String regionId, String accessKeyId, String secret, String domain) {
        try {
            IClientProfile profile = DefaultProfile.getProfile(regionId, accessKeyId, secret);
            DefaultProfile.addEndpoint(regionId, regionId, "Sms", domain);
            client = new DefaultAcsClient(profile);
        } catch (Exception e) {
            log.error("初始化短信配置失败", e);
        }
    }
}
