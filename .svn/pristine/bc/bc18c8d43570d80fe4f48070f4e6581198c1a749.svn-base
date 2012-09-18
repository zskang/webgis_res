package com.cabletech.res.service.basemgr;


import java.util.Map;

import com.cabletech.core.service.BaseService;
import com.cabletech.res.entity.basemgr.GddxtEntity;

/**
 * 承载--管道段系统管理 Service
 * 
 * @author 吕仁钊 2012/5/11
 */
public interface GddxtService extends BaseService {
	
	/**
	 * 根据id获取管道段系统信息
	 * @param resId 资源ID
	 */
	public GddxtEntity getbyid(String resId);
	
	
	/**
	 * 跟新管道端系统信息
	 * @param entity 管道段系统实体
	 */
	public boolean saveorupdate(GddxtEntity entity);
	
	
	
	/**
	 * 逻辑删除管道段系统
	 * @param xtbh 管道段系统编号
	 */
	public boolean delete(String xtbh);
	
	/**
	 * 获取资源相关结点串
	 * @param entity 管道段系统
	 * @return
	 */	
	public String getTreeNodes(GddxtEntity entity);
	
	/**
	 * 管道段系统的批量逻辑删除
	 * @param xtbh 管道段系统的系统编号
	 * @return true删除成功 false删除失败
	 */
	public boolean batchDelete(String xtbh);	
	
	/**
	 * 管道段系统批量编辑
	 * @param map 表单值
	 * @return
	 */
	public boolean batchEdit(Map<String, Object> map);	
	
}
