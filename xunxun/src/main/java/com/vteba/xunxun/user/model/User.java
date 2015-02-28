package com.vteba.xunxun.user.model;

import java.util.Date;

public class User {
    /**
     * order by 排序语句
     * 对应数据库表字段 user
     */
    private String orderBy;

    /**
     * 分页开始记录
     * 对应数据库表字段 user
     */
    private Integer start;

    /**
     * 分页大小
     * 对应数据库表字段 user
     */
    private int pageSize = 10;

    /**
     * 是否去重
     * 对应数据库表字段 user
     */
    private boolean distinct;

    /**
     * 对应数据库表字段 user.id
     */
    private String id;

    /**
     * 对应数据库表字段 user.user_name
     */
    private String userName;

    /**
     * 对应数据库表字段 user.user_account
     */
    private String userAccount;

    /**
     * 对应数据库表字段 user.telephone
     */
    private String telephone;

    /**
     * 对应数据库表字段 user.mobile_phone
     */
    private String mobilePhone;

    /**
     * 对应数据库表字段 user.company
     */
    private String company;

    /**
     * 对应数据库表字段 user.password
     */
    private String password;

    /**
     * 对应数据库表字段 user.create_date
     */
    private Date createDate;

    /**
     * 对应数据库表字段 user.state
     */
    private Boolean state;

    /**
     * 设置 order by 排序语句
     */
    public void setOrderBy(String orderBy) {
        this.orderBy = orderBy;
    }

    /**
     * 获得 order by 排序语句
     */
    public String getOrderBy() {
        return orderBy;
    }

    /**
     * 设置 start，分页开始记录
     */
    public void setStart(Integer start) {
        this.start = start;
    }

    /**
     * 获得 start，分页开始记录
     */
    public Integer getStart() {
        return start;
    }

    /**
     * 设置 pageSize，分页大小
     */
    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    /**
     * 获得 pageSize，分页大小
     */
    public int getPageSize() {
        return pageSize;
    }

    /**
     * 设置 distinct，是否去重
     */
    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    /**
     * 获得 distinct，是否去重
     */
    public boolean isDistinct() {
        return distinct;
    }

    /**
     * 获得字段 user.id 的值
     *
     * @return the value of user.id
     */
    public String getId() {
        return id;
    }

    /**
     * 设置字段 user.id 的值
     *
     * @param id the value for user.id
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * 获得字段 user.user_name 的值
     *
     * @return the value of user.user_name
     */
    public String getUserName() {
        return userName;
    }

    /**
     * 设置字段 user.user_name 的值
     *
     * @param userName the value for user.user_name
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }

    /**
     * 获得字段 user.user_account 的值
     *
     * @return the value of user.user_account
     */
    public String getUserAccount() {
        return userAccount;
    }

    /**
     * 设置字段 user.user_account 的值
     *
     * @param userAccount the value for user.user_account
     */
    public void setUserAccount(String userAccount) {
        this.userAccount = userAccount;
    }

    /**
     * 获得字段 user.telephone 的值
     *
     * @return the value of user.telephone
     */
    public String getTelephone() {
        return telephone;
    }

    /**
     * 设置字段 user.telephone 的值
     *
     * @param telephone the value for user.telephone
     */
    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    /**
     * 获得字段 user.mobile_phone 的值
     *
     * @return the value of user.mobile_phone
     */
    public String getMobilePhone() {
        return mobilePhone;
    }

    /**
     * 设置字段 user.mobile_phone 的值
     *
     * @param mobilePhone the value for user.mobile_phone
     */
    public void setMobilePhone(String mobilePhone) {
        this.mobilePhone = mobilePhone;
    }

    /**
     * 获得字段 user.company 的值
     *
     * @return the value of user.company
     */
    public String getCompany() {
        return company;
    }

    /**
     * 设置字段 user.company 的值
     *
     * @param company the value for user.company
     */
    public void setCompany(String company) {
        this.company = company;
    }

    /**
     * 获得字段 user.password 的值
     *
     * @return the value of user.password
     */
    public String getPassword() {
        return password;
    }

    /**
     * 设置字段 user.password 的值
     *
     * @param password the value for user.password
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * 获得字段 user.create_date 的值
     *
     * @return the value of user.create_date
     */
    public Date getCreateDate() {
        return createDate;
    }

    /**
     * 设置字段 user.create_date 的值
     *
     * @param createDate the value for user.create_date
     */
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    /**
     * 获得字段 user.state 的值
     *
     * @return the value of user.state
     */
    public Boolean getState() {
        return state;
    }

    /**
     * 设置字段 user.state 的值
     *
     * @param state the value for user.state
     */
    public void setState(Boolean state) {
        this.state = state;
    }
}