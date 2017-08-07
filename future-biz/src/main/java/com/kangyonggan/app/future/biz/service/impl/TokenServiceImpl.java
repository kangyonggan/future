package com.kangyonggan.app.future.biz.service.impl;

import com.github.pagehelper.PageHelper;
import com.kangyonggan.app.future.biz.service.TokenService;
import com.kangyonggan.app.future.common.util.DateUtil;
import com.kangyonggan.app.future.model.annotation.LogTime;
import com.kangyonggan.app.future.model.constants.AppConstants;
import com.kangyonggan.app.future.model.vo.Token;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 * @author kangyonggan
 * @since 8/7/17
 */
@Service
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
}
