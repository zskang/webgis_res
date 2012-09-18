package com.cabletech.res.mapper.basemgr;

import java.util.List;
import java.util.Map;
import com.cabletech.res.entity.basemgr.GqdEntity;

/**
 * 挂墙段信息
 * @author zhanglei 2011-05-11
 *
 */
public interface GqdMapper {

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
	public void update(GqdEntity entity);
	
	/**
	 * 挂墙段修改
	 * @param entity 挂墙段实体
	 */
	public void save(GqdEntity entity);
	
	/**
	 * 单条查看挂墙段信息
	 * @param xtbh 系统编号
	 * @return 单条挂墙段实体
	 */
	public GqdEntity getbyid(String xtbh);
	
	/**
	 * 查询挂墙段
	 * @param map 条件
	 * @return 符合条件的List集合
	 */
	public List<Map<String, Object>> queryGqdList(Map<String, Object> map);
	
	
	/**
	 * 挂墙段逻辑删除
	 * @param xtbh 系统编号
	 */
	public void delete(String xtbh);
	
	/**
	 * (挂墙信息删除) 关联删除挂墙段（逻辑删除）
	 * @param xtbh 系统编号
	 */
	public void deleteGqdByGq(String xtbh);
	
	/**
	 * (挂墙段系统删除) 关联删除所属挂墙段系统（逻辑删除）
	 * @param xtbh 系统编号
	 */
	public void deleteSsgqxt(String xtbh);
	
	/**
	 * 获取挂墙段系统关联的挂墙段
	 * @param xtbh 系统编号
	 */
	public List<Map<String, Object>> getGqxxByGqd(String xtbh);
	
	/**
	 * 获取挂墙段系统关联的光缆段路由
	 * @param xtbh 系统编号
	 */
	public List<Map<String, Object>> getGldlyByGqd(String xtbh);
	
	/**
	 * 挂墙段批量编辑
	 * @param map 表单值
	 * @throws Exception
	 */
	public void batchEdit(Map<String, Object> map)throws Exception;		
	
}
