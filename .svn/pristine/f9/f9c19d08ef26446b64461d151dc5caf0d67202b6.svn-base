package com.cabletech.res.service.basemgr;

import java.util.Map;

import com.cabletech.core.service.BaseService;
import com.cabletech.res.entity.basemgr.BsdxtEntity;

/**
 * 直埋段系统信息管理
 * @author zhanglei 2011-05-11
 *
 */
public interface BsdxtService  extends BaseService{

	/**
	 * 保存
	 * @param entity 直埋段系统实体
	 */
	public boolean saveorupdate(BsdxtEntity entity);
	
	/**
	 * 查看
	 * @param xtbh 系统编号
	 * @return 直埋段系统实体
	 */
	public BsdxtEntity getbyid(String xtbh);
	
	/**
	 * 直埋段系统删除
	 * @param xtbh 系统编号
	 * @return 
	 */
	public boolean delete(String xtbh);
	

	/**
	 * 获取资源相关结点串
	 * @param entity 直埋段系统实体
	 * @return
	 */	
	public String getTreeNodes(BsdxtEntity entity);
	
	/**
	 * 直埋系统的批量逻辑删除
	 * @param xtbh 直埋系统的系统编号
	 * @return true删除成功 false删除失败
	 */
	public boolean batchDelete(String xtbh);
	
	/**
	 * 直埋系统批量编辑
	 * @param map 表单值
	 * @return
	 */
	public boolean batchEdit(Map<String, Object> map);		
}
