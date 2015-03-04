package com.vteba.xunxun.common.action;

import java.io.ByteArrayInputStream;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.vteba.utils.common.RandomNumber;
import com.vteba.utils.web.RequestContextHolder;

/**
 * 随机验证码action 
 * @author yinlei 
 * @date 2012-6-3 下午3:29:48
 */
@Controller
@RequestMapping("/users")
public class RandomNumberAction {

	private ByteArrayInputStream inputStream;

	@RequestMapping("/randomNumber")
	public String execute() throws Exception {
		RandomNumber randomNum = RandomNumber.get();
		setInputStream(randomNum.getImage());// 取得带有随机字符串的图片
		String authCode = randomNum.getString().toString().toLowerCase();
		RequestContextHolder.getSession().setAttribute("random", authCode);// 取得随机字符串放入HttpSession
		return "";
	}

	public void setInputStream(ByteArrayInputStream inputStream) {
		this.inputStream = inputStream;
	}

	public ByteArrayInputStream getInputStream() {
		return inputStream;
	}

}
