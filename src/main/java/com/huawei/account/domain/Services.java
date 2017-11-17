package com.huawei.account.domain;

import com.huawei.cost.domain.Cost;

import java.sql.Date;

/**
 * Created by dllo on 17/11/17.
 */
public class Services {
    private int service_id;
    private int account_id;
    private String unix_host;
    private String os_username;
    private String login_passwd;
    private String status;
    private Date create_date;
    private Date pause_date;
    private Date close_date;
    private int cost_id;
    private Account account;
    private Cost cost;

    public Services() {
    }

    @Override
    public String toString() {
        return "Services{" +
                "service_id=" + service_id +
                ", account_id=" + account_id +
                ", unix_host='" + unix_host + '\'' +
                ", os_username='" + os_username + '\'' +
                ", login_passwd='" + login_passwd + '\'' +
                ", status='" + status + '\'' +
                ", create_date=" + create_date +
                ", pause_date=" + pause_date +
                ", close_date=" + close_date +
                ", cost_id=" + cost_id +
                '}';
    }

    public int getService_id() {
        return service_id;
    }

    public void setService_id(int service_id) {
        this.service_id = service_id;
    }

    public int getAccount_id() {
        return account_id;
    }

    public void setAccount_id(int account_id) {
        this.account_id = account_id;
    }

    public String getUnix_host() {
        return unix_host;
    }

    public void setUnix_host(String unix_host) {
        this.unix_host = unix_host;
    }

    public String getOs_username() {
        return os_username;
    }

    public void setOs_username(String os_username) {
        this.os_username = os_username;
    }

    public String getLogin_passwd() {
        return login_passwd;
    }

    public void setLogin_passwd(String login_passwd) {
        this.login_passwd = login_passwd;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getCreate_date() {
        return create_date;
    }

    public void setCreate_date(Date create_date) {
        this.create_date = create_date;
    }

    public Date getPause_date() {
        return pause_date;
    }

    public void setPause_date(Date pause_date) {
        this.pause_date = pause_date;
    }

    public Date getClose_date() {
        return close_date;
    }

    public void setClose_date(Date close_date) {
        this.close_date = close_date;
    }

    public int getCost_id() {
        return cost_id;
    }

    public void setCost_id(int cost_id) {
        this.cost_id = cost_id;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public Cost getCost() {
        return cost;
    }

    public void setCost(Cost cost) {
        this.cost = cost;
    }
}
