package com.kangyonggan.app.future.biz.service.impl;

import com.github.pagehelper.PageHelper;
import com.kangyonggan.app.future.biz.service.TokenService;
import com.kangyonggan.app.future.common.util.DateUtil;
import com.kangyonggan.app.future.model.annotation.LogTime;
import com.kangyonggan.app.future.model.constants.AppConstants;
import com.kangyonggan.app.future.model.vo.Token;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 * @author kangyonggan
 * @since 8/7/17
 */
@Service
@Log4j2
public class TokenServiceImpl extends BaseService<Token> implements TokenService {

    @Override
    @LogTime
    public void saveToken(Token token) {
        myMapper.insertSelective(token);
    }

    @Override
    @LogTime
    public Token findTokenByMobileAndType(String mobile, String type) {
        Example example = new Example(Token.class);
        example.createCriteria().andEqualTo("mobile", mobile)
                .andEqualTo("type", type)
                .andEqualTo("isDeleted", AppConstants.IS_DELETED_NO)
                .andGreaterThanOrEqualTo("createdTime", DateUtil.plusMinutes(-30));
        example.setOrderByClause("id desc");

        PageHelper.startPage(1, 1);
        List<Token> tokens = myMapper.selectByExample(example);
        if (!tokens.isEmpty()) {
            return tokens.get(0);
        }
        return null;
    }

    @Override
    @LogTime
    public Token findTokenByCodeAndType(String code, String type) {
        Token token = new Token();
        token.setCode(code);
        token.setType(type);
        try {
            token = myMapper.selectOne(token);
        } catch (Exception e) {
            log.warn("查找登录的token出错", e);
            return null;
        }
        return token;
    }

    @Override
    @LogTime
    public void deleteTokenById(Long id) {
        Token token = new Token();
        token.setId(id);
        token.setIsDeleted(AppConstants.IS_DELETED_YES);

        myMapper.updateByPrimaryKeySelective(token);
    }

    @Override
    public Token findActiveTokenByMobileAndType(String mobile, String type) {
        Example example = new Example(Token.class);
        example.createCriteria().andEqualTo("mobile", mobile)
                .andEqualTo("type", type)
                .andEqualTo("isDeleted", AppConstants.IS_DELETED_NO)
                .andGreaterThanOrEqualTo("createdTime", DateUtil.plusMinutes(-1));
        example.setOrderByClause("id desc");

        PageHelper.startPage(1, 1);
        List<Token> tokens = myMapper.selectByExample(example);
        if (!tokens.isEmpty()) {
            return tokens.get(0);
        }
        return null;
    }

    @Override
    @LogTime
    public void deleteTokensByMobileAndType(String mobile, String type) {
        Token token = new Token();
        token.setType(type);
        token.setMobile(mobile);

        myMapper.delete(token);
    }
}
