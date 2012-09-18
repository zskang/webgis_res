package com.cabletech.res.mapper.groupcustomsmgr;

import java.util.List;
import java.util.Map;

import com.cabletech.res.entity.groupcustomsmgr.YytEntity;

/**
 * 营业厅管理
 * 
 * @author zhanglei 2012-05-11
 */
public interface YytMapper {
	
	/**
	 * 保存
	 * @param entity 营业厅实体
	 */
	public void save(YytEntity entity);
	
	/**
	 * 编辑
	 * @param entity 营业厅实体
	 */
	public void update(YytEntity entity);
 	
	/**
	 * 查看
	 * @param xtbh 系统编号
	 * @return 营业厅实体
	 */
	public YytEntity getbyid(String xtbh);
	
	/**
	 * 营业厅资源
	 * @param map 传入条件｛｝
	 * @return
	 */
	public List<Map<String, Object>> queryGroupCustomsList(Map<String, Object> map);	
	
	/**
	 * 查询营业厅资源
	 * @param map 传入条件｛｝
	 * @return
	 */ 
	public List<Map<String, Object>> queryGroupCustomsListWithSimid(Map<String, Object> map);
	
	/**
	 * 逻辑删除
	 * @param xtbh 系统编号
	 */
	public void delete(String xtbh);
	 
}
