package com.vteba.xunxun.user.service.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.inject.Inject;
import javax.inject.Named;

import org.apache.commons.lang3.StringUtils;

import com.vteba.service.generic.impl.BaseServiceImpl;
import com.vteba.tx.hibernate.BaseGenericDao;
import com.vteba.utils.ofbiz.LangUtils;
import com.vteba.xunxun.user.dao.spi.IModuleMenuDao;
import com.vteba.xunxun.user.model.Authorities;
import com.vteba.xunxun.user.model.EmpUser;
import com.vteba.xunxun.user.model.ModuleMenu;
import com.vteba.xunxun.user.model.Resources;
import com.vteba.xunxun.user.model.Roles;
import com.vteba.xunxun.user.service.spi.IEmpUserService;
import com.vteba.xunxun.user.service.spi.IModuleMenuService;

/**
 * 菜单service实现
 * @author yinlei 
 * date 2012-6-12 下午12:22:38
 */
@Named
public class ModuleMenuServiceImpl extends BaseServiceImpl<ModuleMenu, String> implements
		IModuleMenuService {

	private IModuleMenuDao moduleMenuDaoImpl;
	
	@Inject
	private IEmpUserService empUserServiceImpl;
	
	public ModuleMenuServiceImpl() {
		super();
	}
	
//	@Inject
//	public void setAuthoritiesServiceImpl(IAuthoritiesService authoritiesServiceImpl) {
//		this.authoritiesServiceImpl = authoritiesServiceImpl;
//	}

	@Inject
	public void setBaseGenericDaoImpl(
			BaseGenericDao<ModuleMenu, String> moduleMenuDaoImpl) {
		this.baseGenericDaoImpl = moduleMenuDaoImpl;
		this.moduleMenuDaoImpl = (IModuleMenuDao) moduleMenuDaoImpl;
	}
	
	public List<ModuleMenu> getModuleMenuList(EmpUser user){
		user = empUserServiceImpl.get(user.getUserId());
		//获得所有的菜单
		//String hql = "select mm from ModuleMenu mm where mm.enable = true order by orders asc";
		List<ModuleMenu> menuList = moduleMenuDaoImpl.getEntityList("enable", true, LangUtils.toMap("orders", "asc"));
		List<Authorities> authorities = new ArrayList<Authorities>();
		for (Roles role : user.getRoleSet()) {
			Set<Authorities> authSets = role.getAuthSets();
			authorities.addAll(authSets);
		}

		//匹配权限和菜单
		for (Authorities auth : authorities) {
			for (ModuleMenu menu : menuList) {
				if (auth.getModuleId().equals(menu.getModuleId())) {
					if (auth.getEnabled() == 1) {
						//取得菜单下所有的资源，控制菜单显示
						Set<String> resUrls = new HashSet<String>();
						for (Resources res : auth.getResourceSets()) {
							resUrls.add(res.getResourceUrl());
						}
						if (resUrls.size() > 0) {
							auth.setResUrls(resUrls);
						}
						menu.getAuthorities().add(auth);
					}
				}
			}
		}
		
		
		return menuList;
		
//		//获得所有的菜单
//		String hql = "from ModuleMenu mm where mm.enable = true order by orders asc";
//		List<ModuleMenu> menuList = moduleMenuDaoImpl.getEntityListByHql(hql);
//		if (menuList != null && menuList.size() > 0) {
//			//获得权限
//			String mhql = "from Authorities aa where aa.moduleId = :moduleId and aa.userId = :userId and aa.enabled = 1 order by :orders asc";
//			for (ModuleMenu menu : menuList) {//获得各模组下的菜单(权限)
//				List<Authorities> authorities = new ArrayList<Authorities>();
//				Map<String, Object> map = new HashMap<String, Object>();
//				map.put("moduleId", menu.getModuleId());
//				map.put("userId", user.getUserId());
//				map.put("orders", "orders");
//				authorities = authoritiesServiceImpl.getEntityListByHql(mhql, map);
//				
//				List<Authorities> sets = new ArrayList<Authorities>();
//				for (Authorities auth : authorities) {
//					Set<String> urls = new HashSet<String>();
//					urls = splitUrls(auth.getUrls());
//					if (urls != null) {//该权限下所有的动作(URL)
//						auth.setResUrls(urls);
//					}
//					sets.add(auth);
//				}
//				menu.setAuthorities(sets);
//			}
//		}
//		List<ModuleMenu> finalMenus = new ArrayList<ModuleMenu>();
//		for (ModuleMenu menu : menuList) {
//			//有权限，才显示相应的菜单
//			if (menu.getAuthorities() != null && menu.getAuthorities().size() > 0) {
//				finalMenus.add(menu);
//			}
//		}
//		return finalMenus;
	}
	
	/**
	 * 拆分权限string，以#分割
	 * @param urls
	 */
	protected Set<String> splitUrls(String urls){
		if (StringUtils.isNotEmpty(urls)) {
			String[] list = StringUtils.split(urls, "#");
			Set<String> retUrls = new HashSet<String>();
			for (int i =0; i < list.length; i++) {
				String temp = list[i];
				if (StringUtils.isNotEmpty(temp)) {
					retUrls.add(temp);
				}
			}
			return retUrls;
		}
		return null;
	}

	public List<ModuleMenu> loadModuleMenus() {
		//String hql = "select a from ModuleMenu a where a.enable = true";
		List<ModuleMenu> list = moduleMenuDaoImpl.getEntityList("enable", true);
		return list;
	}
}
