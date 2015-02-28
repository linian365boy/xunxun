package com.vteba.xunxun.user.action;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.vteba.xunxun.user.model.User;
import com.vteba.xunxun.user.service.spi.UserService;

import com.vteba.web.action.GenericAction;
import com.vteba.web.action.JsonBean;

/**
 * 用户信息控制器
 * @author yinlei
 * @date 2015-2-28 13:00:38
 */
@Controller
@RequestMapping("/user")
public class UserAction extends GenericAction<User> {
	@Inject
	private UserService userServiceImpl;
	
	/**
     * 获得用户信息List，初始化列表页。
     * @param model 参数
     * @return 用户信息List
     */
    @RequestMapping("/initial")
    public String initial(User model, Map<String, Object> maps) {
        List<User> list = userServiceImpl.pagedList(model);
        maps.put("list", list);
        return "user/initial";
    }
	
	/**
	 * 获得用户信息List，Json格式。
	 * @param model 参数
	 * @return 用户信息List
	 */
	@ResponseBody
	@RequestMapping("/list")
	public List<User> list(User model) {
		List<User> list = userServiceImpl.pagedList(model);
		return list;
	}
	
	/**
     * 根据Id获得用户信息实体，Json格式。
     * @param id 参数id
     * @return 用户信息实体
     */
    @ResponseBody
    @RequestMapping("/get")
    public User get(String id) {
        User model = userServiceImpl.get(id);
        return model;
    }
	
	/**
     * 跳转到新增页面
     * @return 新增页面逻辑视图
     */
    @RequestMapping("/add")
    public String add() {
        return "user/add";
    }
    
    /**
     * 执行实际的新增操作
     * @param model 要新增的数据
     * @return 新增页面逻辑视图
     */
    @ResponseBody
    @RequestMapping("/doAdd")
    public JsonBean doAdd(User model) {
        int result = userServiceImpl.save(model);
        JsonBean bean = new JsonBean();
        if (result == 1) {
            bean.setMessage(SUCCESS);
        } else {
            bean.setCode(1);
            bean.setMessage(ERROR);
        }
        return bean;
    }
    
    /**
     * 查看用户信息详情页。
     * @param model 查询参数，携带ID
     * @return 用户信息详情页
     */
    @RequestMapping("/detail")
    public String detail(User model, Map<String, Object> maps) {
        model = userServiceImpl.get(model.getId());
        maps.put("model", model);//将model放入视图中，供页面视图使用
        return "user/detail";
    }
    
    /**
     * 跳转到编辑信息页面
     * @param model 查询参数，携带ID
     * @return 编辑页面
     */
    @RequestMapping("/edit")
    public String edit(User model, Map<String, Object> maps) {
        model = userServiceImpl.get(model.getId());
        maps.put("model", model);
        return "user/edit";
    }
    
    /**
     * 更新用户信息信息
     * @param model 要更新的用户信息信息，含有ID
     * @return 操作结果信息
     */
    @ResponseBody
    @RequestMapping("/update")
    public JsonBean update(User model) {
        int result = userServiceImpl.updateById(model);
        JsonBean bean = new JsonBean();
        if (result == 1) {
            bean.setMessage(SUCCESS);
        } else {
            bean.setCode(1);
            bean.setMessage(ERROR);
        }
        return bean;
    }
    
    /**
     * 删除用户信息信息
     * @param id 要删除的用户信息ID
     */
    @ResponseBody
    @RequestMapping("/delete")
    public JsonBean delete(String id) {
        int result = userServiceImpl.deleteById(id);
        JsonBean bean = new JsonBean();
        if (result == 1) {
            bean.setMessage(SUCCESS);
        } else {
            bean.setCode(1);
            bean.setMessage(ERROR);
        }
        return bean;
    }
}
