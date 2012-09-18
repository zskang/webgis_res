package com.cabletech.contractor.mapper.gisextend;

import java.util.List;
import java.util.Map;

/**
 * Gis扩展 Mapper
 * @author Administrator
 *
 */
public interface GisExtendMapper {
	
	/**
	 * 获取点X Y
	 * @param map 传入条件
	 * @return
	 */
	public List<Map<String, Object>> getPointsXY(Map<String, Object> map)throws Exception;
	
	/**
	 * 返回shape字段
	 * @param map 传入参数 ｛表名、关键字段名称、关键字段值｝
	 * @return
	 * @throws Exception
	 */
	public String getTableShapeReturnClob(Map<String, Object> map)throws Exception;
	
	/**
	 * 保存绘制信息
	 * @param map ｛tablename keycolumn titlecolumn remarkcolumn graphictype xy｝
	 */
	public void saveDrawInfo(Map<String, Object> map)throws Exception;
	
	/**
	 * 获取 Srid
	 * @param map 传入条件
	 * @return
	 */
	public int getSrid(Map<String, Object> map);
	
	/**
	 * 显示计划漏检点
	 * @param map 传入条件
	 * @return
	 */
	public List<Map<String, Object>> getPlanPoints(Map<String, Object> map)throws Exception;
	
	/**
	 * 根据区域编号获取在线巡检人员
	 * @param id 区域编号
	 * @return
	 */
	public List<Map<String, Object>> getOnlineMenByRegionid(String id);
	
	/**
	 * 根据组织编号获取在线巡检人员
	 * @param id 组织机构编号
	 * @return
	 */	
	public List<Map<String, Object>> getOnlineMenByOrgid(String id);
	
	/**
	 * 根据巡检组编号获取在线巡检人员
	 * @param id 巡检组编号
	 * @return
	 */	
	public List<Map<String, Object>> getOnlineMenByGroupid(String id);
	
	/**
	 * 资源信息
	 * @param map 传入条件
	 * @return
	 */
	public List<Map<String, Object>> getResouceInfo(Map<String, Object> map);
	
	/**
	 * 油机信息
	 * @param orgid 组织结构
	 * @return
	 */	
	public List<Map<String, Object>> getAllOeoilengines(String orgid);
	
	/**
	 * 通用处理过程（轨迹）
	 * @param map 传入条件 ｛单号、流程类型（表名）｝
	 * @return
	 */
	public List<Map<String, Object>> getUniversalProcessLocus(Map<String, Object> map);
	
	/**
	 * 获取油机发电记录信息
	 * @param id 任务编号
	 * @return
	 */
	public Map<String, Object> getOeoilengineRecordByTaskId(String id);
	
	/**
	 * 获取油机发电记录轨迹信息
	 * @param map 传入条件｛任务编号 开始时间 和 结束时间｝
	 * @return
	 */	
	public List<Map<String, Object>> getOeoilenginePosition(Map<String, Object> map);	
	
	/**
	 * 获取车辆巡检轨迹
	 * @param map 传入条件
	 * @return
	 */
	public List<Map<String, Object>> getHistoryPositionByCar(Map<String, Object> map);
	
	/**
	 * 获取巡检人巡检轨迹
	 * @param map 传入条件
	 * @return
	 */
	public List<Map<String, Object>> getHistoryPositionByMan(Map<String, Object> map);	
}
