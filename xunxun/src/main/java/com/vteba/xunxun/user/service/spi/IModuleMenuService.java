package com.vteba.xunxun.user.service.spi;

import java.util.List;

import com.vteba.service.generic.BaseService;
import com.vteba.xunxun.user.model.EmpUser;
import com.vteba.xunxun.user.model.ModuleMenu;

/**
 * 菜单service接口
 * @author yinlei 
 * date 2012-6-6 下午12:52:29
 */
public interface IModuleMenuService extends BaseService<ModuleMenu, String> {
	
	/**
	 * 返回菜单数据
	 * @return List<ModuleMenu>
	 * @author yinlei
	 * @date 2012-6-6 下午9:58:02
	 */
	public List<ModuleMenu> getModuleMenuList(EmpUser user);
	
	/**
	 * 加载正在使用的菜单。首先从缓存中加载，如果有则直接返回，没有则查询数据库，然后将其放入缓存中，
	 * 再将数据返回。
	 * @return 菜单list
	 */
	public List<ModuleMenu> loadModuleMenus();
}
