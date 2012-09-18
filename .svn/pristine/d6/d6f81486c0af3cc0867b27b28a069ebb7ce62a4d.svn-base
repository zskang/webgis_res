package com.cabletech.res.mapper.basemgr;

import java.util.List;
import java.util.Map;
import com.cabletech.res.entity.basemgr.BsxxEntity;

/**
 * 标石信息管理
 * 
 * @author zhanglei 2012-05-11
 */
public interface BsxxMapper {

	/**
	 * 根据标石编号获取相关光接头
	 * @param xtbh 系统编号
	 * @return
	 */	
	public List<Map<String, Object>> getGjtByGjbh(String xtbh);
	
	/**
	 * 查询
	 * 
	 * @param map  包含SIMID条件
	 */
	public List<Map<String, Object>> queryBsxxList(Map<String, Object> map);

	/**
	 * 查询
	 * 
	 * @param map 不包含SIMID的条件
	 */
	public List<Map<String, Object>> queryBsxxListNoSimid(Map<String, Object> map);

	/**
	 * 保存
	 * 
	 * @param entity 标石实体
	 */
	public void save(BsxxEntity entity);

	/**
	 * 编辑
	 * 
	 * @param entity 标石实体
	 */
	public void update(BsxxEntity entity);

	/**
	 * 查看
	 * 
	 * @param xtbh 系统编号
	 * @return 标石实体
	 */
	public BsxxEntity getbyid(String xtbh);

	/**
	 * 逻辑删除
	 * 
	 * @param xtbh 系统编号
	 */
	public void deleteBs(String xtbh);
	
	/**
	 * 获取标石信息关联的光缆段路由
	 * @param xtbh 系统编号
	 * @return
	 */
	public List<Map<String,Object>> getGldlyBybsxx(String xtbh);
	
	/**
	 * 获取标石信息关联的直埋段
	 * @param xtbh 系统编号
	 * @return
	 */
	public List<Map<String,Object>> getBsdBybsxx(String xtbh);
	
	/**
	 * 标石批量编辑
	 * @param map 表单值
	 * @throws Exception
	 */
	public void batchEdit(Map<String, Object> map)throws Exception;	
}
