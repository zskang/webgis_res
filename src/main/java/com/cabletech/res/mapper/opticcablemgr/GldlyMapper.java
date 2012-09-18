package com.cabletech.res.mapper.opticcablemgr;

import java.util.List;
import java.util.Map;

import com.cabletech.res.entity.opticcablemgr.GldlyEntity;

/**
 * 光缆段路由信息管理
 * 
 * @author zhanglei 2012-05-11
 */
public interface GldlyMapper {
	/**
	 * 根据传递过来的所有光缆信息查询光缆段信息
	 * @param map 传入条件
	 * @return
	 */
	public List<Map<String, Object>> getGldlyByIds(Map<String, Object> map);
	
	/**
	 * 根据设备id和类型查询所有A端或Z端是该设备的路由端(吕仁钊 2012/7/2添加)
	 * @param map 参数
	 * @return 结果集
	 */
	public List<Map<String, Object>> getByIdByType(Map<String, Object> map);

	/**
	 * 编辑
	 * 
	 * @param entity
	 *            光缆段路由实体
	 */
	public void update(GldlyEntity entity);

	/**
	 * 保存
	 * 
	 * @param entity
	 *            光缆段路由实体
	 */
	public void save(GldlyEntity entity);

	/**
	 * 查看
	 * 
	 * @param xtbh
	 *            系统编号
	 * @return 光缆段路由实体
	 */
	public GldlyEntity getbyid(String xtbh);
	
	/**
	 * 删除
	 * @param xtbh 系统编号
	 */
	public void deleteGldly(String xtbh);	

	/**
	 * 查询光缆段路由
	 * 
	 * @param map
	 *            条件
	 * @return 符合条件的List集合
	 */
	public List<Map<String, Object>> queryOdm(Map<String, Object> map);

	/**
	 * 逻辑删除光缆段路由
	 * 
	 * @param xtbh
	 *            系统编号
	 */
	public void deleteOdm(String xtbh);

	/**
	 * 获取光缆段路由关联的ODF
	 * 
	 * @param xtbh
	 *            系统编号
	 * @return
	 */
	public List<Map<String, Object>> getOdfByGldly(String xtbh);

	/**
	 * 获取光缆段路由关联的光交接箱
	 * 
	 * @param xtbh
	 *            系统编号
	 * @return
	 */
	public List<Map<String, Object>> getGjjxByGldly(String xtbh);

	/**
	 * 获取光缆段路由关联的光分纤箱
	 * 
	 * @param xtbh
	 *            系统编号
	 * @return
	 */
	public List<Map<String, Object>> getGfxxByGldly(String xtbh);

	/**
	 * 获取光缆段路由关联的纤芯
	 * 
	 * @param xtbh
	 *            系统编号
	 * @return
	 */
	public List<Map<String, Object>> getQXByGldly(String xtbh);

	/**
	 * 获取光缆段路由关联的光缆盘留
	 * 
	 * @param xtbh
	 *            系统编号
	 * @return
	 */
	public List<Map<String, Object>> getGlplByGldly(String xtbh);

	/**
	 * 获取光缆段路由关联的光接头
	 * 
	 * @param xtbh
	 *            系统编号
	 * @return
	 */
	public List<Map<String, Object>> getGjtByGldly(String xtbh);

	/**
	 * 获取光缆段路由关联的光终端盒
	 * 
	 * @param xtbh
	 *            系统编号
	 * @return
	 */
	public List<Map<String, Object>> getGzdhByGldly(String xtbh);
	
	/**
	 * 获取盘留对应的光缆段
	 * @param xtbh 盘留系统编号
	 * @return
	 */
	public List<Map<String, Object>> getGldlyByglplbh(String xtbh);

	/**
	 * 删除成端信息
	 * @param params 参数集
	 */
	public void deleteCDXX(Map<String,Object> params);
	
	/**
	 * 删除熔纤信息
	 * @param params 参数集
	 */
	public void deleteRQXX(Map<String,Object> params);
}
