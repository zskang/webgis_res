package com.cabletech.res.service.basemgr;

import java.util.Map;

import com.cabletech.core.service.BaseService;
import com.cabletech.res.entity.basemgr.DgxxEntity;

/**
 * 电杆信息管理
 * @author zhb 2011-05-11
 *
 */
public interface DgxxService  extends BaseService{
	/**
	 * 获取电杆信息实体
	 * @param resId 资源编号
	 * @return entity
	 */
	public DgxxEntity getbyid(String resId);
	
	/**
	 * 新增或更新电杆信息实体
	 * @param entity 电杆实体
	 */
	public boolean saveorupdate(DgxxEntity entity);
	
	/**
	 * 逻辑删除电杆
	 * @param entity 电杆实体
	 */
	public boolean delete(DgxxEntity entity);	
	
	/**
	 * 获取资源相关结点串
	 * @param entity 电杆
	 * @return
	 */	
	public String getTreeNodes(DgxxEntity entity);
	
	/**
	 * 电杆的批量逻辑删除
	 * @param xtbh 电杆的系统编号
	 * @return true删除成功 false删除失败
	 */
	public boolean batchDelete(String xtbh);
	
	/**
	 * 电杆批量编辑
	 * @param map 表单值
	 * @return
	 */
	public boolean batchEdit(Map<String, Object> map);		
}
