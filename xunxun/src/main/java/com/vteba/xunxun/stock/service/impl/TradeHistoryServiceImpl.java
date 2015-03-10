package com.vteba.xunxun.stock.service.impl;

import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import com.vteba.xunxun.stock.dao.TradeHistoryDao;
import com.vteba.xunxun.stock.model.TradeHistory;
import com.vteba.xunxun.stock.model.TradeHistoryBean;
import com.vteba.xunxun.stock.service.spi.TradeHistoryService;

/**
 * 股票交易历史相关的service业务实现。
 * @author yinlei
 * @date 2015-3-9 15:23:43
 */
@Named
public class TradeHistoryServiceImpl implements TradeHistoryService {
	
	@Inject
	private TradeHistoryDao tradeHistoryDao;

	@Override
	public int count(TradeHistoryBean params) {
		return tradeHistoryDao.count(params);
	}

	@Override
	public int deleteBatch(TradeHistoryBean params) {
		return tradeHistoryDao.deleteBatch(params);
	}

	@Override
	public int deleteById(Long id) {
		return tradeHistoryDao.deleteById(id);
	}

	@Override
	public int save(TradeHistory record) {
		return tradeHistoryDao.save(record);
	}

	@Override
	public List<TradeHistory> queryForList(TradeHistoryBean params) {
		return tradeHistoryDao.queryForList(params);
	}

	@Override
	public TradeHistory get(Long id) {
		return tradeHistoryDao.get(id);
	}
	
	@Override
	public TradeHistory unique(TradeHistory params) {
		return tradeHistoryDao.unique(params);
	}

	@Override
	public int updateBatch(TradeHistory record, TradeHistoryBean params) {
		return tradeHistoryDao.updateBatch(record, params);
	}

	@Override
	public int updateById(TradeHistory record) {
		return tradeHistoryDao.updateById(record);
	}

    @Override
    public int countBy(TradeHistory params) {
        return tradeHistoryDao.countBy(params);
    }

    @Override
    public int deleteBulks(TradeHistory params) {
        return tradeHistoryDao.deleteBulks(params);
    }

    @Override
    public List<TradeHistory> queryList(TradeHistory params) {
        return tradeHistoryDao.queryList(params);
    }

    @Override
    public List<TradeHistory> pagedForList(TradeHistoryBean params) {
        return tradeHistoryDao.pagedForList(params);
    }

    @Override
    public List<TradeHistory> pagedList(TradeHistory params) {
        return tradeHistoryDao.pagedList(params);
    }

    @Override
    public int updateBulks(TradeHistory record, TradeHistory params) {
        return tradeHistoryDao.updateBulks(record, params);
    }

}
