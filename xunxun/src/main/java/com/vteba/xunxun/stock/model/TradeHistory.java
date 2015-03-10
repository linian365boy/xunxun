package com.vteba.xunxun.stock.model;

import java.util.Date;

public class TradeHistory {
    /**
     * order by 排序语句
     * 对应数据库表字段 trade_history
     */
    private String orderBy;

    /**
     * 分页开始记录
     * 对应数据库表字段 trade_history
     */
    private Integer start;

    /**
     * 分页大小
     * 对应数据库表字段 trade_history
     */
    private int pageSize = 10;

    /**
     * 是否去重
     * 对应数据库表字段 trade_history
     */
    private boolean distinct;

    /**
     * 对应数据库表字段 trade_history.id
     */
    private Long id;

    /**
     * 对应数据库表字段 trade_history.user_account
     */
    private String userAccount;

    /**
     * 对应数据库表字段 trade_history.stock_code
     */
    private String stockCode;

    /**
     * 对应数据库表字段 trade_history.stock_name
     */
    private String stockName;

    /**
     * 对应数据库表字段 trade_history.stock_full_name
     */
    private String stockFullName;

    /**
     * 对应数据库表字段 trade_history.amount
     */
    private Long amount;

    /**
     * 对应数据库表字段 trade_history.price
     */
    private Double price;

    /**
     * 对应数据库表字段 trade_history.cost_price
     */
    private Double costPrice;

    /**
     * 对应数据库表字段 trade_history.total_amount
     */
    private Double totalAmount;

    /**
     * 对应数据库表字段 trade_history.trade_amount
     */
    private Double tradeAmount;

    /**
     * 对应数据库表字段 trade_history.trade_commission
     */
    private Double tradeCommission;

    /**
     * 对应数据库表字段 trade_history.type
     */
    private Integer type;

    /**
     * 对应数据库表字段 trade_history.exchange
     */
    private Integer exchange;

    /**
     * 对应数据库表字段 trade_history.exchange_name
     */
    private String exchangeName;

    /**
     * 对应数据库表字段 trade_history.trade_date
     */
    private Date tradeDate;

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
     * 获得字段 trade_history.id 的值
     *
     * @return the value of trade_history.id
     */
    public Long getId() {
        return id;
    }

    /**
     * 设置字段 trade_history.id 的值
     *
     * @param id the value for trade_history.id
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * 获得字段 trade_history.user_account 的值
     *
     * @return the value of trade_history.user_account
     */
    public String getUserAccount() {
        return userAccount;
    }

    /**
     * 设置字段 trade_history.user_account 的值
     *
     * @param userAccount the value for trade_history.user_account
     */
    public void setUserAccount(String userAccount) {
        this.userAccount = userAccount;
    }

    /**
     * 获得字段 trade_history.stock_code 的值
     *
     * @return the value of trade_history.stock_code
     */
    public String getStockCode() {
        return stockCode;
    }

    /**
     * 设置字段 trade_history.stock_code 的值
     *
     * @param stockCode the value for trade_history.stock_code
     */
    public void setStockCode(String stockCode) {
        this.stockCode = stockCode;
    }

    /**
     * 获得字段 trade_history.stock_name 的值
     *
     * @return the value of trade_history.stock_name
     */
    public String getStockName() {
        return stockName;
    }

    /**
     * 设置字段 trade_history.stock_name 的值
     *
     * @param stockName the value for trade_history.stock_name
     */
    public void setStockName(String stockName) {
        this.stockName = stockName;
    }

    /**
     * 获得字段 trade_history.stock_full_name 的值
     *
     * @return the value of trade_history.stock_full_name
     */
    public String getStockFullName() {
        return stockFullName;
    }

    /**
     * 设置字段 trade_history.stock_full_name 的值
     *
     * @param stockFullName the value for trade_history.stock_full_name
     */
    public void setStockFullName(String stockFullName) {
        this.stockFullName = stockFullName;
    }

