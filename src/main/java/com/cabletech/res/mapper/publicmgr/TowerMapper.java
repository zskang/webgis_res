package com.cabletech.res.mapper.publicmgr;

import java.util.List;
import java.util.Map;

import com.cabletech.res.entity.publicmgr.TowerEntity;

/**
 * 铁塔
 * @author wangt
 *
 */
public interface TowerMapper {

	/**
	 * 删除
	 * @param towerid 
	 */
	public void delete(String towerid);

	/**
	 * 查看
	 * @param towerid 
	 * @return
	 */
	public TowerEntity getbyid(String towerid);

	/**
	 * update
	 * @param entity 
	 */
	public void update(TowerEntity entity);

	/**
	 * 保存
	 * @param entity 
	 */
	public void save(TowerEntity entity);
	
	/**
	 * 查询列表
	 * @param map 
	 */
	List<Map<String, Object>> queryTowerList(Map<String, Object> map);

}
