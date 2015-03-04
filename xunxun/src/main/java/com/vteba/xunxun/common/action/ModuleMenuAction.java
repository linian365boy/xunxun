package com.vteba.xunxun.common.action;

import java.io.Serializable;
import java.util.Date;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.vteba.common.constant.CommonConst;
import com.vteba.service.generic.BaseService;
import com.vteba.utils.reflection.ReflectUtils;
import com.vteba.web.action.BasicAction;
import com.vteba.web.action.PageBean;
import com.vteba.xunxun.user.model.ModuleMenu;
import com.vteba.xunxun.user.service.spi.IModuleMenuService;

@RequestMapping("/menu")
@Controller
public class ModuleMenuAction extends BasicAction<ModuleMenu> {
	@Inject
	public IModuleMenuService moduleMenuServiceImpl;
	
	@RequestMapping("/list")
	public String list(ModuleMenu model, PageBean<ModuleMenu> pageBean, Map<String, Object> maps) {
		if (isQuery()) {
			ReflectUtils.emptyToNulls(model);
		}
		page = pageBean.getPage();
		moduleMenuServiceImpl.queryForPage(page, model);
		maps.put("listResult", page.getResult());
		setAttributeToRequest(CommonConst.PAGE_NAME, page);
		return "common/menu/menu-list";
	}
	
	@RequestMapping("/add")
	public String add(ModuleMenu model, Map<String, Object> maps) {
		if (isInit()) {
			setTokenValue();
			if (StringUtils.isNotBlank(model.getModuleId())) {// 编辑
				model = moduleMenuServiceImpl.get(model.getModuleId());
				maps.put("entity", model);
			}
			return "common/menu/menu-add";
		}
		if (isTokenValueOK()) {
			if (StringUtils.isBlank(model.getModuleId())) {
				model.setModuleId(null);
				model.setCreateTime(new Date());
				moduleMenuServiceImpl.save(model);
			} else {
				moduleMenuServiceImpl.update(model);
			}
		}
		return "common/menu/menu-add";
	}
	
	@ResponseBody
	@RequestMapping("/delete")
	public String delete(String moduleId) {
		moduleMenuServiceImpl.delete(moduleId);
		return SUCCESS;
	}

	@Override
	public void setBaseServiceImpl(
			BaseService<ModuleMenu, ? extends Serializable> BaseServiceImpl) {
		// TODO Auto-generated method stub
		
	}
}
