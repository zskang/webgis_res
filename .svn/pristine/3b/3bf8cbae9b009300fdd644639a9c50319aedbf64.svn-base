package com.cabletech.res.mapper.basemgr;

import java.util.List;
import java.util.Map;

import com.cabletech.res.entity.basemgr.BsdEntity;

/**
 * 直埋段信息管理
 * 
 * @author zhanglei 2012-05-11
 */
public interface BsdMapper {

	/**
	 * 查询标石段是否已存在
	 * @param map 传入条件
	 * @return
	 */
	public String getBsdIsExist(Map<String, Object> map); 
	/**
	 * 查询直埋段
	 * @param map 查询条件
	 */
	public List<Map<String, Object>> queryBsdList(Map<String, Object> map);	
	
	/**
	 * 保存
	 * @param entity 直埋段实体
	 */
	public void save(BsdEntity entity);
	
	/**
	 * 修改
	 * @param entity 直埋段实体
	 */
	public void update(BsdEntity entity);
	
	/**
	 * 查看
	 * @param xtbh 系统编号
	 * @return 直埋段实体
	 */
	public BsdEntity getbyid(String xtbh);
	
	/**
	 * 逻辑删除
	 * @param xtbh 系统编号
	 */
	public void delete(String xtbh);
	
	/**
	 * (标石信息删除)关联删除直埋段
	 * @param xtbh 系统编号
	 */
	public void deleteBsdByBs(String xtbh);
	 
	/**
	 * (直埋段系统删除 )关联 删除所属直埋段系统
	 * @param xtbh 系统编号
	 */
	public void deleteSsbsxt(String xtbh);
	
	/**
	 * 获取标石段关联的标石信息
	 * @param xtbh 系统编号
	 */
	public List<Map<String, Object>> getBsxxByBsd(String xtbh);
	
	/**
	 * 获取标石段关联的光缆段路由
	 * @param xtbh 系统编号
	 */
	public List<Map<String, Object>> getGldlyByBsd(String xtbh);
	
	/**
	 * 标石段批量编辑
	 * @param map 表单值
	 * @throws Exception
	 */
	public void batchEdit(Map<String, Object> map)throws Exception;		
	
}
