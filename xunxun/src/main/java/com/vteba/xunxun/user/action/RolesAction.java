package com.vteba.xunxun.user.action;

import java.io.Serializable;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.vteba.common.constant.CommonConst;
import com.vteba.service.generic.BaseService;
import com.vteba.utils.reflection.ReflectUtils;
import com.vteba.web.action.BasicAction;
import com.vteba.web.action.PageBean;
import com.vteba.xunxun.user.model.Roles;
import com.vteba.xunxun.user.service.spi.IRolesService;

/**
 * 角色管理action
 * @author yinlei 
 * date 2012-6-24 下午11:20:29
 */
@Controller
@RequestMapping("/users")
public class RolesAction extends BasicAction<Roles> {

	private IRolesService rolesServiceImpl;
	
	@Inject
	public void setRolesServiceImpl(IRolesService rolesServiceImpl) {
		this.rolesServiceImpl = rolesServiceImpl;
	}
	
	@RequestMapping("/roles-initial")
	public String initial(Roles model, PageBean<Roles> pageBean, Map<String, Object> maps) throws Exception {
		ReflectUtils.emptyToNulls(model);
		model.setPriority(1);
		page = pageBean.getPage();
		rolesServiceImpl.queryForPage(page, model);
		listResult = page.getResult();
		maps.put("listResult", listResult);
		setAttributeToRequest(CommonConst.PAGE_NAME, page);
		return "user/roles/roles-initial-success";
	}
	
	/**
	 * 新增角色初始化，以及保存角色 
	 * @author yinlei
	 * date 2012-6-24 下午11:22:12
	 */
	@RequestMapping("/roles-input")
	public String input(Roles model, Map<String, Object> maps) throws Exception {
		if (isInit()) {
			setTokenValue();
			if (model.getRoleId() != null) {
				model = rolesServiceImpl.loadRoles(model.getRoleId());
				maps.put("role", model);
			}
			return "user/roles/roles-input-success";
		}
		if (isTokenValueOK()) {
			rolesServiceImpl.saveRoleAuths(model);
		}
		return "user/roles/roles-input-success";
	}
	
	/**
	 * 查看某一角色的权限明细
	 * @author yinlei
	 * date 2012-6-24 下午11:21:42
	 */
	@RequestMapping("/roles-roleAuthList")
	public String roleAuthList(Roles model, Map<String, Object> maps) throws Exception {
		//String hql = "select a from RoleAuth a where a.roleId = ?1 ";
		model = rolesServiceImpl.loadRolesEager(model.getRoleId());
		//List<RoleAuth> list = roleAuthServiceImpl.getEntityListByHql(hql, model.getRoleId());
		maps.put("list", model.getAuthSets());
		return "user/roles/rolesAuth-list";
	}
	
	/**
	 * 供选择角色时查询用
	 */
	@RequestMapping("/roles-list")
	public String list(Roles model, Map<String, Object> maps) throws Exception {
		Roles entity = new Roles();
		entity.setRoleName(model.getRoleName());
		entity.setRoleDesc(model.getRoleDesc());
		entity.setPriority(1);
		listResult = rolesServiceImpl.getListByLike(entity);
		maps.put("listResult", listResult);
		return "user/roles/roles-list";
	}

	@Override
	public void setBaseServiceImpl(
			BaseService<Roles, ? extends Serializable> baseServiceImpl) {
		// TODO Auto-generated method stub
		
	}
	
}
