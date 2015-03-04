package com.vteba.xunxun.user.service.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.dao.DataAccessException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserCache;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.vteba.xunxun.user.model.EmpUser;
import com.vteba.xunxun.user.model.ModuleMenu;
import com.vteba.xunxun.user.service.spi.IEmpUserService;
import com.vteba.xunxun.user.service.spi.IModuleMenuService;

/**
 * 获取spring security用户信息
 * @author yinlei
 * date 2012-1-4 下午2:42:36
 */
public class UserDetailServiceImpl implements UserDetailsService {
	private IEmpUserService empUserServiceImpl;
	private IModuleMenuService moduleMenuServiceImpl;
	private UserCache userCache;
	private static final Logger logger = LoggerFactory.getLogger(UserDetailServiceImpl.class);

	@Inject
	public void setEmpUserServiceImpl(IEmpUserService empUserServiceImpl) {
		this.empUserServiceImpl = empUserServiceImpl;
	}

	@Inject
	public void setModuleMenuServiceImpl(IModuleMenuService moduleMenuServiceImpl) {
		this.moduleMenuServiceImpl = moduleMenuServiceImpl;
	}

	public UserCache getUserCache() {
		return userCache;
	}

	@Qualifier(value = "springSecurityUserCache")
	@Inject
	public void setUserCache(UserCache userCache) {
		this.userCache = userCache;
	}

	@Override
	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException, DataAccessException {
		Set<GrantedAuthority> authorities = new HashSet<GrantedAuthority>();
		UserDetails userDetails = userCache.getUserFromCache(username);
		//userCache.removeUserFromCache(username);
		if (userDetails == null) {
			logger.info("没有从缓存中获得用户信息，将从DB加载，userName=[" + username + "]");
		} else {
			logger.info("从缓存中获取用户信息，将验证用户信息，userName=[" + username + "]");
		}
		// 获得用户
		EmpUser empUser = empUserServiceImpl.queryEmpUserByUserAccount(username);
		List<ModuleMenu> moduleMenus = moduleMenuServiceImpl.getModuleMenuList(empUser);
		empUser.setModuleMenus(moduleMenus);
		// 取得用户的权限
		authorities = empUserServiceImpl.getGrantedAuthorities(username);
		// 构造SpringSecurity需要的数据
		empUser.setAuthorities(authorities);
		empUser.setUsername(empUser.getUserAccount());
		empUser.setPassword(empUser.getPass());
		empUser.setEnabled(true);
		empUser.setAccountNonExpired(true);
		empUser.setAccountNonLocked(true);
		empUser.setCredentialsNonExpired(true);
		return empUser;
	}
}
