package com.cabletech.res.mapper.groupcustomsmgr;

import java.util.List;
import java.util.Map;

import com.cabletech.res.entity.groupcustomsmgr.GroupCustomsEntity;

/**
 * 集团客户信息管理
 * 
 * @author wangt 2012-05-11
 */
public interface GroupCustomsMapper {
	
	/**
	 * 保存
	 * @param entity 集团客户实体
	 */
	public void save(GroupCustomsEntity entity);
	 
	/**
	 * 编辑
	 * @param entity 集团客户实体
	 */
	public void update(GroupCustomsEntity entity);
	
	/**
	 * 查看
	 * @param xtbh 系统编号
	 * @return 集团客户实体
	 */
	public GroupCustomsEntity getbyid(String xtbh);
	
	/**
	 * 查询集团客户资源
	 * @param map 传入条件｛｝
	 * @return
	 */
	public List<Map<String, Object>> queryGroupCustomsList(Map<String, Object> map);	
	
	/**
	 * 查询集团客户资源
	 * @param map 传入条件｛集团客户名称｝
	 * @return
	 */
	public List<Map<String, Object>> queryGroupCustomsListWithSimid(Map<String, Object> map);
	
	/**
	 * 逻辑删除
	 * @param xtbh 系统编号
	 */
	public void delete(String xtbh);
	
}
