package com.vteba.xunxun.stock.service.impl;

import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import com.vteba.xunxun.stock.dao.DailyProfitDao;
import com.vteba.xunxun.stock.model.DailyProfit;
import com.vteba.xunxun.stock.model.DailyProfitBean;
import com.vteba.xunxun.stock.service.spi.DailyProfitService;

/**
 * 每日盈亏相关的service业务实现。
 * @author yinlei
 * @date 2015-3-9 15:23:43
 */
@Named
public class DailyProfitServiceImpl implements DailyProfitService {
	
	@Inject
	private DailyProfitDao dailyProfitDao;

	@Override
	public int count(DailyProfitBean params) {
		return dailyProfitDao.count(params);
	}

	@Override
	public int deleteBatch(DailyProfitBean params) {
		return dailyProfitDao.deleteBatch(params);
	}

	@Override
	public int deleteById(Long id) {
		return dailyProfitDao.deleteById(id);
	}

	@Override
	public int save(DailyProfit record) {
		return dailyProfitDao.save(record);
	}

	@Override
	public List<DailyProfit> queryForList(DailyProfitBean params) {
		return dailyProfitDao.queryForList(params);
	}

	@Override
	public DailyProfit get(Long id) {
		return dailyProfitDao.get(id);
	}
	
	@Override
	public DailyProfit unique(DailyProfit params) {
		return dailyProfitDao.unique(params);
	}

	@Override
	public int updateBatch(DailyProfit record, DailyProfitBean params) {
		return dailyProfitDao.updateBatch(record, params);
	}

	@Override
	public int updateById(DailyProfit record) {
		return dailyProfitDao.updateById(record);
	}

    @Override
    public int countBy(DailyProfit params) {
        return dailyProfitDao.countBy(params);
    }

    @Override
    public int deleteBulks(DailyProfit params) {
        return dailyProfitDao.deleteBulks(params);
    }

    @Override
    public List<DailyProfit> queryList(DailyProfit params) {
        return dailyProfitDao.queryList(params);
    }

    @Override
    public List<DailyProfit> pagedForList(DailyProfitBean params) {
        return dailyProfitDao.pagedForList(params);
    }

    @Override
    public List<DailyProfit> pagedList(DailyProfit params) {
        return dailyProfitDao.pagedList(params);
    }

    @Override
    public int updateBulks(DailyProfit record, DailyProfit params) {
        return dailyProfitDao.updateBulks(record, params);
    }

}
