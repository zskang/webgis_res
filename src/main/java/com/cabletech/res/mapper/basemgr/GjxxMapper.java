package com.cabletech.res.mapper.basemgr;

import java.util.List;
import java.util.Map;

import com.cabletech.res.entity.basemgr.GjxxEntity;

/**
 * 管井信息管理
 * 
 * @author zhanglei 2012-05-11
 */
public interface GjxxMapper {
 
	/**
	 * 保存
	 * @param entity 管井实体
	 */
	public void save(GjxxEntity entity);
	
	/**
	 * 编辑
	 * @param entity 管井实体
	 */
	public void update(GjxxEntity entity);
 
	/**
	 * 查看
	 * @param xtbh 系统编号
	 * @return 管井实体
	 */
	public GjxxEntity getbyid(String xtbh);
	
	/**
	 * 查询管井资源
	 * @param map 传入条件｛道路名称、设施状态、产权性质、所属区域、所属管理区、名称｝
	 * @return
	 */
	public List<Map<String, Object>> queryGjxxList(Map<String, Object> map);	
	
	/**
	 * 查询管井资源
	 * @param map 传入条件｛sim卡号、道路名称、设施状态、产权性质、所属区域、所属管理区、名称｝
	 * @return
	 */
	public List<Map<String, Object>> queryGjxxListWithSimid(Map<String, Object> map);
	
	/**
	 * 管井逻辑删除
	 * @param xtbh 系统编号
	 */
	public void deleteGj(String xtbh);
	
	/**
	 * 根据管井编号获取相关光缆段
	 * @param xtbh 系统编号
	 * @return
	 */
	public List<Map<String, Object>> getGldlyByGjbh(String xtbh);
	
	/**
	 * 根据管井编号获取相关管道段
	 * @param xtbh 系统编号
	 * @return
	 */	
	public List<Map<String, Object>> getGddByGjbh(String xtbh);
	
	/**
	 * 根据管井编号获取相关光接头
	 * @param xtbh 系统编号
	 * @return
	 */	
	public List<Map<String, Object>> getGjtByGjbh(String xtbh);
	
	/**
	 * 根据管井编号获取相关管井剖面
	 * @param xtbh 系统编号
	 * @return
	 */	
	public List<Map<String, Object>> getGjpmByGjbh(String xtbh);
	
	/**
	 * 根据管井编号获取相关联的光缆盘留
	 * @param xtbh 系统编号
	 * @return
	 */	
	public List<Map<String, Object>> getGlplByGjbh(String xtbh);	
	
	/**
	 * 管井批量编辑
	 * @param map 表单值
	 * @throws Exception
	 */
	public void batchEdit(Map<String, Object> map)throws Exception;
	
	/**
	 * 获取光缆盘留关联的管井
	 * @param xtbh 盘留系统编号
	 */
	public List<Map<String, Object>> getGjxxByglplbh(String xtbh);	
}
