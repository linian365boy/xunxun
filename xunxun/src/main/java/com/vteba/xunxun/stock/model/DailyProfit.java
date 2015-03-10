package com.vteba.xunxun.stock.model;

import java.util.Date;

public class DailyProfit {
    /**
     * order by 排序语句
     * 对应数据库表字段 daily_profit
     */
    private String orderBy;

    /**
     * 分页开始记录
     * 对应数据库表字段 daily_profit
     */
    private Integer start;

    /**
     * 分页大小
     * 对应数据库表字段 daily_profit
     */
    private int pageSize = 10;

    /**
     * 是否去重
     * 对应数据库表字段 daily_profit
     */
    private boolean distinct;

    /**
     * 对应数据库表字段 daily_profit.id
     */
    private Long id;

    /**
     * 对应数据库表字段 daily_profit.user_account
     */
    private String userAccount;

    /**
     * 对应数据库表字段 daily_profit.stock_code
     */
    private String stockCode;

    /**
     * 对应数据库表字段 daily_profit.stock_name
     */
    private String stockName;

    /**
     * 对应数据库表字段 daily_profit.holding_amount
     */
    private Long holdingAmount;

    /**
     * 对应数据库表字段 daily_profit.opening_price
     */
    private Double openingPrice;

    /**
     * 对应数据库表字段 daily_profit.closing_price
     */
    private Double closingPrice;

    /**
     * 对应数据库表字段 daily_profit.price_difference
     */
    private Double priceDifference;

    /**
     * 对应数据库表字段 daily_profit.profit
     */
    private Double profit;

    /**
     * 对应数据库表字段 daily_profit.profit_rate
     */
    private Double profitRate;

    /**
     * 对应数据库表字段 daily_profit.trade_date
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
     * 获得字段 daily_profit.id 的值
     *
     * @return the value of daily_profit.id
     */
    public Long getId() {
        return id;
    }

    /**
     * 设置字段 daily_profit.id 的值
     *
     * @param id the value for daily_profit.id
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * 获得字段 daily_profit.user_account 的值
     *
     * @return the value of daily_profit.user_account
     */
    public String getUserAccount() {
        return userAccount;
    }

    /**
     * 设置字段 daily_profit.user_account 的值
     *
     * @param userAccount the value for daily_profit.user_account
     */
    public void setUserAccount(String userAccount) {
        this.userAccount = userAccount;
    }

    /**
     * 获得字段 daily_profit.stock_code 的值
     *
     * @return the value of daily_profit.stock_code
     */
    public String getStockCode() {
        return stockCode;
    }

    /**
     * 设置字段 daily_profit.stock_code 的值
     *
     * @param stockCode the value for daily_profit.stock_code
     */
    public void setStockCode(String stockCode) {
        this.stockCode = stockCode;
    }

    /**
     * 获得字段 daily_profit.stock_name 的值
     *
     * @return the value of daily_profit.stock_name
     */
    public String getStockName() {
        return stockName;
    }

    /**
     * 设置字段 daily_profit.stock_name 的值
     *
     * @param stockName the value for daily_profit.stock_name
     */
    public void setStockName(String stockName) {
        this.stockName = stockName;
    }

    /**
     * 获得字段 daily_profit.holding_amount 的值
     *
     * @return the value of daily_profit.holding_amount
     */
    public Long getHoldingAmount() {
        return holdingAmount;
    }

    /**
     * 设置字段 daily_profit.holding_amount 的值
     *
     * @param holdingAmount the value for daily_profit.holding_amount
     */
    public void setHoldingAmount(Long holdingAmount) {
        this.holdingAmount = holdingAmount;
    }

    /**
     * 获得字段 daily_profit.opening_price 的值
     *
     * @return the value of daily_profit.opening_price
     */
    public Double getOpeningPrice() {
        return openingPrice;
    }

    /**
     * 设置字段 daily_profit.opening_price 的值
     *
     * @param openingPrice the value for daily_profit.opening_price
     */
    public void setOpeningPrice(Double openingPrice) {
        this.openingPrice = openingPrice;
    }

    /**
     * 获得字段 daily_profit.closing_price 的值
     *
     * @return the value of daily_profit.closing_price
     */
    public Double getClosingPrice() {
        return closingPrice;
    }

    /**
     * 设置字段 daily_profit.closing_price 的值
     *
     * @param closingPrice the value for daily_profit.closing_price
     */
    public void setClosingPrice(Double closingPrice) {
        this.closingPrice = closingPrice;
    }

    /**
     * 获得字段 daily_profit.price_difference 的值
     *
     * @return the value of daily_profit.price_difference
     */
    public Double getPriceDifference() {
        return priceDifference;
    }

    /**
     * 设置字段 daily_profit.price_difference 的值
     *
     * @param priceDifference the value for daily_profit.price_difference
     */
    public void setPriceDifference(Double priceDifference) {
        this.priceDifference = priceDifference;
    }

    /**
     * 获得字段 daily_profit.profit 的值
     *
     * @return the value of daily_profit.profit
     */
    public Double getProfit() {
        return profit;
    }

    /**
     * 设置字段 daily_profit.profit 的值
     *
     * @param profit the value for daily_profit.profit
     */
    public void setProfit(Double profit) {
        this.profit = profit;
    }

    /**
     * 获得字段 daily_profit.profit_rate 的值
     *
     * @return the value of daily_profit.profit_rate
     */
    public Double getProfitRate() {
        return profitRate;
    }

    /**
     * 设置字段 daily_profit.profit_rate 的值
     *
     * @param profitRate the value for daily_profit.profit_rate
     */
    public void setProfitRate(Double profitRate) {
        this.profitRate = profitRate;
    }

    /**
     * 获得字段 daily_profit.trade_date 的值
     *
     * @return the value of daily_profit.trade_date
     */
    public Date getTradeDate() {
        return tradeDate;
    }

    /**
     * 设置字段 daily_profit.trade_date 的值
     *
     * @param tradeDate the value for daily_profit.trade_date
     */
    public void setTradeDate(Date tradeDate) {
        this.tradeDate = tradeDate;
    }
}