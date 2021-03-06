package com.cabletech.res.service.basemgr;

import java.util.Map;

import com.cabletech.core.service.BaseService;
import com.cabletech.res.entity.basemgr.BsdEntity;

/**
 * 直埋段信息管理
 * @author zhanglei 2011-05-11
 *
 */
public interface BsdService  extends BaseService{
	/**
	 * 查询标石段是否已存在
	 * @param map 传入条件
	 * @return
	 */
	public String getBsdIsExist(Map<String, Object> map); 
	/**
	 * 保存
	 * @param entity 直埋段实体
	 */
	public boolean saveorupdate(BsdEntity entity);

	/**
	 * 逻辑删除
	 * @param xtbh 系统编号
	 */
	public boolean delete(String xtbh);
   
	/**
	 * 查看
	 * @param xtbh 系统编号
	 * @return 直埋段实体
	 */
	public BsdEntity getbyid(String xtbh);
	

	/**
	 * 获取资源相关结点串
	 * @param entity 直埋段实体
	 * @return
	 */	
	public String getTreeNodes(BsdEntity entity);
	
	/**
	 * 直埋段的批量逻辑删除
	 * @param xtbh 直埋段的系统编号
	 * @return true删除成功 false删除失败
	 */
	public boolean batchDelete(String xtbh);	
	
	/**
	 * 直埋段批量编辑
	 * @param map 表单值
	 * @return
	 */
	public boolean batchEdit(Map<String, Object> map);	
}
