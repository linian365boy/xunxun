package com.vteba.xunxun.stock.service.spi;

import java.util.List;

import com.vteba.xunxun.stock.model.DailyProfit;
import com.vteba.xunxun.stock.model.DailyProfitBean;

/**
 * 每日盈亏相关的业务service接口。
 * @author yinlei
 * @date 2015-3-9 15:23:43
 */
public interface DailyProfitService {

    /**
     * 根据params所携带条件进行count计数。
     * @param params 查询条件
     * @return 统计的记录条数
     */
    public int count(DailyProfitBean params);

    /**
     * 根据params所携带条件进行计数，条件是等于，且是and关系。
     * @param params 查询条件
     * @return 统计的记录条数
     */
    public int countBy(DailyProfit params);

    /**
     * 根据params所携带条件删除记录，适用于复杂条件。
     * @param params 查询条件
     * @return 删除的记录条数
     */
    public int deleteBatch(DailyProfitBean params);

    /**
     * 根据params所携带条件删除数据，条件是等于，且是and关系。
     * @param params 删除条件
     * @return 删除的记录条数
     */
    public int deleteBulks(DailyProfit params);

    /**
     * 根据主键删除记录。
     * @param id 主键id
     * @return 删除的记录条数，1或0
     */
    public int deleteById(Long id);

    /**
     * 插入记录，只有非空字段才会插入到数据库。
     * @param record 要被保存的数据
     * @return 保存成功的记录条数，1或0
     */
    public int save(DailyProfit record);

    /**
     * 根据params所携带条件查询数据，适用于复杂查询。
     * @param params 查询条件
     * @return 每日盈亏实体list
     */
    public List<DailyProfit> queryForList(DailyProfitBean params);

    /**
     * 根据params所携带条件查询数据，条件是等于，且是and关系。
     * @param params 查询条件
     * @return 每日盈亏实体list
     */
    public List<DailyProfit> queryList(DailyProfit params);

    /**
     * 根据params所携带条件分页查询数据，适用于复杂查询。
     * @param params 查询条件
     * @return 每日盈亏实体list
     */
    public List<DailyProfit> pagedForList(DailyProfitBean params);

    /**
     * 根据params所携带条件分页查询数据，条件是等于，且是and关系。
     * @param params 查询条件
     * @return 每日盈亏实体list
     */
    public List<DailyProfit> pagedList(DailyProfit params);

    /**
     * 根据主键查询数据。
     * @param id 主键
     * @return 每日盈亏实体
     */
    public DailyProfit get(Long id);
    
    /**
     * 根据params所携带条件查询唯一记录，条件是等于，且是and关系。
     * @param params 查询条件
     * @return 每日盈亏实体
     */
    public DailyProfit unique(DailyProfit params);

    /**
     * 根据params所携带条件更新指定字段，适用于复杂条件。
     * @param record 要更新的数据
     * @param params update的where条件
     * @return 更新记录条数
     */
    public int updateBatch(DailyProfit record, DailyProfitBean params);

    /**
     * 根据params所携带条件更新指定字段，条件是等于，且是and关系。
     * @param record 要更新的数据
     * @param params update的where条件
     * @return 更新记录条数
     */
    public int updateBulks(DailyProfit record, DailyProfit params);

    /**
     * 根据主键更新指定字段的数据。
     * @param record 要更新的数据，含有Id
     * @return 更新记录条数
     */
    public int updateById(DailyProfit record);

}
