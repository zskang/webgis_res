package com.cabletech.res.mapper.cableequipmgr;

import java.util.List;
import java.util.Map;
import com.cabletech.res.entity.cableequipmgr.GzdhEntity;
 
/**
 * 光终端盒信息管理
 * 
 * @author wangt 2012-05-11
 */
public interface GzdhMapper {

	/**
	 * 验证两个光终端盒所属的站点是否相同
	 * @param xtbh1
	 * @param xtbh2
	 * @return
	 */
	public List<Map<String, Object>>  getZdByGzdh(String xtbh);
	/**
	 * 查询光终端盒
	 * @param map 传入条件｛产权性质、业务级别、所属区域、光终端盒名称、采集时间｝
	 * @return
	 */
	public List<Map<String, Object>> queryGzdhList(Map<String, Object> map);
	
	/**
	 * 查询光终端盒资源
	 * @param map 传入条件｛SIM 产权性质、业务级别、所属区域、光终端盒、采集时间｝
	 * @return
	 */
	public List<Map<String, Object>> queryGzdhListWithSimid(Map<String, Object> map);	
	
	/**
	 * 保存
	 * @param entity 光终端盒实体
	 */
	public void save(GzdhEntity entity);
	
	/**
	 * 修改
	 * @param entity 光终端盒实体
	 */
	public void update(GzdhEntity entity);
	
	/**
	 * 查看
	 * @param xtbh 系统编号
	 * @return 光终端盒实体
	 */
	public GzdhEntity getbyid(String xtbh);
	
	/**
	 * 逻辑删除成端
	 * @param xtbh 系统编号
	 */
	public void deleteGzdhConnByGzdhXtbh(String xtbh);
	
	/**
	 * 逻辑删除端子
	 * @param xtbh 系统编号
	 */
	public void deleteGzdhDzByGzdhXtbh(String xtbh);
	
	/**
	 * 逻辑删除
	 * @param xtbh 系统编号
	 */
	public void delete(String xtbh);	
	
	/**
	 * 光终端盒批量编辑
	 * @param map 表单值
	 * @throws Exception
	 */
	public void batchEdit(Map<String, Object> map)throws Exception;		
	
	/**
	 * 获取光终端盒关联的 光缆段路由
	 * @param xtbh 系统编号
	 * @return
	 */
	public List<Map<String, Object>> getGldlyByGzdh(String xtbh);
	
	/**
	 * 获取光终端盒关联的 光缆段路由
	 * @param xtbh 系统编号
	 * @return
	 */
	public List<Map<String, Object>> getJfByGzdh(String xtbh);
	
	/**
	 * 获取资源树(连接管理模块需要，吕仁钊添加)
	 * @param xtbh 系统编号
	 * @return
	 */
	public List<Map<String,Object>> getResTree(String xtbh);
	
}
