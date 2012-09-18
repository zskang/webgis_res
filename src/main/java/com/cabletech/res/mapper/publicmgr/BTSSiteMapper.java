package com.cabletech.res.mapper.publicmgr;

import java.util.List;
import java.util.Map;

import com.cabletech.res.entity.publicmgr.BTSSiteEntity;

/**
 * BTSSite Mapper
 * @author wangt
 *
 */
public interface BTSSiteMapper {
	/**
	 * 查询BTSSite列表
	 * @param map 
	 * @return
	 */
	List<Map<String, Object>> queryBTSSiteList(Map<String, Object> map);

	/**
	 * 查看
	 * @param btssiteid 
	 * @return
	 */
	BTSSiteEntity getbyid(String btssiteid);

	/**
	 * 修改
	 * @param entity 
	 */
	void update(BTSSiteEntity entity);

	/**
	 * 删除
	 * @param btssiteid 
	 */
	void delete(String btssiteid);
	
	/**
	 * 添加
	 * @param entity 
	 */
	void save(BTSSiteEntity entity);

}
