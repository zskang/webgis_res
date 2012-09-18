package com.cabletech.res.service.publicmgr;

import java.util.List;
import java.util.Map;

import com.cabletech.core.service.BaseService;
import com.cabletech.res.entity.publicmgr.OdfEntity;

/**
 * Odf管理
 * @author zhanglei 2011-05-11
 *
 */
public interface OdfService  extends BaseService{

	/**
	 * Odf修改
	 * @param entity Odf实体
	 */
	public boolean saveorupdate(OdfEntity entity);
	
	/**
	 * 单条查看引上段系统信息
	 * @param xtbh 系统编号
	 * @return 单条Odf实体
	 */
	public OdfEntity getbyid(String xtbh);
  
	/**
	 * 单条删除
	 * @param xtbh 系统编号
	 * @return true 删除成功 false 删除失败
	 */
	public boolean delete(String xtbh);
	/**
	 * 获取资源相关结点串
	 * @param entity Odf实体
	 * @return
	 */	
	public String getTreeNodes(OdfEntity entity);
	
	/**
	 * ODF的批量逻辑删除
	 * @param xtbh ODF的系统编号
	 * @return true删除成功 false删除失败
	 */
	public boolean batchDelete(String xtbh);
	
	/**
	 * ODF批量编辑
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
