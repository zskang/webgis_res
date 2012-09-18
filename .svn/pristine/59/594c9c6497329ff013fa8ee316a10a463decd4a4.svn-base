package com.cabletech.res.service.basemgr;

import java.util.Map;

import com.cabletech.core.service.BaseService;
import com.cabletech.res.entity.basemgr.GqxxEntity;

/**
 * 挂墙信息管理
 * @author zhanglei 2011-05-11
 *
 */
public interface GqxxService  extends BaseService{
 
	/**
	 * 挂墙修改
	 * @param entity 挂墙实体
	 */
	public boolean saveorupdate(GqxxEntity entity);
 
	/**
	 * 单条查看挂墙信息
	 * @param xtbh 系统编号
	 * @return 单条挂段实体
	 */
	public GqxxEntity getbyid(String xtbh);
	
	
	/**
	 * 挂墙单条删除
	 * @param xtbh 系统编号 
	 * @return Boolean 删除成功或者失败
	 */
	public boolean delete(String xtbh);
	
	/**
	 * 获取资源相关结点串
	 * @param entity 挂墙实体
	 * @return
	 */	
	public String getTreeNodes(GqxxEntity entity);
	
	/**
	 * 挂墙的批量逻辑删除
	 * @param xtbh 挂墙的系统编号
	 * @return true删除成功 false删除失败
	 */
	public boolean batchDelete(String xtbh);
	
	/**
	 * 挂墙批量编辑
	 * @param map 表单值
	 * @return
	 */
	public boolean batchEdit(Map<String, Object> map);	
}
