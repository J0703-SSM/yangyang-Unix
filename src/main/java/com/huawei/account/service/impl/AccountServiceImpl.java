package com.huawei.account.service.impl;

import com.huawei.account.domain.Account;
import com.huawei.account.domain.Bill;
import com.huawei.account.domain.Bill_Code;
import com.huawei.account.domain.Services;
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

    public PageBean<Account> findAllAccount(Integer pageNum, int pageSize, Account account) {
        int totalCount = accountMapper.findAccountCount(account);
        PageBean<Account> pageBean = new PageBean(pageNum, pageSize, totalCount);
        pageBean.setT(account);
        List<Account> roles = accountMapper.findAllAccount(pageBean);
        pageBean.setData(roles);
        return pageBean;
    }

    public int setState(Account account) {
        return accountMapper.setState(account);
    }

    public int deleteAccount(Account account) {
        accountMapper.deleteAcc_Ser(account);
        return accountMapper.deleteAccount(account);
    }

    public int findSingle(String re_idcard) {
        return accountMapper.findSingle(re_idcard);
    }

    public int addAccount(Account account) {
        return accountMapper.addAccount(account);
    }

    public PageBean<Services> findAllService(Integer pageNum, int pageSize) {
        int totalCount = accountMapper.findServiceCount();
        PageBean<Services> pageBean = new PageBean(pageNum, pageSize, totalCount);
        List<Services> services = accountMapper.findAllService(pageBean);
        pageBean.setData(services);
        return pageBean;
    }

    public PageBean<Bill> findAllBill(Integer pageNum, int pageSize) {
        int totalCount = accountMapper.findBillCount();
        PageBean<Bill> pageBean = new PageBean(pageNum, pageSize, totalCount);
        List<Bill> bills = accountMapper.findAllBill(pageBean);
        pageBean.setData(bills);
        return pageBean;
    }

    public Account findAccountById(int account_id) {
        return accountMapper.findAccountById(account_id);
    }

    public PageBean<Bill_Code> findAllBill_code(Integer pageNum, int pageSize) {
        int totalCount = accountMapper.findBill_CodeCount();
        PageBean<Bill_Code> pageBean = new PageBean(pageNum, pageSize, totalCount);
        List<Bill_Code> bill_codes = accountMapper.findAllBill_Code(pageBean);
        pageBean.setData(bill_codes);
        return pageBean;
    }

}