    /**
     * 获得字段 trade_history.amount 的值
     *
     * @return the value of trade_history.amount
     */
    public Long getAmount() {
        return amount;
    }

    /**
     * 设置字段 trade_history.amount 的值
     *
     * @param amount the value for trade_history.amount
     */
    public void setAmount(Long amount) {
        this.amount = amount;
    }

    /**
     * 获得字段 trade_history.price 的值
     *
     * @return the value of trade_history.price
     */
    public Double getPrice() {
        return price;
    }

    /**
     * 设置字段 trade_history.price 的值
     *
     * @param price the value for trade_history.price
     */
    public void setPrice(Double price) {
        this.price = price;
    }

    /**
     * 获得字段 trade_history.cost_price 的值
     *
     * @return the value of trade_history.cost_price
     */
    public Double getCostPrice() {
        return costPrice;
    }

    /**
     * 设置字段 trade_history.cost_price 的值
     *
     * @param costPrice the value for trade_history.cost_price
     */
    public void setCostPrice(Double costPrice) {
        this.costPrice = costPrice;
    }

    /**
     * 获得字段 trade_history.total_amount 的值
     *
     * @return the value of trade_history.total_amount
     */
    public Double getTotalAmount() {
        return totalAmount;
    }

    /**
     * 设置字段 trade_history.total_amount 的值
     *
     * @param totalAmount the value for trade_history.total_amount
     */
    public void setTotalAmount(Double totalAmount) {
        this.totalAmount = totalAmount;
    }

    /**
     * 获得字段 trade_history.trade_amount 的值
     *
     * @return the value of trade_history.trade_amount
     */
    public Double getTradeAmount() {
        return tradeAmount;
    }

    /**
     * 设置字段 trade_history.trade_amount 的值
     *
     * @param tradeAmount the value for trade_history.trade_amount
     */
    public void setTradeAmount(Double tradeAmount) {
        this.tradeAmount = tradeAmount;
    }

    /**
     * 获得字段 trade_history.trade_commission 的值
     *
     * @return the value of trade_history.trade_commission
     */
    public Double getTradeCommission() {
        return tradeCommission;
    }

    /**
     * 设置字段 trade_history.trade_commission 的值
     *
     * @param tradeCommission the value for trade_history.trade_commission
     */
    public void setTradeCommission(Double tradeCommission) {
        this.tradeCommission = tradeCommission;
    }

    /**
     * 获得字段 trade_history.type 的值
     *
     * @return the value of trade_history.type
     */
    public Integer getType() {
        return type;
    }

    /**
     * 设置字段 trade_history.type 的值
     *
     * @param type the value for trade_history.type
     */
    public void setType(Integer type) {
        this.type = type;
    }

    /**
     * 获得字段 trade_history.exchange 的值
     *
     * @return the value of trade_history.exchange
     */
    public Integer getExchange() {
        return exchange;
    }

    /**
     * 设置字段 trade_history.exchange 的值
     *
     * @param exchange the value for trade_history.exchange
     */
    public void setExchange(Integer exchange) {
        this.exchange = exchange;
    }

    /**
     * 获得字段 trade_history.exchange_name 的值
     *
     * @return the value of trade_history.exchange_name
     */
    public String getExchangeName() {
        return exchangeName;
    }

    /**
     * 设置字段 trade_history.exchange_name 的值
     *
     * @param exchangeName the value for trade_history.exchange_name
     */
    public void setExchangeName(String exchangeName) {
        this.exchangeName = exchangeName;
    }

    /**
     * 获得字段 trade_history.trade_date 的值
     *
     * @return the value of trade_history.trade_date
     */
    public Date getTradeDate() {
        return tradeDate;
    }

    /**
     * 设置字段 trade_history.trade_date 的值
     *
     * @param tradeDate the value for trade_history.trade_date
     */
    public void setTradeDate(Date tradeDate) {
        this.tradeDate = tradeDate;
    }
}