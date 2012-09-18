package com.cabletech.res.mapper.basemgr;

import java.util.List;
import java.util.Map;

import com.cabletech.res.entity.basemgr.GqdxtEntity;

/**
 * 挂墙段系统信息
 * @author zhanglei 2011-05-11
 *
 */
public interface GqdxtMapper {

	/**
	 * 查询挂墙数量
	 * @param map 传入条件
	 * @return
	 */
	public String getGqxxCountByGqdxt(Map<String, Object> map);
	
	/**
	 * 挂墙段系统修改
	 * @param entity 挂墙段系统实体
	 */
	public void update(GqdxtEntity entity);
	
	/**
	 * 单条查看挂墙段系统信息
	 * @param xtbh 系统编号
	 * @return 单条挂墙段系统实体
	 */
	public GqdxtEntity getbyid(String xtbh);
	
	/**
	 * 查询挂墙段系统信息
	 * @param map 条件
	 * @return 符合条件的List集合
	 */
	public List<Map<String, Object>> queryGqdxtList(Map<String, Object> map);

	/**
	 * 挂墙段系统逻辑删除
	 * @param xtbh 系统编号
	 */
	public void deleteGqxt(String xtbh);
	
	/**
	 * 单条保存挂墙段系统
	 * @param entity 挂墙段系统实体
	 */
	public void save(GqdxtEntity entity);
	
	/**
	 * 获取挂墙段系统关联的挂墙段
	 * @param xtbh 系统编号
	 */
	public List<Map<String, Object>> getGqdByGldxt(String xtbh);
	
	/**
	 * 获取挂墙段系统关联的光缆段路由
	 * @param xtbh 系统编号
	 */
	public List<Map<String, Object>> getGldlyByGldxt(String xtbh);
	
	/**
	 * 挂墙段系统批量编辑
	 * @param map 表单值
	 * @throws Exception
	 */
	public void batchEdit(Map<String, Object> map)throws Exception;		
	
}
