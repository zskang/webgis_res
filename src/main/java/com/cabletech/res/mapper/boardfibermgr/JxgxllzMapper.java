package com.cabletech.res.mapper.boardfibermgr;

import java.util.List;
import java.util.Map;

import com.cabletech.res.entity.boardfibermgr.JxgxllzEntity;

/**
 * 链路组Mapper接口
 * @author Administrator
 *
 */
public interface JxgxllzMapper {
	/**
	 * 获取链路组实体
	 * @param id 链路组编号
	 * @return 实体
	 */
	public JxgxllzEntity getbyid(String id);
	
	/**
	 * 查询链路组
	 * @param map 查询条件｛链路组名称｝
	 * @return 符合条件的集合
	 */
	public List<Map<String, Object>> queryJxgxllzList(Map<String, Object> map);
	
	/**
	 * 单条删除
	 * @param id 系统编号
	 */
	public void delete(String id) throws Exception;
	
	/**
	 * 更新
	 * @param entity 链路组实体
	 * @throws Exception
	 */
	public void update(JxgxllzEntity entity) throws Exception;
	
	/**
	 * 新增
	 * @param entity 链路组实体
	 * @throws Exception
	 */
	public void insert(JxgxllzEntity entity) throws Exception;	
}
