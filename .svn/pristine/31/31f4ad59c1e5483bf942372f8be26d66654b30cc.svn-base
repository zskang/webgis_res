package com.cabletech.res.mapper.groupcustomsmgr;

import java.util.List;
import java.util.Map;
import com.cabletech.res.entity.groupcustomsmgr.CampusEntity;

/**
 * 校园网管理 Mapper
 * 
 * @author zhb 2012/5/11
 */
public interface CampusMapper {
 	
	/**
	 * 校园网实体
	 * @param resId 资源编号
	 * @return entity
	 */	
	public CampusEntity getbyid(String resId);
	
	/**
	 * 更新校园网实体
	 * @param entity 校园网实体
	 */	
	public void update(CampusEntity entity)throws Exception;
	
	/**
	 * 新增校园网实体
	 * @param entity 校园网实体
	 */	
	public void insert(CampusEntity entity)throws Exception;
	
	/**
	 * 查询校园网资源
	 * @param map 传入条件｛产权性质、所属区域、名称｝
	 * @return
	 */
	public List<Map<String, Object>> queryCampusList(Map<String, Object> map);
	
	/**
	 * 逻辑删除校园网
	 * @param xtbh 资源系统编号
	 */
	public void deleteCampus(String xtbh)throws Exception;	
	
}
