package com.cabletech.res.service.boardfibermgr;

import java.util.List;
import java.util.Map;

import com.cabletech.core.service.BaseService;
import com.cabletech.res.entity.boardfibermgr.JxgxllEntity;
import com.cabletech.res.entity.boardfibermgr.JxgxllzEntity;

/**
 * 局向光纤链路Service
 * @author Administrator
 *
 */
public interface JxgxllService extends BaseService{
	/**
	 * 获取链路实体
	 * @param id 链路组编号
	 * @return 实体
	 */
	public JxgxllEntity getbyid(String id);
	
	/**
	 * 单条删除
	 * @param id 系统编号
	 * @return Boolean 删除成功或者失败
	 */
	public boolean delete(String id);
	
	/**
	 * 批量删除
	 * @param id 系统编号集合
	 * @return Boolean 删除成功或者失败
	 */	
	public boolean batchDelete(String id);
	
	/**
	 * 删除
	 * @param id 链路组系统编号
	 * @return Boolean 删除成功或者失败
	 */		
	public boolean deleteByllzid(String id);
	
	/**
	 * 查询局向光纤链路
	 * @param llzid 链路组编号
	 * @return 链路结果集
	 */
	public List<Map<String, Object>> getJxgxllByllzId(String llzid);
	
	/**
	 * 获取设备起端树
	 * @param llzentity 链路组实体
	 * @return
	 */
	public String getTreeNodes(JxgxllzEntity llzentity);	
	
	/**
	 * 新增局向光纤
	 * @param odmid ODM系统编号 
	 * @param portname 端子名称
	 * @param entity 链路组实体
	 * @return 成功或失败
	 */
	public boolean addJxgxll(String odmid, String portname, JxgxllzEntity entity)throws Exception;
	
	/**
	 * 批量新增局向光纤
	 * @param odmid ODM系统编号 
	 * @param dzbh 端子编号集合
	 * @param entity 链路组实体
	 * @return
	 */
	public boolean batchAddJxgxll(String odmid, String[] dzbh, JxgxllzEntity entity);
	
	/**
	 * 获取ODM
	 * @param qssbid 起始设备系统编号
	 * @param qssblx 起始设备类型
	 * @return 
	 */
	public List<Map<String, Object>> getodmlistbysbid(String qssbid, String qssblx);
	
	/**
	 * 获取端子
	 * @param sssb 所属设备
	 * @param odmid ODM系统编号
	 * @param type 设备类型
	 * @return
	 */
	public List<Map<String, Object>> getdzlistbyodmid(String sssb, String odmid, String type);	
	
	/**
	 * 请求局向光纤经过的路由段objectid
	 * @param ssgldly 所属光缆段路由信息
	 * @return
	 */
	public String getObjectids(String ssgldly);
	
	
}
