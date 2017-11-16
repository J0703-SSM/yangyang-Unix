package com.huawei.account.domain;

import java.sql.Date;
import java.sql.Timestamp;

/**
 * Created by dllo on 17/11/16.
 */
public class Account {
    private int account_id;
    private int recommender_id;
    private String login_name;
    private String login_passwd;
    private String login_passwd1;
    private String status;
    private Date create_date;
    private Timestamp pause_date;
    private Timestamp close_date;
    private String real_name;
    private String idcard_no;
    private String re_idcard;
    private Date birthdate;
    private String gender;
    private String occupation;
    private String telephone;
    private String email;
    private String mailaddress;
    private String zipcode;
    private String qq;
    private Timestamp last_login_time;
    private Timestamp last_login_ip;

    public Account() {
    }

    @Override
    public String toString() {
        return "Account{" +
                "account_id=" + account_id +
                ", recommender_id=" + recommender_id +
                ", login_name='" + login_name + '\'' +
                ", login_passwd='" + login_passwd + '\'' +
                ", status='" + status + '\'' +
                ", create_date=" + create_date +
                ", pause_date=" + pause_date +
                ", close_date=" + close_date +
                ", real_name='" + real_name + '\'' +
                ", idcard_no='" + idcard_no + '\'' +
                ", birthdate=" + birthdate +
                ", gender='" + gender + '\'' +
                ", occupation='" + occupation + '\'' +
                ", telephone='" + telephone + '\'' +
                ", email='" + email + '\'' +
                ", mailaddress='" + mailaddress + '\'' +
                ", zipcode='" + zipcode + '\'' +
                ", qq='" + qq + '\'' +
                ", last_login_time=" + last_login_time +
                ", last_login_ip=" + last_login_ip +
                '}';
    }

    public int getAccount_id() {
        return account_id;
    }

    public void setAccount_id(int account_id) {
        this.account_id = account_id;
    }

    public int getRecommender_id() {
        return recommender_id;
    }

    public void setRecommender_id(int recommender_id) {
        this.recommender_id = recommender_id;
    }

    public String getLogin_name() {
        return login_name;
    }

    public void setLogin_name(String login_name) {
        this.login_name = login_name;
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

    public Timestamp getPause_date() {
        return pause_date;
    }

    public void setPause_date(Timestamp pause_date) {
        this.pause_date = pause_date;
    }

    public Timestamp getClose_date() {
        return close_date;
    }

    public void setClose_date(Timestamp close_date) {
        this.close_date = close_date;
    }

    public String getReal_name() {
        return real_name;
    }

    public void setReal_name(String real_name) {
        this.real_name = real_name;
    }

    public String getIdcard_no() {
        return idcard_no;
    }

    public void setIdcard_no(String idcard_no) {
        this.idcard_no = idcard_no;
    }

    public Date getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(Date birthdate) {
        this.birthdate = birthdate;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getOccupation() {
        return occupation;
    }

    public void setOccupation(String occupation) {
        this.occupation = occupation;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMailaddress() {
        return mailaddress;
    }

    public void setMailaddress(String mailaddress) {
        this.mailaddress = mailaddress;
    }

    public String getZipcode() {
        return zipcode;
    }

    public void setZipcode(String zipcode) {
        this.zipcode = zipcode;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public Timestamp getLast_login_time() {
        return last_login_time;
    }

    public void setLast_login_time(Timestamp last_login_time) {
        this.last_login_time = last_login_time;
    }

    public Timestamp getLast_login_ip() {
        return last_login_ip;
    }

    public void setLast_login_ip(Timestamp last_login_ip) {
        this.last_login_ip = last_login_ip;
    }

    public String getLogin_passwd1() {
        return login_passwd1;
    }

    public void setLogin_passwd1(String login_passwd1) {
        this.login_passwd1 = login_passwd1;
    }

    public String getRe_idcard() {
        return re_idcard;
    }

    public void setRe_idcard(String re_idcard) {
        this.re_idcard = re_idcard;
    }
}
