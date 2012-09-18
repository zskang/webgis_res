package com.cabletech.res.mapper.boardfibermgr;

import java.util.List;
import com.cabletech.res.entity.boardfibermgr.JxgxllEntity;
import com.cabletech.res.entity.boardfibermgr.JxgxlyEntity;

/**
 * 局向光纤路由Mapper接口
 * @author Administrator
 *
 */
public interface JxgxlyMapper {
	/**
	 * 获取路由实体
	 * @param id 链路组编号
	 * @return 实体
	 */
	public JxgxllEntity getbyid(String id);
	
	/**
	 * 查询路由
	 * @param llzid 链路组编号
	 * @return 符合条件的集合
	 */
	public List<JxgxlyEntity> getJxgxlyListByllzid(String llzid);
	
	/**
	 * 查询路由设备
	 * @param llzid 链路组编号
	 * @return 符合条件的集合
	 */	
	public List<JxgxlyEntity> getJxgxlySblistByllzid(String llzid);
	
	/**
	 * 单条删除
	 * @param id 系统编号
	 */
	public void delete(String id) throws Exception;
	
	/**
	 * 删除
	 * @param id 链路组系统编号
	 */		
	public void deleteByJxgxllzId(String id) throws Exception;
	
	/**
	 * 新增
	 * @param entity 路由实体
	 */		
	public void insert(JxgxlyEntity entity) throws Exception;
}
