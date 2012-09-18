package com.cabletech.res.mapper.basemgr;

import java.util.List;
import java.util.Map;
import com.cabletech.res.entity.basemgr.YsxtEntity;

/**
 * 引上段系统管理
 * 
 * @author zhanglei 2012-05-11
 */
public interface YsxtMapper {
	
	/**
	 * 编辑
	 * @param entity 引上段系统实体
	 */
	public void update(YsxtEntity entity);
	
	/**
	 * 保存
	 * @param entity 引上段系统实体
	 */
	public void save(YsxtEntity entity);
	
	/**
	 * 查看
	 * @param xtbh 系统编号
	 * @return 引上段系统实体
	 */
	public YsxtEntity getbyid(String xtbh);
	
	/**
	 * 查询引上段系统
	 * @param map 条件
	 * @return 符合条件的List集合
	 */
	public List<Map<String, Object>> queryYsxtList(Map<String, Object> map);	
	/**
	 * 逻辑删除引上段系统
	 * @param xtbh 系统编号
	 */
	public void deleteYsxt(String xtbh);
	
	/**
	 * 根据引上系统的系统编号获取光缆段
	 * @param xtbh 引上系统的系统编号
	 * @return
	 */
	public List<Map<String, Object>> getGldlyByYsxtbh(String xtbh);
	
	/**
	 * 根据引上系统的系统编号获取引上
	 * @param xtbh 引上系统的系统编号
	 * @return
	 */	
	public  List<Map<String, Object>> getYsByYsxtbh(String xtbh);
	
	/**
	 * 引上系统批量编辑
	 * @param map 表单值
	 * @throws Exception
	 */
	public void batchEdit(Map<String, Object> map)throws Exception;	
}
