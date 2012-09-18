package com.cabletech.res.mapper.basemgr;

import java.util.List;
import java.util.Map;
import com.cabletech.res.entity.basemgr.GldxtEntity;


/**
 * 承载--杆路系统管理 Mapper
 * 
 * @author zhb 2012/5/11
 */
public interface GldxtMapper {
	/**
	 * 获取杆路系统实体
	 * @param resId 资源编号
	 * @return
	 */	
	public GldxtEntity getbyid(String resId);
	
	/**
	 * 更新杆路系统实体
	 * @param entity 杆路系统实体
	 */	
	public void update(GldxtEntity entity)throws Exception;
	
	/**
	 * 获取杆路系统实体
	 * @param entity 杆路系统实体
	 */	
	public void insert(GldxtEntity entity)throws Exception;	
	
	/**
	 * 计算电杆数
	 * @param xtbh 杆路系统编号
	 * @return
	 */
	public String calcDgs(String xtbh);
	
	/**
	 * 更新电杆数
	 * @param map 传入条件｛杆路系统编号、电杆数｝
	 */	
	public void updateDgs(Map<String, Object> map)throws Exception;
	
	/**
	 * 查询电杆系统资源
	 * @param map 传入条件｛设施状态、产权性质、所属区域、名称｝
	 * @return
	 */
	public List<Map<String, Object>> queryGldxtList(Map<String, Object> map);
	
	/**
	 * 逻辑删除杆路段系统
	 * @param xtbh 资源系统编号
	 */
	public void deleteGldxt(String xtbh)throws Exception;
	
	/**
	 * 获取杆路段系统关联的光缆段
	 * @param xtbh 系统编号
	 */
	public List<Map<String, Object>> getGldByGldxt(String xtbh);
	/**
	 * 获取杆路段系统关联的光缆段路由
	 * @param xtbh 系统编号
	 */
	public List<Map<String, Object>> getGldlyByGldxt(String xtbh);
	
	/**
	 * 杆路系统批量编辑
	 * @param map 表单值
	 * @throws Exception
	 */
	public void batchEdit(Map<String, Object> map)throws Exception;		
}
