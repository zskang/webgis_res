package com.cabletech.res.service.opticcablemgr;

import java.util.List;
import java.util.Map;

import com.cabletech.core.service.BaseService;
import com.cabletech.res.entity.opticcablemgr.GldlyEntity;

/**
 * 光缆段路由管理
 * 
 * @author zhanglei 2011-05-11
 * 
 */
public interface GldlyService extends BaseService {

	/**
	 * 验证两个gfxx所属的站点是否相同
	 * @param xtbh1
	 * @param xtbh2
	 * @return
	 */
	public boolean checkGFxxSSZD(String xtbh1,String xtbh2);
	/**
	 * 验证两个odf所属的站点是否相同
	 * @param xtbh1
	 * @param xtbh2
	 * @return
	 */
	public boolean checkOdfSSZD(String xtbh1,String xtbh2);
	/**
	 * 验证两个gzdh所属的站点是否相同
	 * @param xtbh1
	 * @param xtbh2
	 * @return
	 */
	public boolean checkGzdhSSZD(String xtbh1,String xtbh2);
	
	
	/**
	 * 根据设备id和类型查询所有A端或Z端是该设备的路由端(吕仁钊 2012/7/2添加)
	 * 
	 * @param xtbh
	 *            系统编号
	 * @param zylx
	 *            资源类型
	 * @return 结果集
	 */
	public List<Map<String, Object>> getByIdByType(String xtbh, String zylx);

	/**
	 * 光缆段路由修改
	 * 
	 * @param entity
	 *            光缆段路由实体
	 */
	public boolean saveorupdate(GldlyEntity entity);

	/**
	 * 单条查看光缆段路由信息
	 * 
	 * @param xtbh
	 *            系统编号
	 * @return 单条光缆段路由实体
	 */
	public GldlyEntity getbyid(String xtbh);

	/**
	 * 单条删除
	 * 
	 * @param xtbh
	 *            系统编号
	 * @return true 删除成功 false 删除失败
	 */
	public boolean delete(String xtbh);
	
	/**
	 * 批量删除
	 * 
	 * @param xtbh
	 *            系统编号
	 * @return true 删除成功 false 删除失败
	 */
	public boolean batchDelete(String xtbh);	

	/**
	 * 获取资源相关结点串
	 * 
	 * @param entity
	 *            光缆段路由实体
	 * @return
	 */
	public String getTreeNodes(GldlyEntity entity);
}
