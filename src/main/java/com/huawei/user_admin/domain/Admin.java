package com.huawei.user_admin.domain;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.Pattern;
import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

/**
 * Created by dllo on 17/11/13.
 */
public class Admin implements Serializable{
    private int admin_id;
    @Length(min = 1,max = 30,message = "30长度的字母、数字和下划线")
    private String admin_code;
    @Length(min = 1,max = 30,message = "30长度的字母、数字和下划线")
    private String password;
    @Length(min = 1,max = 30,message = "30长度的字母、数字和下划线")
    private String password1;
    @Length(min = 1,max = 30,message = "30长度的字母、数字和下划线")
    private String password2;
    @Length(min = 1,max = 20,message = "20长度的字母、数字和下划线")
    private String name;
    @Pattern(regexp = "^1[34578]\\d{9}$",message = "请输入正确的电话号码格式")
    private String telephone;
    @Email(regexp = "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$",message = "请输入正确的邮箱")
    private String email;
    private Timestamp enrolldate;
    private String code;
    private List<Role> roles;
    @Length(min = 1,message = "至少选择一个")
    private String cbValue;

    public Admin() {
    }

    @Override
    public String toString() {
        return "Admin{" +
                "admin_id=" + admin_id +
                ", admin_code='" + admin_code + '\'' +
                ", password='" + password + '\'' +
                ", name='" + name + '\'' +
                ", telephone='" + telephone + '\'' +
                ", email='" + email + '\'' +
                ", enrolldate=" + enrolldate +
                '}';
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public int getAdmin_id() {
        return admin_id;
    }

    public void setAdmin_id(int admin_id) {
        this.admin_id = admin_id;
    }

    public String getAdmin_code() {
        return admin_code;
    }

    public void setAdmin_code(String admin_code) {
        this.admin_code = admin_code;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public Timestamp getEnrolldate() {
        return enrolldate;
    }

    public void setEnrolldate(Timestamp enrolldate) {
        this.enrolldate = enrolldate;
    }

    public List<Role> getRoles() {
        return roles;
    }

    public void setRoles(List<Role> roles) {
        this.roles = roles;
    }

    public String getPassword1() {
        return password1;
    }

    public void setPassword1(String password1) {
        this.password1 = password1;
    }

    public String getCbValue() {
        return cbValue;
    }

    public void setCbValue(String cbValue) {
        this.cbValue = cbValue;
    }

    public String getPassword2() {
        return password2;
    }

    public void setPassword2(String password2) {
        this.password2 = password2;
    }
}
