package com.vteba.xunxun.user.dao.impl;

import javax.inject.Inject;
import javax.inject.Named;

import org.hibernate.SessionFactory;

import com.vteba.tx.hibernate.impl.BaseGenericDaoImpl;
import com.vteba.xunxun.user.dao.spi.IRolesDao;
import com.vteba.xunxun.user.model.Roles;

@Named
public class RolesDaoImpl extends BaseGenericDaoImpl<Roles, Long>
		implements IRolesDao {

	public RolesDaoImpl() {
		super();
	}

	public RolesDaoImpl(Class<Roles> entityClass) {
		super(entityClass);
	}
	
	@Inject
	public void setSessionFactory(SessionFactory xunxunSessionFactory) {
		this.sessionFactory = xunxunSessionFactory;
	}
}
