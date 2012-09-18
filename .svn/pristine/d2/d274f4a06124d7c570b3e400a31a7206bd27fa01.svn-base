package com.cabletech.res.service.basemgr;

import java.util.Map;

import com.cabletech.core.service.BaseService;
import com.cabletech.res.entity.basemgr.GqdxtEntity;

/**
 * 挂墙段系统管理
 * @author zhanglei 2011-05-11
 *
 */
public interface GqdxtService  extends BaseService{
 
	/**
	 * 挂墙段系统修改
	 * @param entity 挂墙段实体
	 */
	public boolean saveorupdate(GqdxtEntity entity);
	
	/**
	 * 单条查看挂墙段系统信息
	 * @param xtbh 系统编号
	 * @return 单条挂墙段系统实体
	 */
	public GqdxtEntity getbyid(String xtbh);
	
	/**
	 * 挂墙段系统单条删除
	 * @param xtbh 系统编号
	 * @return Boolean 删除成功或者失败
	 */
	public boolean delete(String xtbh);
	/**
	 * 获取资源相关结点串
	 * @param entity 挂墙段系统实体
	 * @return
	 */	
	public String getTreeNodes(GqdxtEntity entity);
	
	/**
	 * 挂墙系统的批量逻辑删除
	 * @param xtbh 挂墙系统的系统编号
	 * @return true删除成功 false删除失败
	 */
	public boolean batchDelete(String xtbh);

	/**
	 * 挂墙系统批量编辑
	 * @param map 表单值
	 * @return
	 */
	public boolean batchEdit(Map<String, Object> map);	
}
