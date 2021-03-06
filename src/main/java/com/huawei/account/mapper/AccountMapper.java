package com.huawei.account.mapper;

import com.huawei.account.domain.Account;
import com.huawei.account.domain.Bill;
import com.huawei.account.domain.Bill_Code;
import com.huawei.account.domain.Services;
import com.huawei.base.utils.PageBean;

import java.util.List;

/**
 * Created by dllo on 17/11/16.
 */
public interface AccountMapper {
    List<Account> findAllAccount(PageBean pageBean);

    int findAccountCount(Account account);

    int setState(Account account);

    int deleteAccount(Account account);

    int findSingle(String re_idcard);

    int addAccount(Account account);

    int findServiceCount();

    List<Services> findAllService(PageBean<Services> pageBean);

    int findBillCount();

    List<Bill> findAllBill(PageBean<Bill> pageBean);

    Account findAccountById(int account_id);

    int findBill_CodeCount();

    List<Bill_Code> findAllBill_Code(PageBean<Bill_Code> pageBean);

    void deleteAcc_Ser(Account account);


}
