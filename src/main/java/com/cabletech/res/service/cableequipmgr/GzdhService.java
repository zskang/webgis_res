package com.cabletech.res.service.cableequipmgr;

import java.util.List;
import java.util.Map;

import com.cabletech.core.service.BaseService;
import com.cabletech.res.entity.cableequipmgr.GzdhEntity;

/**
 * 光终端盒信息管理
 * @author zhanglei 2011-05-11
 *
 */
public interface GzdhService  extends BaseService{

	/**
	 * 保存
	 * @param entity 光终端盒实体
	 * @return 
	 */
	public boolean saveorupdate(GzdhEntity entity);
	
	/**
	 * 查看
	 * @param xtbh 系统编号
	 * @return 光终端盒实体
	 */
	public GzdhEntity getbyid(String xtbh);

	/**
	 * 删除
	 * @param entity 光终端盒实体
	 * @return
	 */
	public boolean delete(GzdhEntity entity);
	
	/**
	 * 获取资源相关结点串
	 * @param entity 光终端盒实体
	 * @return
	 */	
	public String getTreeNodes(GzdhEntity entity);
	
	/**
	 * 光终端盒的批量逻辑删除
	 * @param xtbh 光终端盒的系统编号
	 * @return true删除成功 false删除失败
	 */
	public boolean batchDelete(String xtbh);
	
	/**
	 * 光终端盒批量编辑
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
