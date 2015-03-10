package com.vteba.xunxun.stock.action;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.vteba.xunxun.stock.model.Holdings;
import com.vteba.xunxun.stock.service.spi.HoldingsService;

import com.vteba.web.action.GenericAction;
import com.vteba.web.action.JsonBean;

/**
 * 持仓控制器
 * @author yinlei
 * @date 2015-3-9 15:23:42
 */
@Controller
@RequestMapping("/holdings")
public class HoldingsAction extends GenericAction<Holdings> {
	@Inject
	private HoldingsService holdingsServiceImpl;
	
	/**
     * 获得持仓List，初始化列表页。
     * @param model 参数
     * @return 持仓List
     */
    @RequestMapping("/initial")
    public String initial(Holdings model, Map<String, Object> maps) {
        List<Holdings> list = holdingsServiceImpl.pagedList(model);
        maps.put("list", list);
        return "holdings/initial";
    }
	
	/**
	 * 获得持仓List，Json格式。
	 * @param model 参数
	 * @return 持仓List
	 */
	@ResponseBody
	@RequestMapping("/list")
	public List<Holdings> list(Holdings model) {
		List<Holdings> list = holdingsServiceImpl.pagedList(model);
		return list;
	}
	
	/**
     * 根据Id获得持仓实体，Json格式。
     * @param id 参数id
     * @return 持仓实体
     */
    @ResponseBody
    @RequestMapping("/get")
    public Holdings get(Long id) {
        Holdings model = holdingsServiceImpl.get(id);
        return model;
    }
	
	/**
     * 跳转到新增页面
     * @return 新增页面逻辑视图
     */
    @RequestMapping("/add")
    public String add() {
        return "holdings/add";
    }
    
    /**
     * 执行实际的新增操作
     * @param model 要新增的数据
     * @return 新增页面逻辑视图
     */
    @ResponseBody
    @RequestMapping("/doAdd")
    public JsonBean doAdd(Holdings model) {
        int result = holdingsServiceImpl.save(model);
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
     * 查看持仓详情页。
     * @param model 查询参数，携带ID
     * @return 持仓详情页
     */
    @RequestMapping("/detail")
    public String detail(Holdings model, Map<String, Object> maps) {
        model = holdingsServiceImpl.get(model.getId());
        maps.put("model", model);//将model放入视图中，供页面视图使用
        return "holdings/detail";
    }
    
    /**
     * 跳转到编辑信息页面
     * @param model 查询参数，携带ID
     * @return 编辑页面
     */
    @RequestMapping("/edit")
    public String edit(Holdings model, Map<String, Object> maps) {
        model = holdingsServiceImpl.get(model.getId());
        maps.put("model", model);
        return "holdings/edit";
    }
    
    /**
     * 更新持仓信息
     * @param model 要更新的持仓信息，含有ID
     * @return 操作结果信息
     */
    @ResponseBody
    @RequestMapping("/update")
    public JsonBean update(Holdings model) {
        int result = holdingsServiceImpl.updateById(model);
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
     * 删除持仓信息
     * @param id 要删除的持仓ID
     */
    @ResponseBody
    @RequestMapping("/delete")
    public JsonBean delete(Long id) {
        int result = holdingsServiceImpl.deleteById(id);
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
