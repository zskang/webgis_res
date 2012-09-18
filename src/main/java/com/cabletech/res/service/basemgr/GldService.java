package com.cabletech.res.service.basemgr;

import java.util.Map;

import com.cabletech.core.service.BaseService;
import com.cabletech.res.entity.basemgr.GldEntity;

/**
 * 承载--杆路段管理 Service
 * 
 * @author zhb @date 2012/5/11
 */
public interface GldService extends BaseService {
	/**
	 * 查询杆路段是否已存在
	 * @param map 传入条件
	 * @return
	 */
	public String getGldIsExist(Map<String, Object> map); 
	/**
	 * 获取杆路段实体
	 * @param resId 资源编号
	 * @return entity
	 */
	public GldEntity getbyid(String resId);
	
	/**
	 * 新增或更新杆路段实体
	 * @param entity 杆路实体
	 */
	public boolean saveorupdate(GldEntity entity);	
	
	/**
	 * 逻辑删除杆路段
	 * @param entity 杆路实体
	 */
	public boolean delete(GldEntity entity);
	
	/**
	 * 获取资源相关结点串
	 * @param entity 杆路实体
	 * @return
	 */	
	public String getTreeNodes(GldEntity entity);
	
	/**
	 * 杆路段的批量逻辑删除
	 * @param xtbh 杆路段的系统编号
	 * @return true删除成功 false删除失败
	 */
	public boolean batchDelete(String xtbh);
	
	/**
	 * 杆路段批量编辑
	 * @param map 表单值
	 * @return
	 */
	public boolean batchEdit(Map<String, Object> map);		
}
