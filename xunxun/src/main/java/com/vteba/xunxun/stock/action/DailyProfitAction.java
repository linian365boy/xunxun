package com.vteba.xunxun.stock.action;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.vteba.xunxun.stock.model.DailyProfit;
import com.vteba.xunxun.stock.service.spi.DailyProfitService;

import com.vteba.web.action.GenericAction;
import com.vteba.web.action.JsonBean;

/**
 * 每日盈亏控制器
 * @author yinlei
 * @date 2015-3-9 15:23:43
 */
@Controller
@RequestMapping("/dailyProfit")
public class DailyProfitAction extends GenericAction<DailyProfit> {
	@Inject
	private DailyProfitService dailyProfitServiceImpl;
	
	/**
     * 获得每日盈亏List，初始化列表页。
     * @param model 参数
     * @return 每日盈亏List
     */
    @RequestMapping("/initial")
    public String initial(DailyProfit model, Map<String, Object> maps) {
        List<DailyProfit> list = dailyProfitServiceImpl.pagedList(model);
        maps.put("list", list);
        return "dailyProfit/initial";
    }
	
	/**
	 * 获得每日盈亏List，Json格式。
	 * @param model 参数
	 * @return 每日盈亏List
	 */
	@ResponseBody
	@RequestMapping("/list")
	public List<DailyProfit> list(DailyProfit model) {
		List<DailyProfit> list = dailyProfitServiceImpl.pagedList(model);
		return list;
	}
	
	/**
     * 根据Id获得每日盈亏实体，Json格式。
     * @param id 参数id
     * @return 每日盈亏实体
     */
    @ResponseBody
    @RequestMapping("/get")
    public DailyProfit get(Long id) {
        DailyProfit model = dailyProfitServiceImpl.get(id);
        return model;
    }
	
	/**
     * 跳转到新增页面
     * @return 新增页面逻辑视图
     */
    @RequestMapping("/add")
    public String add() {
        return "dailyProfit/add";
    }
    
    /**
     * 执行实际的新增操作
     * @param model 要新增的数据
     * @return 新增页面逻辑视图
     */
    @ResponseBody
    @RequestMapping("/doAdd")
    public JsonBean doAdd(DailyProfit model) {
        int result = dailyProfitServiceImpl.save(model);
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
     * 查看每日盈亏详情页。
     * @param model 查询参数，携带ID
     * @return 每日盈亏详情页
     */
    @RequestMapping("/detail")
    public String detail(DailyProfit model, Map<String, Object> maps) {
        model = dailyProfitServiceImpl.get(model.getId());
        maps.put("model", model);//将model放入视图中，供页面视图使用
        return "dailyProfit/detail";
    }
    
    /**
     * 跳转到编辑信息页面
     * @param model 查询参数，携带ID
     * @return 编辑页面
     */
    @RequestMapping("/edit")
    public String edit(DailyProfit model, Map<String, Object> maps) {
        model = dailyProfitServiceImpl.get(model.getId());
        maps.put("model", model);
        return "dailyProfit/edit";
    }
    
    /**
     * 更新每日盈亏信息
     * @param model 要更新的每日盈亏信息，含有ID
     * @return 操作结果信息
     */
    @ResponseBody
    @RequestMapping("/update")
    public JsonBean update(DailyProfit model) {
        int result = dailyProfitServiceImpl.updateById(model);
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
     * 删除每日盈亏信息
     * @param id 要删除的每日盈亏ID
     */
    @ResponseBody
    @RequestMapping("/delete")
    public JsonBean delete(Long id) {
        int result = dailyProfitServiceImpl.deleteById(id);
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
