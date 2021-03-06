package com.cabletech.res.service.publicmgr;


import java.util.List;
import java.util.Map;

import com.cabletech.core.service.BaseService;
import com.cabletech.res.entity.publicmgr.PrepeaterEntity;

/**
 * 直放站信息管理Service
 * 
 * @author
 * 
 */
public interface PrepeaterService extends BaseService {
	/**
	 * 保存
	 * 
	 * @param entity
	 *            PrepeaterEntity 站点实体
	 */
	public boolean save(PrepeaterEntity entity) throws Exception;
	/**
	 * 查看
	 * 
	 * @param id
	 *            String 系统编号
	 * @return PrepeaterEntity 站点实体
	 */
	public PrepeaterEntity view(String id) throws Exception;

	/**
	 * 删除
	 * 
	 * @param id
	 *            String 系统编号
	 */
	public boolean delete(String id) throws Exception;

	/**
	 * 站点的批量逻辑删除
	 * 
	 * @param id
	 *            站点的系统编号
	 * @return true删除成功 false删除失败
	 */
	public boolean batchDelete(String id) throws Exception;
	
	/**
	 * 获取列表
	 * @param map
	 * @return
	 * @throws Exception 
	 */
	public List<Map<String, Object>> queryPrepeaterList(Map<String, Object> map) throws Exception;
	/**
	 * 设置条件
	 * @param conditionMap  
	 */
	void setExportconditionmap(Map<String, Object> conditionMap);

 }