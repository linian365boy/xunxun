package com.vteba.xunxun.user.service.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.inject.Inject;
import javax.inject.Named;

import org.apache.commons.lang3.StringUtils;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import com.vteba.service.generic.impl.BaseServiceImpl;
import com.vteba.tx.hibernate.BaseGenericDao;
import com.vteba.xunxun.user.dao.spi.IEmpUserDao;
import com.vteba.xunxun.user.model.EmpUser;
import com.vteba.xunxun.user.model.Roles;
import com.vteba.xunxun.user.service.spi.IEmpUserService;

/**
 * EmpUser服务实现类
 * @author yinlei 
 * @date 2012-4-12 下午7:09:51
 */
@Named
public class EmpUserServiceImpl extends BaseServiceImpl<EmpUser, Long> implements IEmpUserService {
	
	public EmpUserServiceImpl() {
		super();
	}

	private IEmpUserDao empUserDaoImpl;
	//private IUserRoleService userRoleServiceImpl;
//	@Inject
//	private UserDao userDao;
//	
//	@Inject
//	private UserMapper userMapper;
	
	@Inject
	@Override
	public void setBaseGenericDaoImpl(BaseGenericDao<EmpUser, Long> empUserDaoImpl) {
		this.baseGenericDaoImpl = empUserDaoImpl;
		this.empUserDaoImpl = (IEmpUserDao) empUserDaoImpl;
	}
	
//	@Inject
//	public void setUserRoleServiceImpl(IUserRoleService userRoleServiceImpl) {
//		this.userRoleServiceImpl = userRoleServiceImpl;
//	}
	
	public List<EmpUser> getEmpUserLists() {
		List<EmpUser> list = empUserDaoImpl.getAll();
		return list;
	}
	
	public Set<GrantedAuthority> getGrantedAuthorities(String userName) {
		Set<GrantedAuthority> authorities = new HashSet<GrantedAuthority>();
		StringBuilder sb = new StringBuilder();
		sb = sb.append(" select a.auth_name from authorities a,role_auth b, user_role c, emp_user d ");
		sb = sb.append(" where a.auth_id = b.auth_id and b.role_id = c.role_id ");
		sb = sb.append(" and c.user_id = d.user_id and d.user_account = ? ");

		List<String> authList = new ArrayList<String>();
		authList = empUserDaoImpl.sqlQueryForList(sb.toString(), String.class, userName);
		
		//将角色也加入到权限中，泛化控制
		StringBuilder roleBuilder = new StringBuilder();
		roleBuilder = roleBuilder.append(" select distinct r.role_name from emp_user u,user_role ur,roles r,role_auth ra,authorities a ");
		roleBuilder = roleBuilder.append(" where u.user_id = ur.user_id and ur.role_id = r.role_id  ");
		roleBuilder = roleBuilder.append(" and r.role_id = ra.role_id and ra.auth_id = a.auth_id ");
		roleBuilder = roleBuilder.append(" and u.user_account = ? ");
		List<String> roleList = new ArrayList<String>();
		roleList = empUserDaoImpl.sqlQueryForList(roleBuilder.toString(), String.class, userName);
		authList.addAll(roleList);
		
		for (String authName : authList) {
			SimpleGrantedAuthority grantedAuthorityImpl = new SimpleGrantedAuthority(authName);
			authorities.add(grantedAuthorityImpl);
		}
		return authorities;
	}
	public EmpUser queryEmpUserByUserAccount(String userAccount){
		EmpUser empUser = new EmpUser();
		empUser = empUserDaoImpl.uniqueResult("userAccount", userAccount);
		return empUser;
	}
	
	//@Cacheable(value="getAllAuthorities", key="'getAllAuthorities'")
	public List<String> getAllAuthorities(){
		List<String> authList = new ArrayList<String>();
		String hql = "select a.authName from Authorities a where a.enabled = 1";
		authList = empUserDaoImpl.queryForList(hql, String.class);
		return authList;
	}
	
//	public List<String> getResourceUrlByAuthName(String authName){
//		List<String> authList = new ArrayList<String>();
//		StringBuilder sb = new StringBuilder();
//		sb = sb.append(" select a.resource_url from auth_resource a, authorities c ");
//		sb = sb.append(" where a.id = c.auth_id and ");
//		sb = sb.append(" c.auth_name = ? ");
//		authList = empUserDaoImpl.sqlQueryForList(sb.toString(), String.class, authName);
//		return authList;
//	}
	
	public int saveUserAndRole(EmpUser model){
		if (model.getUsername() != null) {//如果关联了角色
			String[] roleIds = StringUtils.split(model.getUsername(), ",");
			for (String roleId : roleIds) {
//				UserRole userRole = new UserRole();
//				userRole.setUserId(model.getUserId());
//				userRole.setRoleId(Long.valueOf(roleId));
//				userRoleServiceImpl.saveOrUpdate(userRole);
				Roles role = new Roles();
				role.setRoleId(Long.valueOf(roleId));
				model.getRoleSet().add(role);//对多对关联操作，脚手架代码
			}
		}
		empUserDaoImpl.saveOrUpdate(model);
		return 1;
	}
	
	public EmpUser loadEmpUser(Long userId) {
		EmpUser user = empUserDaoImpl.get(userId);
		
		String roleNames = "";//角色中文名
		String roleIds = "";//角色id
		
		for (Roles role : user.getRoleSet()) {
			roleIds = roleIds + role.getRoleId() + ",";
			roleNames = roleNames + role.getRoleDesc() + ",";
		}
		user.setUsername(roleIds);
		user.setRoleNames(roleNames);
		return user;
	}
	
	public EmpUser loadEmpUserEager(Long userId) {
		EmpUser user = empUserDaoImpl.get(userId);
		empUserDaoImpl.initProxyObject(user.getRoleSet());
		return user;
	}
}
