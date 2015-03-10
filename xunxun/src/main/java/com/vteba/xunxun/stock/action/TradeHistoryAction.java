package com.vteba.xunxun.stock.action;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.vteba.xunxun.stock.model.TradeHistory;
import com.vteba.xunxun.stock.service.spi.TradeHistoryService;

import com.vteba.web.action.GenericAction;
import com.vteba.web.action.JsonBean;

/**
 * 股票交易历史控制器
 * @author yinlei
 * @date 2015-3-9 15:23:43
 */
@Controller
@RequestMapping("/tradeHistory")
public class TradeHistoryAction extends GenericAction<TradeHistory> {
	@Inject
	private TradeHistoryService tradeHistoryServiceImpl;
	
	/**
     * 获得股票交易历史List，初始化列表页。
     * @param model 参数
     * @return 股票交易历史List
     */
    @RequestMapping("/initial")
    public String initial(TradeHistory model, Map<String, Object> maps) {
        List<TradeHistory> list = tradeHistoryServiceImpl.pagedList(model);
        maps.put("list", list);
        return "tradeHistory/initial";
    }
	
	/**
	 * 获得股票交易历史List，Json格式。
	 * @param model 参数
	 * @return 股票交易历史List
	 */
	@ResponseBody
	@RequestMapping("/list")
	public List<TradeHistory> list(TradeHistory model) {
		List<TradeHistory> list = tradeHistoryServiceImpl.pagedList(model);
		return list;
	}
	
	/**
     * 根据Id获得股票交易历史实体，Json格式。
     * @param id 参数id
     * @return 股票交易历史实体
     */
    @ResponseBody
    @RequestMapping("/get")
    public TradeHistory get(Long id) {
        TradeHistory model = tradeHistoryServiceImpl.get(id);
        return model;
    }
	
	/**
     * 跳转到新增页面
     * @return 新增页面逻辑视图
     */
    @RequestMapping("/add")
    public String add() {
        return "tradeHistory/add";
    }
    
    /**
     * 执行实际的新增操作
     * @param model 要新增的数据
     * @return 新增页面逻辑视图
     */
    @ResponseBody
    @RequestMapping("/doAdd")
    public JsonBean doAdd(TradeHistory model) {
        int result = tradeHistoryServiceImpl.save(model);
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
     * 查看股票交易历史详情页。
     * @param model 查询参数，携带ID
     * @return 股票交易历史详情页
     */
    @RequestMapping("/detail")
    public String detail(TradeHistory model, Map<String, Object> maps) {
        model = tradeHistoryServiceImpl.get(model.getId());
        maps.put("model", model);//将model放入视图中，供页面视图使用
        return "tradeHistory/detail";
    }
    
    /**
     * 跳转到编辑信息页面
     * @param model 查询参数，携带ID
     * @return 编辑页面
     */
    @RequestMapping("/edit")
    public String edit(TradeHistory model, Map<String, Object> maps) {
        model = tradeHistoryServiceImpl.get(model.getId());
        maps.put("model", model);
        return "tradeHistory/edit";
    }
    
    /**
     * 更新股票交易历史信息
     * @param model 要更新的股票交易历史信息，含有ID
     * @return 操作结果信息
     */
    @ResponseBody
    @RequestMapping("/update")
    public JsonBean update(TradeHistory model) {
        int result = tradeHistoryServiceImpl.updateById(model);
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
     * 删除股票交易历史信息
     * @param id 要删除的股票交易历史ID
     */
    @ResponseBody
    @RequestMapping("/delete")
    public JsonBean delete(Long id) {
        int result = tradeHistoryServiceImpl.deleteById(id);
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
