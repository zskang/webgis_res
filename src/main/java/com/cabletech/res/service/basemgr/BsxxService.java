package com.cabletech.res.service.basemgr;

import java.util.Map;

import com.cabletech.core.service.BaseService;
import com.cabletech.res.entity.basemgr.BsxxEntity;

/**
 * 标石信息管理
 * @author zhanglei 2011-05-11
 *
 */
public interface BsxxService  extends BaseService{

	/**
	 * 保存
	 * @param entity 标石实体
	 */
	public boolean saveorupdate(BsxxEntity entity);
	
	/**
	 * 查看
	 * @param xtbh 系统编号
	 * @return 标石实体
	 */
	public BsxxEntity getbyid(String xtbh);
	
	/**
	 * 标石信息删除
	 * @param xtbh 系统编号
	 * @return 
	 */
	public boolean delete(String xtbh);
	
	/**
	 * 获取资源相关结点串
	 * @param entity 标石实体
	 * @return
	 */	
	public String getTreeNodes(BsxxEntity entity);
	
	/**
	 * 标石的批量逻辑删除
	 * @param xtbh 标石的系统编号
	 * @return true删除成功 false删除失败
	 */
	public boolean batchDelete(String xtbh);	
	
	/**
	 * 标石批量编辑
	 * @param map 表单值
	 * @return
	 */
	public boolean batchEdit(Map<String, Object> map);	
}
