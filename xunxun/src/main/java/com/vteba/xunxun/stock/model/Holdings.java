package com.vteba.xunxun.stock.model;

public class Holdings {
    /**
     * order by 排序语句
     * 对应数据库表字段 holdings
     */
    private String orderBy;

    /**
     * 分页开始记录
     * 对应数据库表字段 holdings
     */
    private Integer start;

    /**
     * 分页大小
     * 对应数据库表字段 holdings
     */
    private int pageSize = 10;

    /**
     * 是否去重
     * 对应数据库表字段 holdings
     */
    private boolean distinct;

    /**
     * 对应数据库表字段 holdings.id
     */
    private Long id;

    /**
     * 对应数据库表字段 holdings.user_account
     */
    private String userAccount;

    /**
     * 对应数据库表字段 holdings.stock_code
     */
    private String stockCode;

    /**
     * 对应数据库表字段 holdings.stock_name
     */
    private String stockName;

    /**
     * 对应数据库表字段 holdings.holding_amount
     */
    private Long holdingAmount;

    /**
     * 对应数据库表字段 holdings.available_amount
     */
    private Long availableAmount;

    /**
     * 对应数据库表字段 holdings.price
     */
    private Double price;

    /**
     * 对应数据库表字段 holdings.cost_price
     */
    private Double costPrice;

    /**
     * 对应数据库表字段 holdings.market_value
     */
    private Double marketValue;

    /**
     * 对应数据库表字段 holdings.profit
     */
    private Double profit;

    /**
     * 对应数据库表字段 holdings.profit_rate
     */
    private Double profitRate;

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
     * 获得字段 holdings.id 的值
     *
     * @return the value of holdings.id
     */
    public Long getId() {
        return id;
    }

    /**
     * 设置字段 holdings.id 的值
     *
     * @param id the value for holdings.id
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * 获得字段 holdings.user_account 的值
     *
     * @return the value of holdings.user_account
     */
    public String getUserAccount() {
        return userAccount;
    }

    /**
     * 设置字段 holdings.user_account 的值
     *
     * @param userAccount the value for holdings.user_account
     */
    public void setUserAccount(String userAccount) {
        this.userAccount = userAccount;
    }

    /**
     * 获得字段 holdings.stock_code 的值
     *
     * @return the value of holdings.stock_code
     */
    public String getStockCode() {
        return stockCode;
    }

    /**
     * 设置字段 holdings.stock_code 的值
     *
     * @param stockCode the value for holdings.stock_code
     */
    public void setStockCode(String stockCode) {
        this.stockCode = stockCode;
    }

    /**
     * 获得字段 holdings.stock_name 的值
     *
     * @return the value of holdings.stock_name
     */
    public String getStockName() {
        return stockName;
    }

    /**
     * 设置字段 holdings.stock_name 的值
     *
     * @param stockName the value for holdings.stock_name
     */
    public void setStockName(String stockName) {
        this.stockName = stockName;
    }

    /**
     * 获得字段 holdings.holding_amount 的值
     *
     * @return the value of holdings.holding_amount
     */
    public Long getHoldingAmount() {
        return holdingAmount;
    }

    /**
     * 设置字段 holdings.holding_amount 的值
     *
     * @param holdingAmount the value for holdings.holding_amount
     */
    public void setHoldingAmount(Long holdingAmount) {
        this.holdingAmount = holdingAmount;
    }

    /**
     * 获得字段 holdings.available_amount 的值
     *
     * @return the value of holdings.available_amount
     */
    public Long getAvailableAmount() {
        return availableAmount;
    }

    /**
     * 设置字段 holdings.available_amount 的值
     *
     * @param availableAmount the value for holdings.available_amount
     */
    public void setAvailableAmount(Long availableAmount) {
        this.availableAmount = availableAmount;
    }

    /**
     * 获得字段 holdings.price 的值
     *
     * @return the value of holdings.price
     */
    public Double getPrice() {
        return price;
    }

    /**
     * 设置字段 holdings.price 的值
     *
     * @param price the value for holdings.price
     */
    public void setPrice(Double price) {
        this.price = price;
    }

    /**
     * 获得字段 holdings.cost_price 的值
     *
     * @return the value of holdings.cost_price
     */
    public Double getCostPrice() {
        return costPrice;
    }

    /**
     * 设置字段 holdings.cost_price 的值
     *
     * @param costPrice the value for holdings.cost_price
     */
    public void setCostPrice(Double costPrice) {
        this.costPrice = costPrice;
    }

    /**
     * 获得字段 holdings.market_value 的值
     *
     * @return the value of holdings.market_value
     */
    public Double getMarketValue() {
        return marketValue;
    }

    /**
     * 设置字段 holdings.market_value 的值
     *
     * @param marketValue the value for holdings.market_value
     */
    public void setMarketValue(Double marketValue) {
        this.marketValue = marketValue;
    }

    /**
     * 获得字段 holdings.profit 的值
     *
     * @return the value of holdings.profit
     */
    public Double getProfit() {
        return profit;
    }

    /**
     * 设置字段 holdings.profit 的值
     *
     * @param profit the value for holdings.profit
     */
    public void setProfit(Double profit) {
        this.profit = profit;
    }

    /**
     * 获得字段 holdings.profit_rate 的值
     *
     * @return the value of holdings.profit_rate
     */
    public Double getProfitRate() {
        return profitRate;
    }

    /**
     * 设置字段 holdings.profit_rate 的值
     *
     * @param profitRate the value for holdings.profit_rate
     */
    public void setProfitRate(Double profitRate) {
        this.profitRate = profitRate;
    }
}