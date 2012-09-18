package com.cabletech.res.service.connectmgr;

import java.util.List;
import java.util.Map;

import com.cabletech.core.service.BaseService;

/**
 * 连接管理Action(成端、跳纤、熔纤)
 * 
 * @author Lv Renzhao 2012-06-27
 */
public interface ConnectService extends BaseService {
	/**
	 * 组合设备面板
	 * 
	 * @param _leftId
	 *            左边的设备ID
	 * @param _leftType
	 *            左边的设备类型
	 * @param _rightId
	 *            右边的设备ID
	 * @param _rightType
	 *            右边的设备类型
	 * @return 将结构序列化成XML字符串返回给客户端,Twaver解析XML字符串并生成拓扑
	 */
	public String constructPanel(String _leftId, String _leftType,
			String _rightId, String _rightType,String _topId,String topType);

	/**
	 * 将XML反序列化为ElementBox后，遍历所有的Links后， 再将标记为要新增的连接关系插入到对应的连接表。
	 * 
	 * @param xml
	 *            客户端(flex-Twaver)操作后并且序列化后的XML
	 */
	public void saveConnects(String xml,String lid,String ltype,String rid,String rtype,String tid,String ttype);

	/**
	 * 将左右两个设备的跳纤或成端连接信息组合成一个列表输出
	 * 
	 * @param _leftId
	 *            左边的设备ID
	 * @param _leftType
	 *            左边的设备类型
	 * @param ctype
	 *            连接类型         
	 * @return 返回组合后的列表
	 */
	public List<Map<String, Object>> getPortConnects(String _leftId,
			String _leftType,String ctype);

	/**
	 * 将左右两个设备的熔纤信息组合成一个列表输出
	 * 
	 * @param _leftId
	 *            左边的设备ID
	 * @param _leftType
	 *            左边的设备类型
	 * @return 返回组合后的列表
	 */
	public List<Map<String, Object>> getLineConnects(String _leftId,
			String _leftType);

	/**
	 * 获取资源树（呈现在界面左上角区域）
	 * 
	 * @param xtbh
	 *            系统编号
	 * @param zylx
	 *            资源类型
	 * @return
	 */
	public List<Map<String, Object>> getResTree(String xtbh, String zylx);

	/**
	 * 获取光缆列表（呈现在界面左下角区域）
	 * 
	 * @param xtbh
	 *            系统编号
	 * @param zylx
	 *            资源类型
	 * @return
	 */
	public List<Map<String, Object>> getSublines(String xtbh, String zylx);

	/**
	 * 删除跳纤、成端关系
	 * @param xtbh 系统编号
	 * @param zylx 资源类型
	 * @param ctype 连接类型
	 */
	public void deletePortConnect(String xtbh, String zylx, String ctype);

	/**
	 * 删除熔纤关系
	 * @param xtbh 系统编号
	 */
	public void deleteLineConnect(String xtbh);

	/**
	 * 根据资源ID,类型,端子名称获取端子属性
	 * @param xtbh 系统编号
	 * @param zylx 资源类型
	 * @param mc 名称
	 * @return 结果集
	 */
	public Map<String, Object> getConnect(String xtbh, String zylx, String mc);

	/**
	 * 编辑端子信息
	 * @param xtbh 系统编号
	 * @param zylx 资源类型
	 * @param zxtbh z端系统编号
	 * @param zzylx z端资源类型
	 * @param zmc z端名称
	 * @param ctype 连接类型
	 */
	public void updateConnect(String xtbh, String zylx,
			String zxtbh, String zzylx, String zmc, String ctype);

	/**
	 * 插入跳纤、成端关系
	 * @param axtbh A端系统编号
	 * @param azylx A端资源类型
	 * @param amc A端名称
	 * @param zxtbh Z端系统编号
	 * @param zzylx Z端资源类型
	 * @param zmc Z端名称
	 * @param ctype 连接类型
	 */
	public void insertPortConnect(String axtbh, String azylx, String amc,
			String zxtbh, String zzylx, String zmc, String ctype);

	/**
	 * 插入熔纤关系
	 * @param hostid 熔纤设备ID
	 * @param hostlx 熔纤设备类型
	 * @param alyid 起始路由ID
	 * @param alineid 起始路由线芯
	 * @param blyid 终止路由ID
	 * @param blineid 终止路由线芯
	 */
	public void insertLineConnect(String hostid, String hostlx, String alyid,
			String alineid, String blyid, String blineid);
}
