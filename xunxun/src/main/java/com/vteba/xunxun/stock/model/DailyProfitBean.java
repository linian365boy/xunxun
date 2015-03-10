package com.vteba.xunxun.stock.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class DailyProfitBean {
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
     * 是否指定 distinct 去除重复
     * 对应数据库表字段 daily_profit
     */
    private boolean distinct;

    /**
     * 逻辑or语句
     * 对应数据库表字段 daily_profit
     */
    private List<Criteria> oredCriteria;

    /**
     */
    public DailyProfitBean() {
        oredCriteria = new ArrayList<Criteria>();
    }

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
     * 设置是否指定 distinct 去除重复
     */
    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    /**
     * 是否设置了distinct语句，true是，false否。
     */
    public boolean isDistinct() {
        return distinct;
    }

    /**
     * 获得逻辑or语句
     */
    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    /**
     * 添加逻辑or语句
     */
    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    /**
     * 新建逻辑或or语句
     */
    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    /**
     * 创建查询条件，如果逻辑或为空，同时将查询条件放入。
     */
    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    /**
     * 创建新查询条件。
     */
    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    /**
     * 清除逻辑或or语句，并且distinct为false，不去重。
     */
    public void clear() {
        oredCriteria.clear();
    }

    /**
     * 该类对应数据库表 daily_profit
     */
    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        protected void addCriterionForJDBCDate(String condition, Date value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value.getTime()), property);
        }

        protected void addCriterionForJDBCDate(String condition, List<Date> values, String property) {
            if (values == null || values.size() == 0) {
                throw new RuntimeException("Value list for " + property + " cannot be null or empty");
            }
            List<java.sql.Date> dateList = new ArrayList<java.sql.Date>();
            Iterator<Date> iter = values.iterator();
            while (iter.hasNext()) {
                dateList.add(new java.sql.Date(iter.next().getTime()));
            }
            addCriterion(condition, dateList, property);
        }

        protected void addCriterionForJDBCDate(String condition, Date value1, Date value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value1.getTime()), new java.sql.Date(value2.getTime()), property);
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Long value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Long value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Long value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Long value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Long value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Long value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Long> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Long> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Long value1, Long value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Long value1, Long value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andUserAccountIsNull() {
            addCriterion("user_account is null");
            return (Criteria) this;
        }

        public Criteria andUserAccountIsNotNull() {
            addCriterion("user_account is not null");
            return (Criteria) this;
        }

        public Criteria andUserAccountEqualTo(String value) {
            addCriterion("user_account =", value, "userAccount");
            return (Criteria) this;
        }

        public Criteria andUserAccountNotEqualTo(String value) {
            addCriterion("user_account <>", value, "userAccount");
            return (Criteria) this;
        }

        public Criteria andUserAccountGreaterThan(String value) {
            addCriterion("user_account >", value, "userAccount");
            return (Criteria) this;
        }

        public Criteria andUserAccountGreaterThanOrEqualTo(String value) {
            addCriterion("user_account >=", value, "userAccount");
            return (Criteria) this;
        }

        public Criteria andUserAccountLessThan(String value) {
            addCriterion("user_account <", value, "userAccount");
            return (Criteria) this;
        }

        public Criteria andUserAccountLessThanOrEqualTo(String value) {
            addCriterion("user_account <=", value, "userAccount");
            return (Criteria) this;
        }

        public Criteria andUserAccountLike(String value) {
            addCriterion("user_account like", value, "userAccount");
            return (Criteria) this;
        }

        public Criteria andUserAccountNotLike(String value) {
            addCriterion("user_account not like", value, "userAccount");
            return (Criteria) this;
        }

        public Criteria andUserAccountIn(List<String> values) {
            addCriterion("user_account in", values, "userAccount");
            return (Criteria) this;
        }

        public Criteria andUserAccountNotIn(List<String> values) {
            addCriterion("user_account not in", values, "userAccount");
            return (Criteria) this;
        }

        public Criteria andUserAccountBetween(String value1, String value2) {
            addCriterion("user_account between", value1, value2, "userAccount");
            return (Criteria) this;
        }

        public Criteria andUserAccountNotBetween(String value1, String value2) {
            addCriterion("user_account not between", value1, value2, "userAccount");
            return (Criteria) this;
        }

        public Criteria andStockCodeIsNull() {
            addCriterion("stock_code is null");
            return (Criteria) this;
        }

        public Criteria andStockCodeIsNotNull() {
            addCriterion("stock_code is not null");
            return (Criteria) this;
        }

        public Criteria andStockCodeEqualTo(String value) {
            addCriterion("stock_code =", value, "stockCode");
            return (Criteria) this;
        }

        public Criteria andStockCodeNotEqualTo(String value) {
            addCriterion("stock_code <>", value, "stockCode");
            return (Criteria) this;
        }

        public Criteria andStockCodeGreaterThan(String value) {
            addCriterion("stock_code >", value, "stockCode");
            return (Criteria) this;
        }

        public Criteria andStockCodeGreaterThanOrEqualTo(String value) {
            addCriterion("stock_code >=", value, "stockCode");
            return (Criteria) this;
        }

        public Criteria andStockCodeLessThan(String value) {
            addCriterion("stock_code <", value, "stockCode");
            return (Criteria) this;
        }

        public Criteria andStockCodeLessThanOrEqualTo(String value) {
            addCriterion("stock_code <=", value, "stockCode");
            return (Criteria) this;
        }

        public Criteria andStockCodeLike(String value) {
            addCriterion("stock_code like", value, "stockCode");
            return (Criteria) this;
        }

        public Criteria andStockCodeNotLike(String value) {
            addCriterion("stock_code not like", value, "stockCode");
            return (Criteria) this;
        }

        public Criteria andStockCodeIn(List<String> values) {
            addCriterion("stock_code in", values, "stockCode");
            return (Criteria) this;
        }

        public Criteria andStockCodeNotIn(List<String> values) {
            addCriterion("stock_code not in", values, "stockCode");
            return (Criteria) this;
        }

        public Criteria andStockCodeBetween(String value1, String value2) {
            addCriterion("stock_code between", value1, value2, "stockCode");
            return (Criteria) this;
        }

        public Criteria andStockCodeNotBetween(String value1, String value2) {
            addCriterion("stock_code not between", value1, value2, "stockCode");
            return (Criteria) this;
        }

        public Criteria andStockNameIsNull() {
            addCriterion("stock_name is null");
            return (Criteria) this;
        }

        public Criteria andStockNameIsNotNull() {
            addCriterion("stock_name is not null");
            return (Criteria) this;
        }

        public Criteria andStockNameEqualTo(String value) {
            addCriterion("stock_name =", value, "stockName");
            return (Criteria) this;
        }

        public Criteria andStockNameNotEqualTo(String value) {
            addCriterion("stock_name <>", value, "stockName");
            return (Criteria) this;
        }

        public Criteria andStockNameGreaterThan(String value) {
            addCriterion("stock_name >", value, "stockName");
            return (Criteria) this;
        }

        public Criteria andStockNameGreaterThanOrEqualTo(String value) {
            addCriterion("stock_name >=", value, "stockName");
            return (Criteria) this;
        }

        public Criteria andStockNameLessThan(String value) {
            addCriterion("stock_name <", value, "stockName");
            return (Criteria) this;
        }

        public Criteria andStockNameLessThanOrEqualTo(String value) {
            addCriterion("stock_name <=", value, "stockName");
            return (Criteria) this;
        }

        public Criteria andStockNameLike(String value) {
            addCriterion("stock_name like", value, "stockName");
            return (Criteria) this;
        }

        public Criteria andStockNameNotLike(String value) {
            addCriterion("stock_name not like", value, "stockName");
            return (Criteria) this;
        }

        public Criteria andStockNameIn(List<String> values) {
            addCriterion("stock_name in", values, "stockName");
            return (Criteria) this;
        }

        public Criteria andStockNameNotIn(List<String> values) {
            addCriterion("stock_name not in", values, "stockName");
            return (Criteria) this;
        }

        public Criteria andStockNameBetween(String value1, String value2) {
            addCriterion("stock_name between", value1, value2, "stockName");
            return (Criteria) this;
        }

        public Criteria andStockNameNotBetween(String value1, String value2) {
            addCriterion("stock_name not between", value1, value2, "stockName");
            return (Criteria) this;
        }

        public Criteria andHoldingAmountIsNull() {
            addCriterion("holding_amount is null");
            return (Criteria) this;
        }

        public Criteria andHoldingAmountIsNotNull() {
            addCriterion("holding_amount is not null");
            return (Criteria) this;
        }

        public Criteria andHoldingAmountEqualTo(Long value) {
            addCriterion("holding_amount =", value, "holdingAmount");
            return (Criteria) this;
        }

        public Criteria andHoldingAmountNotEqualTo(Long value) {
            addCriterion("holding_amount <>", value, "holdingAmount");
            return (Criteria) this;
        }

        public Criteria andHoldingAmountGreaterThan(Long value) {
            addCriterion("holding_amount >", value, "holdingAmount");
            return (Criteria) this;
        }

        public Criteria andHoldingAmountGreaterThanOrEqualTo(Long value) {
            addCriterion("holding_amount >=", value, "holdingAmount");
            return (Criteria) this;
        }

        public Criteria andHoldingAmountLessThan(Long value) {
            addCriterion("holding_amount <", value, "holdingAmount");
            return (Criteria) this;
        }

        public Criteria andHoldingAmountLessThanOrEqualTo(Long value) {
            addCriterion("holding_amount <=", value, "holdingAmount");
            return (Criteria) this;
        }

        public Criteria andHoldingAmountIn(List<Long> values) {
            addCriterion("holding_amount in", values, "holdingAmount");
            return (Criteria) this;
        }

        public Criteria andHoldingAmountNotIn(List<Long> values) {
            addCriterion("holding_amount not in", values, "holdingAmount");
            return (Criteria) this;
        }

        public Criteria andHoldingAmountBetween(Long value1, Long value2) {
            addCriterion("holding_amount between", value1, value2, "holdingAmount");
            return (Criteria) this;
        }

        public Criteria andHoldingAmountNotBetween(Long value1, Long value2) {
            addCriterion("holding_amount not between", value1, value2, "holdingAmount");
            return (Criteria) this;
        }

        public Criteria andOpeningPriceIsNull() {
            addCriterion("opening_price is null");
            return (Criteria) this;
        }

        public Criteria andOpeningPriceIsNotNull() {
            addCriterion("opening_price is not null");
            return (Criteria) this;
        }

        public Criteria andOpeningPriceEqualTo(Double value) {
            addCriterion("opening_price =", value, "openingPrice");
            return (Criteria) this;
        }

        public Criteria andOpeningPriceNotEqualTo(Double value) {
            addCriterion("opening_price <>", value, "openingPrice");
            return (Criteria) this;
        }

        public Criteria andOpeningPriceGreaterThan(Double value) {
            addCriterion("opening_price >", value, "openingPrice");
            return (Criteria) this;
        }

        public Criteria andOpeningPriceGreaterThanOrEqualTo(Double value) {
            addCriterion("opening_price >=", value, "openingPrice");
            return (Criteria) this;
        }

        public Criteria andOpeningPriceLessThan(Double value) {
            addCriterion("opening_price <", value, "openingPrice");
            return (Criteria) this;
        }

        public Criteria andOpeningPriceLessThanOrEqualTo(Double value) {
            addCriterion("opening_price <=", value, "openingPrice");
            return (Criteria) this;
        }

        public Criteria andOpeningPriceIn(List<Double> values) {
            addCriterion("opening_price in", values, "openingPrice");
            return (Criteria) this;
        }

        public Criteria andOpeningPriceNotIn(List<Double> values) {
            addCriterion("opening_price not in", values, "openingPrice");
            return (Criteria) this;
        }

        public Criteria andOpeningPriceBetween(Double value1, Double value2) {
            addCriterion("opening_price between", value1, value2, "openingPrice");
            return (Criteria) this;
        }

        public Criteria andOpeningPriceNotBetween(Double value1, Double value2) {
            addCriterion("opening_price not between", value1, value2, "openingPrice");
            return (Criteria) this;
        }

        public Criteria andClosingPriceIsNull() {
            addCriterion("closing_price is null");
            return (Criteria) this;
        }

        public Criteria andClosingPriceIsNotNull() {
            addCriterion("closing_price is not null");
            return (Criteria) this;
        }

        public Criteria andClosingPriceEqualTo(Double value) {
            addCriterion("closing_price =", value, "closingPrice");
            return (Criteria) this;
        }

        public Criteria andClosingPriceNotEqualTo(Double value) {
            addCriterion("closing_price <>", value, "closingPrice");
            return (Criteria) this;
        }

        public Criteria andClosingPriceGreaterThan(Double value) {
            addCriterion("closing_price >", value, "closingPrice");
            return (Criteria) this;
        }

        public Criteria andClosingPriceGreaterThanOrEqualTo(Double value) {
            addCriterion("closing_price >=", value, "closingPrice");
            return (Criteria) this;
        }

        public Criteria andClosingPriceLessThan(Double value) {
            addCriterion("closing_price <", value, "closingPrice");
            return (Criteria) this;
        }

        public Criteria andClosingPriceLessThanOrEqualTo(Double value) {
            addCriterion("closing_price <=", value, "closingPrice");
            return (Criteria) this;
        }

        public Criteria andClosingPriceIn(List<Double> values) {
            addCriterion("closing_price in", values, "closingPrice");
            return (Criteria) this;
        }

        public Criteria andClosingPriceNotIn(List<Double> values) {
            addCriterion("closing_price not in", values, "closingPrice");
            return (Criteria) this;
        }

        public Criteria andClosingPriceBetween(Double value1, Double value2) {
            addCriterion("closing_price between", value1, value2, "closingPrice");
            return (Criteria) this;
        }

        public Criteria andClosingPriceNotBetween(Double value1, Double value2) {
            addCriterion("closing_price not between", value1, value2, "closingPrice");
            return (Criteria) this;
        }

        public Criteria andPriceDifferenceIsNull() {
            addCriterion("price_difference is null");
            return (Criteria) this;
        }

        public Criteria andPriceDifferenceIsNotNull() {
            addCriterion("price_difference is not null");
            return (Criteria) this;
        }

        public Criteria andPriceDifferenceEqualTo(Double value) {
            addCriterion("price_difference =", value, "priceDifference");
            return (Criteria) this;
        }

        public Criteria andPriceDifferenceNotEqualTo(Double value) {
            addCriterion("price_difference <>", value, "priceDifference");
            return (Criteria) this;
        }

        public Criteria andPriceDifferenceGreaterThan(Double value) {
            addCriterion("price_difference >", value, "priceDifference");
            return (Criteria) this;
        }

        public Criteria andPriceDifferenceGreaterThanOrEqualTo(Double value) {
            addCriterion("price_difference >=", value, "priceDifference");
            return (Criteria) this;
        }

        public Criteria andPriceDifferenceLessThan(Double value) {
            addCriterion("price_difference <", value, "priceDifference");
            return (Criteria) this;
        }

        public Criteria andPriceDifferenceLessThanOrEqualTo(Double value) {
            addCriterion("price_difference <=", value, "priceDifference");
            return (Criteria) this;
        }

        public Criteria andPriceDifferenceIn(List<Double> values) {
            addCriterion("price_difference in", values, "priceDifference");
            return (Criteria) this;
        }

        public Criteria andPriceDifferenceNotIn(List<Double> values) {
            addCriterion("price_difference not in", values, "priceDifference");
            return (Criteria) this;
        }

        public Criteria andPriceDifferenceBetween(Double value1, Double value2) {
            addCriterion("price_difference between", value1, value2, "priceDifference");
            return (Criteria) this;
        }

        public Criteria andPriceDifferenceNotBetween(Double value1, Double value2) {
            addCriterion("price_difference not between", value1, value2, "priceDifference");
            return (Criteria) this;
        }

        public Criteria andProfitIsNull() {
            addCriterion("profit is null");
            return (Criteria) this;
        }

        public Criteria andProfitIsNotNull() {
            addCriterion("profit is not null");
            return (Criteria) this;
        }

        public Criteria andProfitEqualTo(Double value) {
            addCriterion("profit =", value, "profit");
            return (Criteria) this;
        }

        public Criteria andProfitNotEqualTo(Double value) {
            addCriterion("profit <>", value, "profit");
            return (Criteria) this;
        }

        public Criteria andProfitGreaterThan(Double value) {
            addCriterion("profit >", value, "profit");
            return (Criteria) this;
        }

        public Criteria andProfitGreaterThanOrEqualTo(Double value) {
            addCriterion("profit >=", value, "profit");
            return (Criteria) this;
        }

        public Criteria andProfitLessThan(Double value) {
            addCriterion("profit <", value, "profit");
            return (Criteria) this;
        }

        public Criteria andProfitLessThanOrEqualTo(Double value) {
            addCriterion("profit <=", value, "profit");
            return (Criteria) this;
        }

        public Criteria andProfitIn(List<Double> values) {
            addCriterion("profit in", values, "profit");
            return (Criteria) this;
        }

        public Criteria andProfitNotIn(List<Double> values) {
            addCriterion("profit not in", values, "profit");
            return (Criteria) this;
        }

        public Criteria andProfitBetween(Double value1, Double value2) {
            addCriterion("profit between", value1, value2, "profit");
            return (Criteria) this;
        }

        public Criteria andProfitNotBetween(Double value1, Double value2) {
            addCriterion("profit not between", value1, value2, "profit");
            return (Criteria) this;
        }

        public Criteria andProfitRateIsNull() {
            addCriterion("profit_rate is null");
            return (Criteria) this;
        }

        public Criteria andProfitRateIsNotNull() {
            addCriterion("profit_rate is not null");
            return (Criteria) this;
        }

        public Criteria andProfitRateEqualTo(Double value) {
            addCriterion("profit_rate =", value, "profitRate");
            return (Criteria) this;
        }

        public Criteria andProfitRateNotEqualTo(Double value) {
            addCriterion("profit_rate <>", value, "profitRate");
            return (Criteria) this;
        }

        public Criteria andProfitRateGreaterThan(Double value) {
            addCriterion("profit_rate >", value, "profitRate");
            return (Criteria) this;
        }

        public Criteria andProfitRateGreaterThanOrEqualTo(Double value) {
            addCriterion("profit_rate >=", value, "profitRate");
            return (Criteria) this;
        }

        public Criteria andProfitRateLessThan(Double value) {
            addCriterion("profit_rate <", value, "profitRate");
            return (Criteria) this;
        }

        public Criteria andProfitRateLessThanOrEqualTo(Double value) {
            addCriterion("profit_rate <=", value, "profitRate");
            return (Criteria) this;
        }

        public Criteria andProfitRateIn(List<Double> values) {
            addCriterion("profit_rate in", values, "profitRate");
            return (Criteria) this;
        }

        public Criteria andProfitRateNotIn(List<Double> values) {
            addCriterion("profit_rate not in", values, "profitRate");
            return (Criteria) this;
        }

        public Criteria andProfitRateBetween(Double value1, Double value2) {
            addCriterion("profit_rate between", value1, value2, "profitRate");
            return (Criteria) this;
        }

        public Criteria andProfitRateNotBetween(Double value1, Double value2) {
            addCriterion("profit_rate not between", value1, value2, "profitRate");
            return (Criteria) this;
        }

        public Criteria andTradeDateIsNull() {
            addCriterion("trade_date is null");
            return (Criteria) this;
        }

        public Criteria andTradeDateIsNotNull() {
            addCriterion("trade_date is not null");
            return (Criteria) this;
        }

        public Criteria andTradeDateEqualTo(Date value) {
            addCriterionForJDBCDate("trade_date =", value, "tradeDate");
            return (Criteria) this;
        }

        public Criteria andTradeDateNotEqualTo(Date value) {
            addCriterionForJDBCDate("trade_date <>", value, "tradeDate");
            return (Criteria) this;
        }

        public Criteria andTradeDateGreaterThan(Date value) {
            addCriterionForJDBCDate("trade_date >", value, "tradeDate");
            return (Criteria) this;
        }

        public Criteria andTradeDateGreaterThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("trade_date >=", value, "tradeDate");
            return (Criteria) this;
        }

        public Criteria andTradeDateLessThan(Date value) {
            addCriterionForJDBCDate("trade_date <", value, "tradeDate");
            return (Criteria) this;
        }

        public Criteria andTradeDateLessThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("trade_date <=", value, "tradeDate");
            return (Criteria) this;
        }

        public Criteria andTradeDateIn(List<Date> values) {
            addCriterionForJDBCDate("trade_date in", values, "tradeDate");
            return (Criteria) this;
        }

        public Criteria andTradeDateNotIn(List<Date> values) {
            addCriterionForJDBCDate("trade_date not in", values, "tradeDate");
            return (Criteria) this;
        }

        public Criteria andTradeDateBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("trade_date between", value1, value2, "tradeDate");
            return (Criteria) this;
        }

        public Criteria andTradeDateNotBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("trade_date not between", value1, value2, "tradeDate");
            return (Criteria) this;
        }
    }

    /**
     * 该类对应数据库表 daily_profit
     */
    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    /**
     * 该类对应数据库表 daily_profit
     */
    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}