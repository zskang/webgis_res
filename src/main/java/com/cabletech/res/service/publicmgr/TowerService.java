package com.cabletech.res.service.publicmgr;

import java.util.Map;

import com.cabletech.core.service.BaseService;
import com.cabletech.res.entity.publicmgr.TowerEntity;

/**
 * 铁塔
 * @author wangt
 *
 */
public interface TowerService extends BaseService {

	/**
	 * 删除
	 * @param towerid 
	 * @return
	 */
	boolean delete(String towerid);

	/**
	 * 查看
	 * @param towerid 
	 * @return
	 */
	TowerEntity view(String towerid);

	/**
	 * 保存
	 * @param entity 
	 * @return
	 */
	boolean save(TowerEntity entity);
	/**
	 * 设置条件
	 * @param conditionMap  
	 */
	void setExportconditionmap(Map<String, Object> conditionMap);
}
