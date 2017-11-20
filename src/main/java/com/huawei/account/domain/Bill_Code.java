package com.huawei.account.domain;

/**
 * Created by dllo on 17/11/17.
 */
public class Bill_Code {
    private int bill_id;
    private int account_id;
    private String bill_month;
    private Account account;
    private Bill bill;
    public Bill_Code() {
    }

    @Override
    public String toString() {
        return "Bill_Code{" +
                "bill_id=" + bill_id +
                ", account_id=" + account_id +
                ", bill_month='" + bill_month + '\'' +
                '}';
    }

    public int getBill_id() {
        return bill_id;
    }

    public void setBill_id(int bill_id) {
        this.bill_id = bill_id;
    }

    public int getAccount_id() {
        return account_id;
    }

    public void setAccount_id(int account_id) {
        this.account_id = account_id;
    }

    public String getBill_month() {
        return bill_month;
    }

    public void setBill_month(String bill_month) {
        this.bill_month = bill_month;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public Bill getBill() {
        return bill;
    }

    public void setBill(Bill bill) {
        this.bill = bill;
    }
}
