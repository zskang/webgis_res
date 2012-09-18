package com.cabletech.res.service.basemgr;

import java.util.Map;

import com.cabletech.core.service.BaseService;
import com.cabletech.res.entity.basemgr.GjxxEntity;

/**
 * 管井信息管理
 * @author zhanglei 2011-05-11
 *
 */
public interface GjxxService  extends BaseService{

	/**
	 * 保存
	 * @param entity 管井实体
	 */
	public boolean saveorupdate(GjxxEntity entity);
	
	/**
	 * 查看
	 * @param xtbh 系统编号
	 * @return 管井实体
	 */
	public GjxxEntity getbyid(String xtbh);
	
	/**
	 * 管井的逻辑删除
	 * @param xtbh 管井的系统编号
	 * @return true删除成功 false删除失败
	 */
	public boolean delete(String xtbh);
	
	/**
	 * 获取资源相关结点串
	 * @param entity 管井实体
	 * @return
	 */	
	public String getTreeNodes(GjxxEntity entity);
	
	/**
	 * 管井的批量逻辑删除
	 * @param xtbh 管井的系统编号
	 * @return true删除成功 false删除失败
	 */
	public boolean batchDelete(String xtbh);
	
	/**
	 * 管道段批量编辑
	 * @param map 表单值
	 * @return
	 */
	public boolean batchEdit(Map<String, Object> map);	
}
