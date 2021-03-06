package com.cabletech.res.service.opticcablemgr;

import java.util.Map;

import com.cabletech.core.service.BaseService;
import com.cabletech.res.entity.opticcablemgr.GlxxEntity;

/**
 * 光缆信息管理
 * @author zhanglei 2011-05-11
 *
 */
public interface GlxxService  extends BaseService{

	/**
	 * 光缆信息修改
	 * @param entity 光缆信息实体
	 */
	public boolean saveorupdate(GlxxEntity entity);
	
	/**
	 * 单条查看光缆信息
	 * @param xtbh 系统编号
	 * @return 单条光缆信息实体
	 */
	public GlxxEntity getbyid(String xtbh);
 
	/**
	 * 单条删除
	 * @param xtbh 系统编号
	 * @return true 删除成功 false 删除失败
	 */
	public boolean delete(String xtbh);
	
	/**
	 * 单条删除
	 * @param xtbh 系统编号
	 * @return true 删除成功 false 删除失败
	 */
	public boolean batchDelete(String xtbh);	
	
	/**
	 * 获取资源相关结点串
	 * @param entity 光缆信息实体
	 * @return
	 */	
	public String getTreeNodes(GlxxEntity entity);
	
	/**
	 * 光缆批量编辑
	 * @param map 表单值
	 * @return
	 */
	public boolean batchEdit(Map<String, Object> map);
}
