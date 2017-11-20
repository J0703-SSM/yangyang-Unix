package com.huawei.account.service;

import com.huawei.account.domain.Account;
import com.huawei.account.domain.Bill;
import com.huawei.account.domain.Bill_Code;
import com.huawei.account.domain.Services;
import com.huawei.base.utils.PageBean;



/**
 * Created by dllo on 17/11/16.
 */
public interface AccountService {
    PageBean<Account> findAllAccount(Integer pageNum, int pageSize,Account account);

    int setState(Account account);

    int deleteAccount(Account account);

    int findSingle(String re_idcard);

    int addAccount(Account account);

    PageBean<Services> findAllService(Integer pageNum, int pageSize);

    PageBean<Bill> findAllBill(Integer pageNum, int pageSize);

    Account findAccountById(int account_id);

    PageBean<Bill_Code> findAllBill_code(Integer pageNum, int pageSize);
}
