package com.cabletech.res.service.basemgr;

import java.util.Map;

import com.cabletech.core.service.BaseService;
import com.cabletech.res.entity.basemgr.YsxtEntity;

/**
 * 引上段系统管理
 * @author zhanglei 2011-05-11
 *
 */
public interface YsxtService  extends BaseService{

	/**
	 * 引上段系统修改
	 * @param entity 引上段系统实体
	 */
	public boolean saveorupdate(YsxtEntity entity);
	
	/**
	 * 单条查看引上段系统
	 * @param xtbh 系统编号
	 * @return 单条引上段系统实体
	 */
	public YsxtEntity getbyid(String xtbh);
	
	/**
	 * 单条引上段系统删除
	 * @param xtbh 系统编号 
	 * @return true 删除成功 false 删除失败
	 */
	public boolean delete(String xtbh);
	
	/**
	 * 获取资源相关结点串
	 * @param entity 引上系统实体
	 * @return
	 */
	public String getTreeNodes(YsxtEntity entity);	
	
	/**
	 * 引上系统的批量逻辑删除
	 * @param xtbh 引上系统的系统编号
	 * @return true删除成功 false删除失败
	 */
	public boolean batchDelete(String xtbh);	
	
	/**
	 * 引上系统批量编辑
	 * @param map 表单值
	 * @return
	 */
	public boolean batchEdit(Map<String, Object> map);	
}
