package com.cabletech.res.service.basemgr;

import java.util.Map;

import com.cabletech.core.service.BaseService;
import com.cabletech.res.entity.basemgr.GqdEntity;

/**
 * 挂墙段管理
 * @author zhanglei 2011-05-11
 *
 */
public interface GqdService  extends BaseService{

	/**
	 * 查询挂墙段是否已存在
	 * @param map 传入条件
	 * @return
	 */
	public String getGqdIsExist(Map<String, Object> map); 
	/**
	 * 挂墙段修改
	 * @param entity 挂墙段实体
	 */
	public boolean saveorupdate(GqdEntity entity);
  
	/**
	 * 单条查看挂墙段信息
	 * @param xtbh 系统编号
	 * @return 单条挂墙段实体
	 */
	public GqdEntity getbyid(String xtbh);
	
	/**
	 * 挂墙段单条删除
	 * @param xtbh 系统编号
	 * @return Boolean 删除成功或者失败
	 */
	public Boolean delete(String xtbh);
	
	/**
	 * 获取资源相关结点串
	 * @param entity 挂墙段实体
	 * @return
	 */	
	public String getTreeNodes(GqdEntity entity);
	
	/**
	 * 挂墙段的批量逻辑删除
	 * @param xtbh 挂墙段的系统编号
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
