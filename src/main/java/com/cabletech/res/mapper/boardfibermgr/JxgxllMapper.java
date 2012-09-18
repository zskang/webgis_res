package com.cabletech.res.mapper.boardfibermgr;

import java.util.List;
import java.util.Map;
import com.cabletech.res.entity.boardfibermgr.JxgxllEntity;

/**
 * 局向光纤链路Mapper接口
 * @author Administrator
 *
 */
public interface JxgxllMapper {
	/**
	 * 获取链路实体
	 * @param id 链路组编号
	 * @return 实体
	 */
	public JxgxllEntity getbyid(String id);
	
	/**
	 * 单条删除
	 * @param id 系统编号
	 */
	public void delete(String id)throws Exception;
	
	/**
	 * 单条删除
	 * @param entity 局向光纤实体
	 */
	public void deleteByEntity(JxgxllEntity entity)throws Exception;	
	
	/**
	 * 删除
	 * @param id 链路组系统编号
	 */		
	public void deleteByllzid(String id)throws Exception;
	
	/**
	 * 查询局向光纤链路
	 * @param llzid 链路组编号
	 * @return 链路集合
	 */
	public List<Map<String, Object>> getJxgxllByllzId(String llzid);
	
	/**
	 * 获取设备端子集合
	 * @param map 条件
	 * @return 端子集合
	 */
	public List<Map<String, Object>> getDzByTypeAndId(Map<String, Object> map);

	/**
	 * 获取设备信息
	 * @param map 条件
	 * @return 设备信息
	 */	
	public Map<String, Object> getDeviceInfo(Map<String, Object> map);	
	
	/**
	 * 获取设备A面的ODM
	 * @param map 根据设备编号、设备表名
	 * @return ODM
	 */
	public List<Map<String, Object>> getOdmContainA(Map<String, Object> map);
	
	/**
	 * 获取设备B面的ODM
	 * @param map 根据设备编号、设备表名
	 * @return ODM
	 */	
	public List<Map<String, Object>> getOdmContainB(Map<String, Object> map);
	
	/**
	 * 获取端子
	 * @param map 根据ODM编号、设备端子表名
	 * @return 端子
	 */			
	public List<Map<String, Object>> getDzByOdmXtbh(Map<String, Object> map);
	
	/**
	 * 获取端子
	 * @param map 根据所属设备编号{光分纤箱、光终端盒}、设备端子表名
	 * @return 端子
	 */		
	public List<Map<String, Object>> getDzBySbXtbh(Map<String, Object> map);
	
	/**
	 * 端子是否已存在局向光纤关系
	 * @param map 端子编号 ODM编号 链路组编号
	 * @return 返回关系
	 */	
	public int isAlreayExist(Map<String, Object> map);
	
	/**
	 * 新增局向光纤
	 * @param entity 局向光纤实体
	 * @throws Exception
	 */
	public void insert(JxgxllEntity entity)throws Exception;
	
	/**
	 * 获取ODM
	 * @param map ｛sssb 所属设备 sssblx 所属设备类型｝
	 * @return 
	 */
	public List<Map<String, Object>> getodmlistbysbid(Map<String, Object> map);
	
	/**
	 * 获取端子
	 * @param map ｛odmid ODM系统编号 tableconnname 成端表名｝
	 * @return
	 */
	public List<Map<String, Object>> getdzlistbyodmid(Map<String, Object> map);
	
	/**
	 * 获取局向光纤经过的路由段objectid
	 * @param map 传入路由段编号
	 * @return
	 */
	public List<Map<String, Object>> getObjectids(Map<String, Object> map);
}
