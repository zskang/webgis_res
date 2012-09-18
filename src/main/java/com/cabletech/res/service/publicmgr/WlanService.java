package com.cabletech.res.service.publicmgr;

import java.util.List;
import java.util.Map;

import com.cabletech.core.service.BaseService;
import com.cabletech.res.entity.publicmgr.WlanEntity;

/**
 * 站点信息管理Service
 * 
 * @author
 * 
 */
public interface WlanService extends BaseService {
	/**
	 * 保存
	 * 
	 * @param entity
	 *            WlanEntity 站点实体
	 */
	public boolean save(WlanEntity entity);

	/**
	 * 查看
	 * 
	 * @param id
	 *            String 系统编号
	 * @return WlanEntity 站点实体
	 */
	public WlanEntity view(String id);

	/**
	 * 批量删除
	 * 
	 * @param ids 多个id
	 * @return
	 */
	public boolean batchDelete(String ids);

	/**
	 * 删除
	 * 
	 * @param id
	 *            String 系统编号
	 */
	public boolean delete(String id);

	/**
	 * 查询列表页面
	 * 
	 * @param map 查询条件
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryWlanList(Map<String, Object> map)
			throws Exception;

	/**
	 * 设置条件
	 * 
	 * @param conditionMap 条件map
	 */
	void setExportconditionmap(Map<String, Object> conditionMap);

}
