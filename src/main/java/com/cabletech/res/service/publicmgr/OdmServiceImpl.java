package com.cabletech.res.service.publicmgr;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.cabletech.core.service.BaseServiceImpl;
import com.cabletech.res.entity.publicmgr.OdmEntity;
import com.cabletech.res.mapper.publicmgr.OdmMapper;


/**
 * odm信息管理
 * @author zhanglei 2011-05-11
 *
 */
@Service
public class OdmServiceImpl extends BaseServiceImpl  implements OdmService {

	@Resource(name = "odmMapper")
	private OdmMapper odmmapper;
	/**
	 * 查询Odf系统
	 * @param map 条件
	 * @return 符合条件的List集合
	 */
	public List<Map<String, Object>> getOdfByGhOdm(Map<String, Object> map)
	{
		
		return odmmapper.getOdfByGhOdm(map);
	}
	
	
	/**
	 * 查询Odm系统
	 * @param map 条件
	 * @return 符合条件的List集合
	 */
	public List<Map<String, Object>> getOdmByGh(Map<String, Object> map)
	{
		return odmmapper.getOdmByGh(map);
	}
	
	
	@Override
	@Transactional
	public boolean batchDelete(String xtbhs){
		String[] xtbh = xtbhs.split(",");
		try{
			for(int i=0; i<xtbh.length; i++){
				odmmapper.deleteOdfConnByOdmXtbh(xtbh[i]);
				odmmapper.deleteOdm(xtbh[i]);
			}
			return true;
		}catch (Exception e) {
			logger.error("删除ODF：",e);
			return false;
		}
	}
	@Override
	public boolean batchEdit(Map<String, Object> map){
		try{
			odmmapper.batchEdit(map);
			return true;
		}catch (Exception e) {
			logger.error("编辑ODF：",e);
			return false;
		}
	}	
	/**
	 * 新增或更新odm实体
	 * @param entity odm实体
	 */
	@Transactional
	public boolean saveorupdate(OdmEntity entity){
		try{
			if(StringUtils.isNotBlank(entity.getXtbh())){
				odmmapper.update(entity);
			}else{
				entity.setXtbh(super.getXTBH());
				odmmapper.save(entity);
			}
			return true;
		}catch (Exception e) {
			logger.error("新增或更新odm实体：",e);
			return false;
		}
	}
	
	/**
	 * 单条查看odm信息
	 * @param xtbh 系统编号
	 * @return 单条odm实体
	 */
	public OdmEntity getbyid(String xtbh){
		return odmmapper.getbyid(xtbh);
	}
	
	/**
	 * odm单条删除
	 * @param xtbh 系统编号
	 * @return boolean 删除成功或者失败
	 */
	public boolean delete(String xtbh){
		try {
			odmmapper.deleteOdm(xtbh);
			return true;
		} catch (Exception e) {
			logger.error("删除odm：",e);
			return false;
		}
	}
	/**
	 * 获取Ztree的结构数据
	 * @param entity odm 实体
	 */
	@Override
	public String getTreeNodes(OdmEntity entity){
		Map<String, Object> restype = super.getResourceType();
		StringBuffer nodes = new StringBuffer();
//		List<Map<String, Object>> gldlylist = glxxmapper.根节点
		nodes.append(super.getRootNode(entity.getXtbh(), entity.getZymc(),19));
//		nodes.append(super.getNode(entity.getXtbh(), "17", restype, gjpmlist));
		return nodes.toString();
	}
	
	/**
	 * 根据odf系统编号或者光交接箱获取所有的ODM  吕仁钊 2012/7/7 添加
	 * @param xtbh odf或者光交接箱 系统编号
	 * @param zylx 资源类型
	 * @return
	 */	
	public List<OdmEntity> getByParentId(String xtbh,String zylx){
		Map<String,Object> params = new HashMap<String, Object>();
		params.put("xtbh", xtbh);
		params.put("zylx", zylx);
		return odmmapper.getByParentId(params);
	}
}
