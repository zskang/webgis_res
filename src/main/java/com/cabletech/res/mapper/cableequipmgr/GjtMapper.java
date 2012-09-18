package com.cabletech.res.mapper.cableequipmgr;

import java.util.List;
import java.util.Map;
import com.cabletech.res.entity.cableequipmgr.GjtEntity;

/**
 * 光接头管理
 * 
 * @author wangt 2012-05-11
 */
public interface GjtMapper {

	/**
	 * 保存
	 * @param entity 光接头实体
	 */
	public void save(GjtEntity entity);
	
	/**
	 * 编辑
	 * @param entity 光接头实体
	 */
	public void update(GjtEntity entity);
	
	/**
	 * 查看
	 * @param xtbh 系统编号
	 * @return 光接头实体
	 */
	public GjtEntity getbyid(String xtbh);
	
	/**
	 * 查询光接头资源
	 * @param map 传入条件
	 * @return
	 */
	public List<Map<String, Object>> queryGjtList(Map<String, Object> map);	
	
	/**
	 * 查询光接头资源
	 * @param map 传入条件
	 * @return
	 */
	public List<Map<String, Object>> queryGjtListWithSimid(Map<String, Object> map);
	
	/**
	 * 逻辑删除光接头熔纤
	 * @param xtbh 系统编号
	 */
	public void deleteGjtConnByGjtXtbh(String xtbh);
	
	/**
	 * 逻辑删除
	 * @param xtbh 系统编号
	 */
	public void delete(String xtbh);	
	
	/**
	 * 光接头批量编辑
	 * @param map 表单值
	 * @throws Exception
	 */
	public void batchEdit(Map<String, Object> map)throws Exception;		
	
	/**
	 * 获取光接头关联的光缆段路由
	 * @param entity 光接头实体
	 * @returnget
	 */
	public List<Map<String, Object>> getGldlyByGjt(GjtEntity entity);
	
	/**
	 * 获取光接头关联的光缆段路由
	 * @param map 包含表名和xtbh
	 * @return
	 */
	public List<Map<String, Object>> getSsssblxByGjt(Map<String, Object> map);
	
	
	/**
	 * 获取资源树(连接管理模块需要，吕仁钊添加)
	 * @param xtbh 系统编号
	 * @return
	 */
	public List<Map<String,Object>> getResTree(String xtbh);
	 
}
