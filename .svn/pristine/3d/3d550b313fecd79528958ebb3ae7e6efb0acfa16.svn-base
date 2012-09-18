package com.cabletech.res.mapper.groupcustomsmgr;

import java.util.List;
import java.util.Map;

import com.cabletech.res.entity.groupcustomsmgr.BroadBandEntity;
/**
 * 宽带小区管理
 * @author Administrator
 *
 */
/**
 * 宽带小区mapper
 * @author wangt
 *
 */

public interface BroadBandMapper {
	/**
	 * 保存
	 * @param entity 宽带小区实体
	 */
	public void save(BroadBandEntity entity);
 	
	/**
	 * 编辑
	 * @param entity 宽带小区实体
	 */
	public void update(BroadBandEntity entity);
	
	/**
	 * 查看
	 * @param xtbh 系统编号
	 * @return 宽带小区实体
	 */
	public BroadBandEntity getbyid(String xtbh);
	
	/**
	 * 查询宽带小区资源
	 * @param map 传入条件｛｝
	 * @return
	 */
	public List<Map<String, Object>> queryBroadBandList(Map<String, Object> map);	
	
	/**
	 * 查询宽带小区资源
	 * @param map 传入条件｛｝
	 * @return
	 */
	public List<Map<String, Object>> queryBroadBandListWithSimid(Map<String, Object> map);
	 
	/**
	 * 逻辑删除
	 * @param xtbh 系统编号
	 */
	public void delete(String xtbh);
	
}
