package com.vteba.xunxun.common.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * session 超时 action
 * @author yinlei
 * date 2012-9-7 下午8:07:47
 */
@Controller
@RequestMapping("/common")
public class SessionTimeoutAction {

	@RequestMapping("/sessionTimeout")
	public String initial() throws Exception {
		return "sessionTimeout";
	}
	
}
