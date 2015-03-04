package com.vteba.xunxun.user.dao.impl;

import javax.inject.Inject;
import javax.inject.Named;

import org.hibernate.SessionFactory;

import com.vteba.tx.hibernate.impl.BaseGenericDaoImpl;
import com.vteba.xunxun.user.dao.spi.IModuleMenuDao;
import com.vteba.xunxun.user.model.ModuleMenu;

/**
 * 菜单模组DAO实现
 * @author yinlei
 * date 2012-5-11 下午7:52:37
 */
@Named
public class ModuleMenuDaoImpl extends BaseGenericDaoImpl<ModuleMenu, String> implements
		IModuleMenuDao {

	public ModuleMenuDaoImpl() {
		super();
	}

	public ModuleMenuDaoImpl(Class<ModuleMenu> entityClass) {
		super(entityClass);
	}

	@Inject
	public void setSessionFactory(SessionFactory skmbwSessionFactory) {
		this.sessionFactory = skmbwSessionFactory;
	}

}
