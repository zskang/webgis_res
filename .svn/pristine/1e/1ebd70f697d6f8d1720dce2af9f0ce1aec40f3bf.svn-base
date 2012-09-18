package com.cabletech.res.service.opticcablemgr;

import com.cabletech.core.service.BaseService;
import com.cabletech.res.entity.opticcablemgr.GlplEntity;

/**
 * 光缆盘留信息管理
 * @author zhanglei 2011-05-11
 *
 */
public interface GlplService  extends BaseService{

	/**
	 * 保存
	 * @param entity 光缆盘留实体
	 */
	public boolean saveorupdate(GlplEntity entity);
	
	/**
	 * 查看
	 * @param xtbh 系统编号
	 * @return 光缆盘留实体
	 */
	public GlplEntity getbyid(String xtbh);
	
	/**
	 * 光缆盘留的逻辑删除
	 * @param xtbh 光缆盘留的系统编号
	 * @return true删除成功 false删除失败
	 */
	public boolean delete(String xtbh);
	
	/**
	 * 获取资源相关结点串
	 * @param entity 光缆盘留实体
	 * @return
	 */	
	public String getTreeNodes(GlplEntity entity);
	
	/**
	 * 光缆盘留的批量逻辑删除
	 * @param xtbh 光缆盘留的系统编号
	 * @return true删除成功 false删除失败
	 */
	public boolean batchDelete(String xtbh);
}
