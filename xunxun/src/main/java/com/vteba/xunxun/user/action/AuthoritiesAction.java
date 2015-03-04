package com.vteba.xunxun.user.action;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.vteba.common.constant.CommonConst;
import com.vteba.service.generic.BaseService;
import com.vteba.web.action.BasicAction;
import com.vteba.web.action.PageBean;
import com.vteba.xunxun.user.model.Authorities;
import com.vteba.xunxun.user.model.ModuleMenu;
import com.vteba.xunxun.user.service.spi.IAuthoritiesService;
import com.vteba.xunxun.user.service.spi.IModuleMenuService;
import com.vteba.xunxun.user.service.spi.IResourcesService;

/**
 * 权限action
 * @author yinlei 
 * date 2012-6-24 下午11:19:32
 */
@Controller
@RequestMapping("/users")
public class AuthoritiesAction extends BasicAction<Authorities> {

	private IAuthoritiesService authoritiesServiceImpl;
	private IModuleMenuService moduleMenuServiceImpl;
	@Inject
	private IResourcesService resourcesServiceImpl;
	
	@Inject
	public void setModuleMenuServiceImpl(IModuleMenuService moduleMenuServiceImpl) {
		this.moduleMenuServiceImpl = moduleMenuServiceImpl;
	}

	@RequestMapping("/authorities-initial")
	public String initial(Authorities model, PageBean<Authorities> pageBean, Map<String, Object> maps) throws Exception {
		queryForPage(model, pageBean, maps);
		return "user/authorities/auth-initial-success";
	}
	
	/**
	 * 新增权限初始化，以及保存权限
	 * @author yinlei
	 * date 2012-6-24 下午11:24:45
	 */
	@RequestMapping("/authorities-input")
	public String input(Authorities model, Map<String, Object> maps) throws Exception {
		if (isInit()) {
			setTokenValue();
			List<ModuleMenu> list = moduleMenuServiceImpl.loadModuleMenus();
			maps.put("list", list);
			if (model.getAuthId() != null) {
				model = authoritiesServiceImpl.loadAuthorities(model.getAuthId());
				maps.put("auth", model);
			}
			
			String json = resourcesServiceImpl.getResNode();
			maps.put("json", json);
			return "user/authorities/auth-input-success";
		}
		if (isTokenValueOK()) {
			authoritiesServiceImpl.saveAuthRes(model);
		}
		return "user/authorities/auth-input-success";
	}

	/**
	 * 删除权限
	 * @param authId 权限id
	 */
	@ResponseBody
	@RequestMapping("/auth-delete")
	public String delete(Long authId) {
		authoritiesServiceImpl.delete(authId);
		return SUCCESS;
	}
	
	/**
	 * 查询角色权限列表
	 * @param authorities 参数
	 * @param pageBean 分页信息
	 * @param maps 返回值
	 * @return 角色权限列表页逻辑视图
	 */
	@RequestMapping("/auth-list")
	public String list(Authorities authorities, PageBean<Authorities> pageBean, Map<String, Object> maps) {
		page = pageBean.getPage();
		page.setPageSize(30);
		authoritiesServiceImpl.queryForPage(page, authorities);
		listResult = page.getResult();
		maps.put("listResult", listResult);
		
		List<ModuleMenu> list = moduleMenuServiceImpl.loadModuleMenus();
		maps.put("list", list);
		
		setAttributeToRequest(CommonConst.PAGE_NAME, page);
		return "user/authorities/auth-list";
	}
	
	@RequestMapping("/auth-resource")
	public String authResource(Authorities model, Map<String, Object> maps) {
		model = authoritiesServiceImpl.loadAuthoritiesEager(model.getAuthId());
		maps.put("list", model.getResourceSets());
		return "user/authorities/auth-resource";
	}

	@Inject
	@Override
	public void setBaseServiceImpl(
			BaseService<Authorities, ? extends Serializable> authoritiesServiceImpl) {
		this.baseServiceImpl = authoritiesServiceImpl;
		this.authoritiesServiceImpl = (IAuthoritiesService) authoritiesServiceImpl;
	}
}
