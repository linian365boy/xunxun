package com.vteba.xunxun.user.service.impl;

import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import com.vteba.xunxun.user.dao.UserDao;
import com.vteba.xunxun.user.model.User;
import com.vteba.xunxun.user.model.UserBean;
import com.vteba.xunxun.user.service.spi.UserService;

/**
 * 用户信息相关的service业务实现。
 * @author yinlei
 * @date 2015-2-28 13:00:38
 */
@Named
public class UserServiceImpl implements UserService {
	
	@Inject
	private UserDao userDao;

	@Override
	public int count(UserBean params) {
		return userDao.count(params);
	}

	@Override
	public int deleteBatch(UserBean params) {
		return userDao.deleteBatch(params);
	}

	@Override
	public int deleteById(String id) {
		return userDao.deleteById(id);
	}

	@Override
	public int save(User record) {
		return userDao.save(record);
	}

	@Override
	public List<User> queryForList(UserBean params) {
		return userDao.queryForList(params);
	}

	@Override
	public User get(String id) {
		return userDao.get(id);
	}
	
	@Override
	public User unique(User params) {
		return userDao.unique(params);
	}

	@Override
	public int updateBatch(User record, UserBean params) {
		return userDao.updateBatch(record, params);
	}

	@Override
	public int updateById(User record) {
		return userDao.updateById(record);
	}

    @Override
    public int countBy(User params) {
        return userDao.countBy(params);
    }

    @Override
    public int deleteBulks(User params) {
        return userDao.deleteBulks(params);
    }

    @Override
    public List<User> queryList(User params) {
        return userDao.queryList(params);
    }

    @Override
    public List<User> pagedForList(UserBean params) {
        return userDao.pagedForList(params);
    }

    @Override
    public List<User> pagedList(User params) {
        return userDao.pagedList(params);
    }

    @Override
    public int updateBulks(User record, User params) {
        return userDao.updateBulks(record, params);
    }

}
