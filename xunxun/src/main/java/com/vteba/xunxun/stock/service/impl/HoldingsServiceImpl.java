package com.vteba.xunxun.stock.service.impl;

import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import com.vteba.xunxun.stock.dao.HoldingsDao;
import com.vteba.xunxun.stock.model.Holdings;
import com.vteba.xunxun.stock.model.HoldingsBean;
import com.vteba.xunxun.stock.service.spi.HoldingsService;

/**
 * 持仓相关的service业务实现。
 * @author yinlei
 * @date 2015-3-9 15:23:42
 */
@Named
public class HoldingsServiceImpl implements HoldingsService {
	
	@Inject
	private HoldingsDao holdingsDao;

	@Override
	public int count(HoldingsBean params) {
		return holdingsDao.count(params);
	}

	@Override
	public int deleteBatch(HoldingsBean params) {
		return holdingsDao.deleteBatch(params);
	}

	@Override
	public int deleteById(Long id) {
		return holdingsDao.deleteById(id);
	}

	@Override
	public int save(Holdings record) {
		return holdingsDao.save(record);
	}

	@Override
	public List<Holdings> queryForList(HoldingsBean params) {
		return holdingsDao.queryForList(params);
	}

	@Override
	public Holdings get(Long id) {
		return holdingsDao.get(id);
	}
	
	@Override
	public Holdings unique(Holdings params) {
		return holdingsDao.unique(params);
	}

	@Override
	public int updateBatch(Holdings record, HoldingsBean params) {
		return holdingsDao.updateBatch(record, params);
	}

	@Override
	public int updateById(Holdings record) {
		return holdingsDao.updateById(record);
	}

    @Override
    public int countBy(Holdings params) {
        return holdingsDao.countBy(params);
    }

    @Override
    public int deleteBulks(Holdings params) {
        return holdingsDao.deleteBulks(params);
    }

    @Override
    public List<Holdings> queryList(Holdings params) {
        return holdingsDao.queryList(params);
    }

    @Override
    public List<Holdings> pagedForList(HoldingsBean params) {
        return holdingsDao.pagedForList(params);
    }

    @Override
    public List<Holdings> pagedList(Holdings params) {
        return holdingsDao.pagedList(params);
    }

    @Override
    public int updateBulks(Holdings record, Holdings params) {
        return holdingsDao.updateBulks(record, params);
    }

}
