package com.huawei.account.service;

import com.huawei.account.domain.Account;
import com.huawei.account.domain.Bill;
import com.huawei.account.domain.Services;
import com.huawei.base.utils.PageBean;



/**
 * Created by dllo on 17/11/16.
 */
public interface AccountService {
    PageBean<Account> findAllAccount(Integer pageNum, int pageSize);

    int setState(Account account);

    int deleteAccount(Account account);

    int findSingle(String re_idcard);

    int addAccount(Account account);

    PageBean<Services> findAllService(Integer pageNum, int pageSize);

    PageBean<Bill> findAllBill(Integer pageNum, int pageSize);
}
