package com.huawei.account.service.impl;

import com.huawei.account.domain.Account;
import com.huawei.account.mapper.AccountMapper;
import com.huawei.account.service.AccountService;
import com.huawei.base.utils.PageBean;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by dllo on 17/11/16.
 */
@Service
public class AccountServiceImpl implements AccountService {

    @Resource
    private AccountMapper accountMapper;

    public PageBean<Account> findAllAccount(Integer pageNum, int pageSize) {
        int totalCount = accountMapper.findAccountCount();
        PageBean<Account> pageBean = new PageBean(pageNum, pageSize, totalCount);
        List<Account> roles = accountMapper.findAllAccount(pageBean);
        pageBean.setData(roles);
        return pageBean;
    }

    public int setState(Account account) {
        return accountMapper.setState(account);
    }

    public int deleteAccount(Account account) {
        return accountMapper.deleteAccount(account);
    }

    public int findSingle(String re_idcard) {
        return accountMapper.findSingle(re_idcard);
    }

    public int addAccount(Account account) {
        return accountMapper.addAccount(account);
    }

}
