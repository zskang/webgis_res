package com.cabletech.contractor.service.gisextend;

import java.util.List;
import java.util.Map;
import com.cabletech.core.service.BaseService;

/**
 * Gis扩展Service
 * @author Administrator
 *
 */
public interface GisExtendService extends BaseService {
	/**
	 * 获取点X Y
	 * @param planid 计划编号
	 * @param taskid 任务编号
	 * @return
	 */
	public String getPointsXY(String planid, String taskid);
	
	/**
	 * 返回shape字段
	 * @param tablename 业务表名
	 * @param keycolumn 主键字段名
	 * @param keyvalue 主键值
	 * @return
	 */	
	public String getTableShapeReturnClob(String tablename, String keycolumn, String keyvalue);	
	
	/**
	 * 保存绘制信息
	 * @param map ｛tablename keycolumn titlecolumn remarkcolumn graphictype points｝
	 */	
	public boolean saveDrawInfo(Map<String, Object> map);
	
	/**
	 * 显示计划漏检点
	 * @param tablename 业务表名
	 * @param pid 编号
	 */
	public List<Map<String, Object>> getPlanPoints(String tablename, String pid);	
	
	/**
	 * 根据查询类型获取在线巡检人员
	 * @param id 编号
	 * @param type 传入类型
	 * @return
	 */
	public List<Map<String, Object>> getOnlineMen(String id, String type);
	
	/**
	 * 将集合坐标转成坐标串
	 * @param list 坐标集合
	 * @return
	 */
	public String getXY(List<Map<String, Object>> list);
	
	/**
	 * 默认显示正常油机
	 * @param id 资源编号
	 * @param type 资源类型
	 * @param userid 当前登录用户
	 * @return　{返回List 包含资源点！及所有正常油机}
	 */
	public Map<String, Object> loadAllOeoilengines(String id, String type, String userid);
	
	/**
	 * 通用处理过程（轨迹）
	 * @param id 单号
	 * @param type 流程类型（表名）
	 * @return
	 */
	public List<Map<String, Object>> getUniversalProcessLocus(String id, String type);
	
	/**
	 * 油机发电记录轨迹
	 * @param id 任务编号
	 * @return
	 */
	public Map<String, Object> getOilenginePosition(String id);	
	
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
