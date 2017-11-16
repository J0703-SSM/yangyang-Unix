package com.huawei.account.mapper;

import com.huawei.account.domain.Account;
import com.huawei.base.utils.PageBean;

import java.util.List;

/**
 * Created by dllo on 17/11/16.
 */
public interface AccountMapper {
    List<Account> findAllAccount(PageBean pageBean);

    int findAccountCount();

    int setState(Account account);

    int deleteAccount(Account account);

    int findSingle(String re_idcard);

    int addAccount(Account account);
}
