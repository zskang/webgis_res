package com.cabletech.res.mapper.publicmgr;

import java.util.List;
import java.util.Map;
import com.cabletech.res.entity.publicmgr.OdmEntity;

/**
 * Odm信息管理
 * 
 * @author zhanglei 2012-05-11
 */
public interface OdmMapper {
	
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
	 * @throws Exception
	 */
	public void batchEdit(Map<String, Object> map)throws Exception;	
	
	public void deleteOdfConnByOdmXtbh(String xtbh); 
	
	/**
	 * 编辑
	 * @param entity Odm实体
	 */
	public void update(OdmEntity entity);
	
	/**
	 * 保存
	 * @param entity Odm实体
	 */
	public void save(OdmEntity entity);
	
	/**
	 * 查看
	 * @param xtbh 系统编号
	 * @return Odm实体
	 */
	public OdmEntity getbyid(String xtbh);
	
	/**
	 * 查询Odm系统
	 * @param map 条件
	 * @return 符合条件的List集合
	 */
	public List<Map<String, Object>> queryOdm(Map<String, Object> map);	
	/**
	 * 逻辑删除Odm系统
	 * @param xtbh 系统编号
	 */
	public void deleteOdm(String xtbh);
	
	/**
	 * 逻辑删除odm根据站点编号
	 * @param xtbh 站点系统编号
	 */
	public void deleteOdmByZdxxXtbh(String xtbh);
	
	/**
	 * 逻辑删除odm根据机房编号
	 * @param xtbh 机房系统编号
	 */
	public void deleteOdmByJfxxXtbh(String xtbh);
	
	/**
	 * 逻辑删除odm根据odf系统编号
	 * @param xtbh odf系统编号
	 */
	public void deleteOdmByOdfXtbh(String xtbh);
	
	/**
	 * 根据odf系统编号或者光交接箱获取所有的ODM  吕仁钊 2012/7/7 添加
	 * @param params 查询参数
	 * @return
	 */
	public List<OdmEntity> getByParentId(Map<String,Object> params);
}
