package com.vteba.xunxun.user.service.impl;

import java.util.HashSet;
import java.util.Set;

import javax.inject.Inject;
import javax.inject.Named;

import org.apache.commons.lang3.StringUtils;

import com.vteba.service.generic.impl.BaseServiceImpl;
import com.vteba.tx.hibernate.BaseGenericDao;
import com.vteba.xunxun.user.dao.spi.IRolesDao;
import com.vteba.xunxun.user.model.Authorities;
import com.vteba.xunxun.user.model.Roles;
import com.vteba.xunxun.user.service.spi.IRolesService;

@Named
public class RolesServiceImpl extends BaseServiceImpl<Roles, Long> implements IRolesService {
	
	public RolesServiceImpl() {
		super();
	}
	
	private IRolesDao rolesDaoImpl;
		
	@Inject
	@Override
	public void setBaseGenericDaoImpl(
			BaseGenericDao<Roles, Long> rolesDaoImpl) {
		this.baseGenericDaoImpl = rolesDaoImpl;
		this.rolesDaoImpl = (IRolesDao) rolesDaoImpl;
	}

	@Override
	public void saveRoleAuths(Roles roles) {
		String authIds = roles.getAuthIds();
		if (authIds != null) {
			String[] authIdsArray = StringUtils.split(authIds, ",");
			Set<Authorities> authSets = new HashSet<Authorities>();
			for (String ids : authIdsArray) {
				Long authId = Long.valueOf(ids);
				Authorities auth = new Authorities(authId);
				authSets.add(auth);
			}
			roles.setAuthSets(authSets);
		}
		rolesDaoImpl.saveOrUpdate(roles);
	}

	@Override
	public Roles loadRoles(Long roleId) {
		Roles roles = rolesDaoImpl.get(roleId);
		String authIds = "";
		String authNames = "";
		for (Authorities auth : roles.getAuthSets()) {
			authIds += auth.getAuthId() + ",";
			authNames += auth.getAuthName() + ",";
		}
		roles.setAuthIds(authIds);
		roles.setAuthNames(authNames);
		return roles;
	}	

	@Override
	public Roles loadRolesEager(Long roleId) {
		Roles roles = rolesDaoImpl.get(roleId);
		rolesDaoImpl.initProxyObject(roles.getAuthSets());
		return roles;
	}
}
