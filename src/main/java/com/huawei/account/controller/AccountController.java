package com.huawei.account.controller;

import com.huawei.account.domain.Account;
import com.huawei.account.domain.Bill;
import com.huawei.account.domain.Services;
import com.huawei.account.service.AccountService;
import com.huawei.base.utils.AjaxResult;
import com.huawei.base.utils.PageBean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.sql.Timestamp;
import java.util.Date;

/**
 * Created by dllo on 17/11/16.
 */
@Controller
@RequestMapping("/account")
public class AccountController {
    @Resource
    private AccountService accountService;
    private int pageSize = 2;


    /**
     * 查询所有account
     * @param pageNum 当前页数
     * @param model 驱动
     * @return account集合
     */
    @RequestMapping("/account_list")
    public String account_list(Integer pageNum, Model model) {
        if (pageNum == null) {
            pageNum = 1;
        }
        PageBean<Account> pageBean = accountService.findAllAccount(pageNum, pageSize);
        model.addAttribute("pageBean", pageBean);
        return "account/account_list";
    }

    /**
     * 跳转
     * @return
     */
    @RequestMapping("/account_add")
    public String account_add() {
        return "account/account_add";
    }

    /**
     * 开通暂停account
     * @param account account对象
     * @return 结果集
     */
    @ResponseBody
    @RequestMapping("/accountSetState")
    public AjaxResult accountSetState(Account account) {
        int count = 0;
        AjaxResult ajaxResult = new AjaxResult();

        if (account.getStatus().equals("2")) {
            account.setStatus("1");
            count = accountService.setState(account);
        } else if (account.getStatus().equals("1")) {
            account.setStatus("2");
            account.setPause_date(new Timestamp(new Date().getTime()));
            count = accountService.setState(account);
        }

        if (count > 0) {
            ajaxResult.setSuccess(true);
            ajaxResult.setMessage("操作成功");
        } else {
            ajaxResult.setSuccess(false);
            ajaxResult.setMessage("操作失败");
        }
        return ajaxResult;
    }

    /**
     * 删除account
     * @param account 要删除的account
     * @return
     */
    @ResponseBody
    @RequestMapping("/accountDelete")
    public AjaxResult accountDelete(Account account) {
        AjaxResult ajaxResult = new AjaxResult();
        account.setClose_date(new Timestamp(new Date().getTime()));
        account.setStatus("3");
        int count = accountService.deleteAccount(account);
        if (count > 0) {
            ajaxResult.setMessage("删除成功，且已删除其下属的业务账号!");
        } else {
            ajaxResult.setMessage("删除失败!");
        }
        return ajaxResult;
    }

    /**
     * 添加account
     * @param account
     * @return
     */
    @ResponseBody
    @RequestMapping("/accountAdd")
    public AjaxResult accountAdd(Account account) {
        AjaxResult ajaxResult = new AjaxResult();
        int account_id = accountService.findSingle(account.getRe_idcard());
        account.setStatus("1");
        account.setCreate_date(new java.sql.Date(new Date().getTime()));
        account.setRecommender_id(account_id);
        int count = accountService.addAccount(account);
        if (count > 0) {
            ajaxResult.setMessage("保存成功");
            ajaxResult.setSuccess(true);
        } else {
            ajaxResult.setMessage("保存失败，该身份证已经开通过账务账号！");
            ajaxResult.setSuccess(false);
        }
        return ajaxResult;
    }

    /**
     * 查询service集合
     * @param pageNum 当前页数
     * @param model 驱动
     */
    @RequestMapping("/service_list")
    public String service_list(Integer pageNum, Model model) {
        if (pageNum == null) {
            pageNum = 1;
        }
        PageBean<Services> pageBean = accountService.findAllService(pageNum, pageSize);
        model.addAttribute("pageBean",pageBean);
        return "service/service_list";
    }

    /**
     * 跳转
     * @return
     */
    @RequestMapping("/service_add")
    public String service_add(){
        return "service/service_add";
    }

    /**
     * 查询bill集合
     * @param pageNum 当前页数
     * @param model 驱动
     * @return
     */
    @RequestMapping("/bill_list")
    public String bill_list(Integer pageNum,Model model){
        if (pageNum == null){
            pageNum =1;
        }
        PageBean<Bill> pageBean = accountService.findAllBill(pageNum,pageSize);
        model.addAttribute("pageBean",pageBean);
        return "bill/bill_list";
    }
}
