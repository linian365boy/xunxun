package com.vteba.xunxun.user.service.spi;

import com.vteba.service.generic.BaseService;
import com.vteba.xunxun.user.model.Resources;

public interface IResourcesService extends BaseService<Resources, Long> {
	
	/**
	 * 获得资源json字符串，用来构造js树。
	 * @return json字符串
	 */
	public String getResNode();
}
