package com.cabletech.res.service.publicmgr;

import java.util.List;
import java.util.Map;

import com.cabletech.core.service.BaseService;
import com.cabletech.res.entity.publicmgr.OdmEntity;

/**
 * Odm管理
 * @author zhanglei 2011-05-11
 *
 */
public interface OdmService  extends BaseService{

	/**
	 * 查询Odf系统
	 * @param map 条件
	 * @return 符合条件的List集合
	 */
	public List<Map<String, Object>> getOdfByGhOdm(Map<String, Object> map);
	/**
	 * 查询Odm系统
	 * @param map 条件
	 * @return 符合条件的List集合
	 */
	public List<Map<String, Object>> getOdmByGh(Map<String, Object> map);
	
	/**
	 * ODM批量编辑
	 * @param map 表单值
	 * @return
	 */
	public boolean batchEdit(Map<String, Object> map);	
	/**
	 * ODM的批量逻辑删除
	 * @param xtbh ODM的系统编号
	 * @return true删除成功 false删除失败
	 */
	public boolean batchDelete(String xtbh);
	
	/**
	 * Odm修改
	 * @param entity Odm实体
	 */
	public boolean saveorupdate(OdmEntity entity);
	
	/**
	 * 单条查看odm信息
	 * @param xtbh 系统编号
	 * @return 单条odm实体
	 */
	public OdmEntity getbyid(String xtbh);
	
	/**
	 * 单条删除
	 * @param xtbh 系统编号
	 * @return true 删除成功 false 删除失败
	 */
	public boolean delete(String xtbh);
	/**
	 * 获取资源相关结点串
	 * @param entity odm实体
	 * @return
	 */	
	public String getTreeNodes(OdmEntity entity);
	
	/**
	 * 根据odf系统编号或者光交接箱获取所有的ODM  吕仁钊 2012/7/7 添加
	 * @param xtbh odf或者光交接箱 系统编号
	 * @param zylx 资源类型
	 * @return
	 */	
	public List<OdmEntity> getByParentId(String xtbh,String zylx);
}
