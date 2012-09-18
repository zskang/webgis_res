package com.cabletech.res.mapper.publicmgr;

import java.util.List;
import java.util.Map;

import com.cabletech.res.entity.publicmgr.WlanEntity;

/** 
 */
public interface WlanMapper {
	/**
	 * 保存站点信息
	 * 
	 * @param entity
	 *            WlanEntity 站点实体
	 */
	public void saveWlan(WlanEntity entity);

	/**
	 * 编辑站点信息
	 * 
	 * @param entity
	 *            WlanEntity 站点实体
	 */
	public void updateWlan(WlanEntity entity);

	/**
	 * 查看站点信息
	 * 
	 * @param xtbh
	 *            String 系统编号
	 * @return WlanEntity 站点实体id
	 */
	public WlanEntity getbyid4wlan(String id);

	/**
	 * 查询站点资源
	 * 
	 * @param map
	 *            Map<String, Object> 传入条件｛sim卡号、站点类型、产权性质、所属区域、名称｝
	 * @return List<Map<String, Object>> 站点资源列表
	 */
	public List<Map<String, Object>> queryWlanList(Map<String, Object> map);

	/**
	 * 逻辑删除站点信息
	 * 
	 * @param xtbh
	 *            String 系统编号
	 */
	public void deleleWlan(String id);

	/**
	 * 根据站点编号获取相关机房
	 * 
	 * @param xtbh
	 *            系统编号
	 * @return
	 */
	public List<Map<String, Object>> getWlanList(String xtbh);

	public List<Map<String, String>> getzdList4Wlan();
}
