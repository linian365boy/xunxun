package com.vteba.xunxun.user.action;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.inject.Inject;

import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.vteba.common.constant.CommonConst;
import com.vteba.security.spring.SecurityContextHolderUtils;
import com.vteba.service.generic.BaseService;
import com.vteba.tx.generic.Page;
import com.vteba.web.action.BasicAction;
import com.vteba.web.action.PageBean;
import com.vteba.xunxun.user.model.Authorities;
import com.vteba.xunxun.user.model.EmpUser;
import com.vteba.xunxun.user.model.Roles;
import com.vteba.xunxun.user.service.spi.IEmpUserService;

/**
 * 用户管理action
 * @author yinlei 
 * date 2012-6-24 下午11:20:12
 */
@Controller
@RequestMapping("/users")
public class EmpUserAction extends BasicAction<EmpUser> {

	private IEmpUserService empUserServiceImpl;
	//private IAuthoritiesService authoritiesServiceImpl;
	private ShaPasswordEncoder shaPasswordEncoder;
	private List<Long> ids;//封装页面的选择的id
	
//	@Inject
//	public void setAuthoritiesServiceImpl(IAuthoritiesService authoritiesServiceImpl) {
//		this.authoritiesServiceImpl = authoritiesServiceImpl;
//	}

	@Inject
	public void setShaPasswordEncoder(ShaPasswordEncoder shaPasswordEncoder) {
		this.shaPasswordEncoder = shaPasswordEncoder;
	}
	
	@RequestMapping("/empUser-initial")
	public String initial(EmpUser model, PageBean<EmpUser> pageBean, Map<String, Object> maps) throws Exception {
		queryForPage(model, pageBean, maps);
		return "user/empUser/empUser-initial-success";
	}
	
	@RequestMapping("/empUser-input")
	public String input(EmpUser model, Map<String, Object> maps) throws Exception {
		if (isInit()) {//初始化或者编辑
			setTokenValue();
			if (model.getUserId() != null) {
				EmpUser user = empUserServiceImpl.loadEmpUser(model.getUserId());
				maps.put("entity", user);
			}
			return "user/empUser/empUser-input-success";
		}
		if (isTokenValueOK()) {//保存或更新
			String encodePass = shaPasswordEncoder.encodePassword(model.getPass(), model.getName());
			model.setPass(encodePass);
			model.setCreateDate(new Date());
			int ret = empUserServiceImpl.saveUserAndRole(model);
			if (ret == 1) {
				return "user/empUser/empUser-input-success";
			}
		}
		return "user/empUser/empUser-input-success";
	}
	
	@ResponseBody
	@RequestMapping("/empUser-delete")
	public String delete() throws Exception {
		try {
			empUserServiceImpl.deleteEntityBatch(ids);
			return "1";
		} catch (Exception e) {
			//logger.info("delete user " + e.getMessage());
			return e.getMessage();
		}
		
	}
	
	public void update() throws Exception {
		
	}
	
	@RequestMapping("/empUser-roles")
	public String roles(EmpUser model, PageBean<Roles> pageBean, Map<String, Object> maps) throws Exception {
		Page<Roles> rolesPage = pageBean.getPage();
//		rolesPage.setPageNo(page.getPageNo());
//		rolesPage.setPageSize(page.getPageSize());
//		rolesPage.setOrderBy(page.getOrderBy());
//		rolesPage.setAscDesc(page.getAscDesc());
		
		EmpUser user = (EmpUser)SecurityContextHolderUtils.getCurrentUserInfo();
//		StringBuilder sql = new StringBuilder();
//		sql.append(" select distinct rr.* from emp_user uu,user_role ur,roles rr ");
//		sql.append(" where uu.user_id = ur.user_id ");
//		sql.append(" and ur.role_id = rr.role_id ");
//		
//		Object[] values = new Object[6];//使用list，无法自动还原为本来的类型
//		if (isInit()) {
//			values[0] = user.getUserId();
//			sql.append(" and uu.user_id = ? ");//默认查询自己的
//			StrutsUtils.getRequest().setAttribute("userName", user.getName());
//		} else { //之所以这样做，是因为不想拼装sql 字符串，防止sql注入
//			if (model.getUserId() != null) {
//				values[0] = model.getUserId();
//				sql.append(" and uu.user_id = ? ");
//			}
//			if (StringUtils.isNotBlank(model.getName())) {
//				values[1] = ObjectUtils.sqlLike(model.getName());
//				sql.append(" and uu.name like ? ");
//			}
//			if (StringUtils.isNotBlank(model.getUsername())) {//封装权限名
//				values[2] = ObjectUtils.sqlLike(model.getUsername());
//				sql.append(" and rr.role_name like ?");
//			}
//			if (StringUtils.isNotBlank(model.getUserAccount())) {//封装权限描述
//				values[3] = ObjectUtils.sqlLike(model.getUserAccount());
//				sql.append(" and rr.role_desc like ?");
//			}
//		}
//		Object[] objects = ObjectUtils.deleteNullValue(values);
//		rolesServiceImpl.queryForPageBySql(rolesPage, sql.toString(), objects);
		
		model = empUserServiceImpl.loadEmpUser(user.getUserId());
		Set<Roles> list = model.getRoleSet();
		maps.put("list", list);
		setAttributeToRequest(CommonConst.PAGE_NAME, rolesPage);
		return "user/empUser/empUser-roles-success";
	}
	
	/**
	 * 查看某一用户的所有角色。
	 * @param user 用户
	 * @param maps 返回值Map
	 */
	@RequestMapping("/user-roles-list")
	public String userRolesList(EmpUser user, Map<String, Object> maps) {
		EmpUser empUser = empUserServiceImpl.loadEmpUserEager(user.getUserId());
		maps.put("list", empUser.getRoleSet());
		return "user/empUser/user-roles-list";
	}
	
	public String authority() throws Exception {
		Page<Authorities> authPage = new Page<Authorities>();
		authPage.setPageNo(page.getPageNo());
		authPage.setPageSize(page.getPageSize());
		authPage.setOrderBy(page.getOrderBy());
		authPage.setAscDesc(page.getAscDesc());
		
		//StringBuilder sql = new StringBuilder("");
		
		//authoritiesServiceImpl.queryForPageBySql(authPage, sql.toString(), "");
		
		return "";
	}

	public List<Long> getIds() {
		return ids;
	}

	public void setIds(List<Long> ids) {
		this.ids = ids;
	}

	@Inject
	@Override
	public void setBaseServiceImpl(BaseService<EmpUser, ?> empUserServiceImpl) {
		this.baseServiceImpl = empUserServiceImpl;
		this.empUserServiceImpl = (IEmpUserService) empUserServiceImpl;
		
	}

}
