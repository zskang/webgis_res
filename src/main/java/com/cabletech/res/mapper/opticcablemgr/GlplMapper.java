package com.cabletech.res.mapper.opticcablemgr;


import java.util.List;
import java.util.Map;
import com.cabletech.res.entity.opticcablemgr.GlplEntity;

/**
 * 光缆盘留管理
 * 
 * @author zhanglei 2012-05-11
 */
public interface GlplMapper {
 
	/**
	 * 保存
	 * @param entity 光缆盘留实体
	 */
	public void save(GlplEntity entity);
	
	/**
	 * 编辑
	 * @param entity 光缆盘留实体
	 */
	public void update(GlplEntity entity);
 
	/**
	 * 查看
	 * @param xtbh 系统编号
	 * @return 光缆盘留实体
	 */
	public GlplEntity getbyid(String xtbh);
	
	/**
	 * 查询光缆盘留资源
	 * @param map 传入条件｛名称、所属区域｝
	 * @return
	 */
	public List<Map<String, Object>> queryglplList(Map<String, Object> map);	
	
	/**
	 * 光缆盘留逻辑删除
	 * @param xtbh 系统编号
	 */
	public void delete(String xtbh)throws Exception;
	
	/**
	 * 根据光缆盘留编号获取相关光缆段
	 * @param xtbh 系统编号
	 * @return
	 */
	public List<Map<String, Object>> getGldlyByGjbh(String xtbh);
	
	/**
	 * 根据光缆盘留编号获取相关管道段
	 * @param xtbh 系统编号
	 * @return
	 */	
	public List<Map<String, Object>> getGddByGjbh(String xtbh);
	
	/**
	 * 根据光缆盘留编号获取相关光接头
	 * @param xtbh 系统编号
	 * @return
	 */	
	public List<Map<String, Object>> getGjtByGjbh(String xtbh);
	
	
	/**
	 * 光缆盘留批量编辑
	 * @param map 表单值
	 * @throws Exception
	 */
	public void batchEdit(Map<String, Object> map)throws Exception;	
}
