package com.vteba.xunxun.user.dao.impl;

import javax.inject.Inject;
import javax.inject.Named;

import org.hibernate.SessionFactory;

import com.vteba.tx.hibernate.impl.BaseGenericDaoImpl;
import com.vteba.xunxun.user.dao.spi.IAuthoritiesDao;
import com.vteba.xunxun.user.model.Authorities;

@Named
public class AuthoritiesDaoImpl extends
		BaseGenericDaoImpl<Authorities, Long> implements IAuthoritiesDao {

	public AuthoritiesDaoImpl() {
		super();
	}

	public AuthoritiesDaoImpl(Class<Authorities> entityClass) {
		super(entityClass);
	}
	
	@Inject
	public void setSessionFactory(SessionFactory xunxunSessionFactory) {
		this.sessionFactory = xunxunSessionFactory;
	}

}
