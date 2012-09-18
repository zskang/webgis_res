package com.cabletech.res.service.cableequipmgr;

import java.util.List;
import java.util.Map;

import com.cabletech.core.service.BaseService;
import com.cabletech.res.entity.cableequipmgr.GfxxEntity;

/**
 * 光分纤箱信息管理Service
 * 
 * @author 杨隽 2011-05-23 创建
 * 
 */
public interface GfxxService extends BaseService {
	/**
	 * 保存
	 * 
	 * @param entity
	 *            GfxxEntity 光分纤箱实体
	 */
	public boolean saveOrUpdate(GfxxEntity entity);

	/**
	 * 查看
	 * 
	 * @param xtbh
	 *            String 系统编号
	 * @return GfxxEntity 光分纤箱实体
	 */
	public GfxxEntity view(String xtbh);

	/**
	 * 删除
	 * 
	 * @param xtbh
	 *            String 系统编号
	 */
	public void delete(String xtbh);
	
	/**
	 * 获取资源相关结点串
	 * @param entity 光分纤箱实体
	 * @return
	 */	
	public String getTreeNodes(GfxxEntity entity);
	
	/**
	 * 光分纤箱的批量逻辑删除
	 * @param xtbh 光分纤箱的系统编号
	 * @return true删除成功 false删除失败
	 */
	public boolean batchDelete(String xtbh);
	
	/**
	 * 光分纤箱批量编辑
	 * @param map 表单值
	 * @return
	 */
	public boolean batchEdit(Map<String, Object> map);	
	
	/**
	 * 获取资源树(连接管理模块需要，吕仁钊添加)
	 * @param map 表单值
	 * @return
	 */
	public List<Map<String,Object>> getResTree(String xtbh);
	
}
