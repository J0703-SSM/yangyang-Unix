package com.huawei.account.domain;

/**
 * Created by dllo on 17/11/17.
 */
public class Bill {
    private int bill_id;
    private int account_id;
    private String bill_month;
    private double cost;
    private String payment_mode;
    private String pay_state;
    private Account account;

    public Bill() {
    }

    @Override
    public String toString() {
        return "Bill{" +
                "bill_id=" + bill_id +
                ", account_id=" + account_id +
                ", bill_month='" + bill_month + '\'' +
                ", cost=" + cost +
                ", payment_mode='" + payment_mode + '\'' +
                ", pay_state='" + pay_state + '\'' +
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

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }

    public String getPayment_mode() {
        return payment_mode;
    }

    public void setPayment_mode(String payment_mode) {
        this.payment_mode = payment_mode;
    }

    public String getPay_state() {
        return pay_state;
    }

    public void setPay_state(String pay_state) {
        this.pay_state = pay_state;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }
}
