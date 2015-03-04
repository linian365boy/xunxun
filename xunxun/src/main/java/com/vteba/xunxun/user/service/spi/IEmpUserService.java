package com.vteba.xunxun.user.service.spi;

import java.util.List;
import java.util.Set;

import org.springframework.security.core.GrantedAuthority;

import com.vteba.service.generic.BaseService;
import com.vteba.xunxun.user.model.EmpUser;

/**
 * EmpUser service 实现
 * @author yinlei
 * date 2012-1-4 下午2:43:57
 */
public interface IEmpUserService extends BaseService<EmpUser, Long>{
	
	public List<EmpUser> getEmpUserLists();
	/**
	 * 根据用户账户，获得该用户所有的权限，spring security use
	 * @param userName 用户账户
	 * @return Set<GrantedAuthority>权限集
	 */
	public Set<GrantedAuthority> getGrantedAuthorities(String userName);
	/**
	 * 根据用户账户获得用户 spring security use
	 * @param userAccount 用户账户
	 * @return 用户EmpUser
	 */
	public EmpUser queryEmpUserByUserAccount(String userAccount);
//	/**
//	 * 获得系统所有的权限名 spring security use
//	 * @return List<String> 系统所有的权限名
//	 */
//	public List<String> getAllAuthorities();
//	/**
//	 * 根据权限名，获得该权限下的资源 spring security use
//	 * @param authName 权限名
//	 * @return 资源URL list
//	 */
//	public List<String> getResourceUrlByAuthName(String authName);
	
	/**
	 * 保存或更新用户，同时保存角色关系，成功返回1
	 * @param model
	 * @author yinlei
	 * @date 2012-6-21 下午11:05:58
	 */
	public int saveUserAndRole(EmpUser model);
	
	/**
	 * 根据用户ID加载用户，含有用户的角色信息
	 * @param userId 用户ID
	 * @return 用户实体EmpUser
	 * @author yinlei
	 * date 2012-9-7 下午4:07:37
	 */
	public EmpUser loadEmpUser(Long userId);
	
	/**
	 * 根据用户ID加载用户，含有用户的角色信息
	 * @param userId 用户ID
	 * @return 用户实体EmpUser
	 * @author yinlei
	 * date 2014-2-7 下午4:07:37
	 */
	public EmpUser loadEmpUserEager(Long userId);
}
