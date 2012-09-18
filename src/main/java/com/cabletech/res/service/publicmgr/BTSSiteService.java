package com.cabletech.res.service.publicmgr;

import java.util.Map;

import com.cabletech.core.service.BaseService;
import com.cabletech.res.entity.publicmgr.BTSSiteEntity;

/**
 * BTSSite 业务接口类
 * 
 * @author wangt
 * 
 */
public interface BTSSiteService extends BaseService {

	/**
	 * 查看
	 * 
	 * @param btssiteid
	 *            String 系统编号
	 * @return BTSSiteEntity
	 */
	BTSSiteEntity view(String btssiteid);

	/**
	 * BTSSite删除
	 * 
	 * @param btssiteid
	 *            String 系统编号
	 * @return
	 */
	boolean delete(String btssiteid);

	/**
	 * 设置条件
	 * 
	 * @param conditionMap
	 *            Map<String, Object>
	 */
	void setExportconditionmap(Map<String, Object> conditionMap);

	/**
	 * BTSSite保存或修改
	 * 
	 * @param entity
	 *            BTSSiteEntity
	 * @return
	 */
	boolean save(BTSSiteEntity entity);
}
