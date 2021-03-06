package com.cabletech.res.service.groupcustomsmgr;

import org.springframework.transaction.annotation.Transactional;

import com.cabletech.core.service.BaseService;
import com.cabletech.res.entity.groupcustomsmgr.CampusEntity;

/**
 * 校园网管理 Service
 * 
 * @author zhb @date 2012/5/11
 */
public interface CampusService extends BaseService {
	/**
	 * 获取校园网实体
	 * @param resId 资源编号
	 * @return entity
	 */
	public CampusEntity getbyid(String resId);
	
	/**
	 * 新增或更新校园网实体
	 * @param entity 校园网实体
	 */
	public boolean saveorupdate(CampusEntity entity);	
	
	/**
	 * 逻辑删除校园网
	 * @param entity 校园网实体
	 */
	public boolean delete(CampusEntity entity);
	
	/**
	 * 批量编辑
	 * @param xtbhs 系统编号
	 * @return 成功失败
	 */
	public boolean batchDelete(String xtbhs);	
}
