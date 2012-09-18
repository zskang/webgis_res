package com.cabletech.res.mapper.basemgr;

import java.util.List;
import java.util.Map;

import com.cabletech.res.entity.basemgr.BsdxtEntity;


/**
 * 直埋段系统信息管理
 * 
 * @author zhanglei 2012-05-11
 */
public interface BsdxtMapper {

	/**
	 * 查询标石数量
	 * @param map
	 * @return
	 */
	public String getBsxxCountByBsdxt(Map<String, Object> map);
	
	/**
	 * 查询直埋段系统
	 * @param map 查询条件
	 */
	public List<Map<String, Object>> queryBsdxtList(Map<String, Object> map);	
	
	/**
	 * 保存
	 * @param entity 直埋段系统实体
	 */
	public void update(BsdxtEntity entity);
	
	/**
	 * 查看
	 * @param xtbh 系统编号
	 * @return 直埋段系统实体
	 */
	public BsdxtEntity getbyid(String xtbh);
	/**
	 * 逻辑删除
	 * @param xtbh 系统编号
	 */
	public void delete(String xtbh);
 	
	/**
	 * 保存
	 * @param entity 直埋段系统实体
	 */
	public void save(BsdxtEntity entity);
	
	/**
	 * 获取标石段系统关联的标石段
	 * @param xtbh 系统编号
	 */
	public List<Map<String, Object>> getBsdByBsdxt(String xtbh);
	
	/**
	 * 获取标石段系统关联光缆段路由
	 * @param xtbh 系统编号
	 */
	public List<Map<String, Object>> getGldlyByBsdxt(String xtbh);
	
	/**
	 * 直埋系统批量编辑
	 * @param map 表单值
	 * @throws Exception
	 */
	public void batchEdit(Map<String, Object> map)throws Exception;		
}
