package com.cabletech.contractor.mapper.sublineinfo;

import java.util.List;
import java.util.Map;

import com.cabletech.res.entity.basemgr.BaseEntity;

/**
 * 路由段信息Mapper
 * @author Administrator
 *
 */
public interface SublineInfoMapper {
	
	/**
	 * 获取资源信息
	 * @param map ｛tablename objectid｝
	 * @return
	 */	
	public BaseEntity getResourceEntity(Map<String, Object> map);
	
	/**
	 * 获取路由段信息
	 * @param sublineid 路由段编号
	 * @return
	 */
	public List<Map<String, Object>> getbyid(String sublineid);
	
	/**
	 * 获取路由线段
	 * @param param 当前登录人的区域编号获取组织机构
	 * @return
	 */
	public List<Map<String, Object>> getSulineList(Map<String, Object> param);
	
	/**
	 * 删除点线关系
	 * @param sublineid 路由编号
	 * @throws Exception
	 */
	public void deleteSuline2Point(String sublineid) throws Exception;
	
	/**
	 * 新增点线关系
	 * @param subline2point 传入条件
	 * @throws Exception
	 */
	public void insertSubline2Point(Map<String, Object> subline2point) throws Exception;
	
	/**
	 * 更新点线关系
	 * @param subline2point 传入条件
	 * @throws Exception
	 */
	public void updateSubline2Point(Map<String, Object> subline2point) throws Exception;	
	
	/**
	 *  获取点线关系
	 * @param sublineid 路由段编号
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getSubline2Points(String sublineid)throws Exception;
	
	/**
	 * 获取表空间注册编号
	 * @param map 包含具体业务表名 和 数据库用户名
	 * @return
	 * @throws Exception
	 */
	public String getRegId(Map<String, Object> map)throws Exception;
	
	/**
	 * 获取业务表空间生成字段所需的参数srid
	 * @param map 包含具体业务表名 和 数据库用户名
	 * @return
	 * @throws Exception
	 */
	public String getSRID(Map<String, Object> map)throws Exception;		
	
}
