package com.vteba.xunxun.user.service.spi;

import com.vteba.service.generic.BaseService;
import com.vteba.xunxun.user.model.Roles;

public interface IRolesService extends BaseService<Roles, Long> {
	/**
	 * 保存角色，级联保存角色包含的权限。
	 * @param roles 角色
	 */
	public void saveRoleAuths(Roles roles);
	
	/**
	 * 即时加载角色，包含该角色下的权限，以及authIds，authNames字符串（以，分割）。
	 * @param roleId 角色Id
	 * @return 角色
	 */
	public Roles loadRoles(Long roleId);
	
	/**
	 * 即时加载角色，包含该角色下的权限。
	 * @param roleId 角色Id
	 * @return 角色
	 */
	public Roles loadRolesEager(Long roleId);
}
