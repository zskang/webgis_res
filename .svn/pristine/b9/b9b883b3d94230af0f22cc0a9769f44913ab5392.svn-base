package com.cabletech.res.mapper.basemgr;

import java.util.List;
import java.util.Map;


import com.cabletech.res.entity.basemgr.YsEntity;

/**
 * 引上段信息管理
 * 
 * @author zhanglei 2012-05-11
 */
public interface YsMapper {

	/**
	 * 编辑
	 * 
	 * @param entity 引上段实体
	 */
	public void update(YsEntity entity);

	/**
	 * 查看
	 * 
	 * @param xtbh 系统编号
	 * @return 引上段实体
	 */
	public YsEntity getbyid(String xtbh);

	/**
	 * 保存
	 * 
	 * @param entity  引上段实体
	 */
	public void save(YsEntity entity);

	/**
	 * 查询引上段
	 * 
	 * @param map 查询条件集合
	 * @return 符合条件的List集合
	 */
	public List<Map<String, Object>> queryYsList(Map<String, Object> map);

	/**
	 * 逻辑删除
	 * 
	 * @param xtbh 系统编号
	 */
	public void delete(String xtbh);
	
	/**
	 * 删除电杆--引上逻辑删除
	 * 
	 * @param xtbh 系统编号
	 */
	public void deleteYsByDg(String xtbh);

	/**
	 * 删除管井--引上逻辑删除
	 * 
	 * @param xtbh 系统编号
	 */
	public void deleteYsByGj(String xtbh);
	
	
	/**
	 * 删除标石--引上逻辑删除
	 * 
	 * @param xtbh 系统编号
	 */
	public void deleteYsByBs(String xtbh);	
	
	/**
	 * 删除挂墙--引上逻辑删除
	 * 
	 * @param xtbh 系统编号
	 */
	public void deleteYsByGq(String xtbh);	
	

	/**
	 * 引上所属引上系统制空
	 * 
	 * @param xtbh 系统编号
	 */
	public void deleteSsysxt(String xtbh);
	
	/**
	 * 根据引上编号找出相关光缆段资源
	 * @param xtbh 系统编号
	 * @return
	 */
	public List<Map<String, Object>> getGldlyByYsbh(String xtbh);
	
	/**
	 * 获取连接起端和终端资源
	 * @param map 传入参数｛起端类型 表名、终端类型 表名 资源系统编号｝
	 * @return
	 */	
	public List<Map<String, Object>> getQdZdByYsbh(Map<String, Object> map);
	
	/**
	 * 引上批量编辑
	 * @param map 表单值
	 * @throws Exception
	 */
	public void batchEdit(Map<String, Object> map)throws Exception;	
}
