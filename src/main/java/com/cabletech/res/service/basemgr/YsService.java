package com.cabletech.res.service.basemgr;

import java.util.Map;

import com.cabletech.core.service.BaseService;
import com.cabletech.res.entity.basemgr.YsEntity;

/**
 * 引上段管理
 * @author zhanglei 2011-05-11
 *
 */
public interface YsService  extends BaseService{

	/**
	 * 引上段修改
	 * @param entity 引上段实体
	 */
	public boolean saveorupdate(YsEntity entity);
	
	/**
	 * 单条查看引上段信息
	 * @param xtbh 系统编号
	 * @return 单条引上段实体
	 */
	public YsEntity getbyid(String xtbh);
	
	/**
	 * 引上段单条删除
	 * @param xtbh 系统编号
	 * @return Boolean 删除成功或者失败
	 */
	public boolean delete(String xtbh);
	
	/**
	 * 获取资源相关结点串
	 * @param entity 引上实体
	 * @return
	 */
	public String getTreeNodes(YsEntity entity);
	
	/**
	 * 引上的批量逻辑删除
	 * @param xtbh 引上的系统编号
	 * @return true删除成功 false删除失败
	 */
	public boolean batchDelete(String xtbh);	
	
	/**
	 * 引上批量编辑
	 * @param map 表单值
	 * @return
	 */
	public boolean batchEdit(Map<String, Object> map);
}
