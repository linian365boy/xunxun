package com.vteba.xunxun.user.service.spi;

import com.vteba.service.generic.BaseService;
import com.vteba.xunxun.user.model.Authorities;

/**
 * 权限service接口。
 * @author yinlei
 * @date 2012-4-20
 */
public interface IAuthoritiesService extends BaseService<Authorities, Long> {
	/**
	 * 保存权限，同时级联保存权限对应的资源。
	 * @param authorities 权限
	 */
	public void saveAuthRes(Authorities authorities);
	
	/**
	 * 即时加载权限，以及其所包含的资源。
	 * @param authId 权限ID
	 * @return 权限，含资源
	 */
	public Authorities loadAuthoritiesEager(Long authId);
	
	/**
	 * 即时加载权限，包含权限下的资源，以及资源resIds（以,分割），resNames（以,分割）
	 * @param authId 权限id
	 * @return 权限
	 */
	public Authorities loadAuthorities(Long authId);
	
	/**
	 * 获得系统所有的权限名 spring security use
	 * @return List<String> 系统所有的权限名
	 */
	//public List<String> getAllAuthorities();
	
	/**
	 * 根据权限名，获得该权限下的资源 spring security use
	 * @param authName 权限名
	 * @return 资源URL list
	 */
	//public List<String> getResourceUrlByAuthName(String authName);
	
	/**
	 * 根据权限名，获得该权限下的资源（方法路径，含包名），spring security use
	 * @param authName 权限名
	 * @return （资源列表）方法名列表
	 */
	//public List<String> getMethodByAuthName(String authName);
}
