package com.vteba.xunxun.user.dao.impl;

import javax.inject.Inject;
import javax.inject.Named;

import org.hibernate.SessionFactory;

import com.vteba.service.tenant.annotation.Schema;
import com.vteba.tx.hibernate.impl.BaseGenericDaoImpl;
import com.vteba.xunxun.user.dao.spi.IEmpUserDao;
import com.vteba.xunxun.user.model.EmpUser;

/**
 * 用户管理DAO实现
 * @author yinlei
 * date 2012-4-1 下午9:23:48
 */
@Named
@Schema(name = "skmbw")
public class EmpUserDaoImpl extends BaseGenericDaoImpl<EmpUser, Long>
		implements IEmpUserDao {

	public EmpUserDaoImpl() {
		super();
	}

	public EmpUserDaoImpl(Class<EmpUser> entityClass) {
		super(entityClass);
	}
	
	@Inject
	public void setSessionFactory(SessionFactory xunxunSessionFactory) {
		this.sessionFactory = xunxunSessionFactory;
	}

}
