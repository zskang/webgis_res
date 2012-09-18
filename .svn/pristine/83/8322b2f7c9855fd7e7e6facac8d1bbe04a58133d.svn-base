package com.cabletech.res.service.cableequipmgr;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cabletech.baseinfo.business.rest.EsriRestEntity;
import com.cabletech.core.service.BaseServiceImpl;
import com.cabletech.res.entity.cableequipmgr.GjjxEntity;
import com.cabletech.res.mapper.cableequipmgr.GjjxMapper;

/**
 * 光交接箱管理Service实现
 * 
 * @author 杨隽 2011-05-23 创建
 * 
 */
@Service
public class GjjxServiceImpl extends BaseServiceImpl implements GjjxService {
	@Resource(name = "gjjxMapper")
	private GjjxMapper gjjxmapper;

	/**
	 * 保存
	 * 
	 * @param entity
	 *            GjjxEntity 光交接箱实体
	 */
	public boolean saveOrUpdate(GjjxEntity entity) {
		try{
			entity.setCreatedate(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date().getTime()));
			EsriRestEntity esrientity = new EsriRestEntity();
			esrientity.setAttrobj(entity);
			esrientity.setRestype(super.restservice.POINT);
			esrientity.setRescode("AA003");
			esrientity.setX(entity.getProjectx());
			esrientity.setY(entity.getProjecty());
			if(StringUtils.isBlank(entity.getXtbh())){
				entity.setLon(entity.getPointX());
				entity.setLat(entity.getPointY());
				entity.setCreatedate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date()));
				entity.setXtbh(super.getXTBH());
			}
			if(restservice.restPost(esrientity)){
				return true;
			}else{
				return false;
			}			
		}catch (Exception e) {
			logger.error("新增或更新光交接箱：",e);
			return false;
		}
	}

	/**
	 * 查看
	 * 
	 * @param xtbh
	 *            String 系统编号
	 * @return GjjxEntity 光交接箱实体
	 */
	public GjjxEntity view(String xtbh) {
		return gjjxmapper.view(xtbh);
	}
 
	/**
	 * 删除
	 * 
	 * @param xtbh
	 *            String 系统编号
	 */
	@Transactional
	public void delete(String xtbh) {
		// 1、删除光交接箱下级联信息
		// 2、删除光交接箱信息
		gjjxmapper.deleteGjjxConnByGjjxXtbh(xtbh);
		gjjxmapper.delete(xtbh);
	}
	
	/**
	 * 获取Ztree的结构数据
	 * @param entity 光交接箱实体
	 */
	@Override
	public String getTreeNodes(GjjxEntity entity){
		Map<String, Object> restype = super.getResourceType();
		StringBuffer nodes = new StringBuffer();
		List<Map<String, Object>> gldlylist = gjjxmapper.getGldlyByGjjx(entity.getXtbh());
		nodes.append(super.getRootNode(entity.getXtbh(), entity.getZymc(),21));
		nodes.append(super.getNode(entity.getXtbh(), "15", restype, gldlylist));
		return nodes.toString();
	}
	
	/**
	 * 光交接箱的批量逻辑删除
	 * @param xtbhs 管井的系统编号
	 * @return true删除成功 false删除失败
	 */
	@Transactional
	public boolean batchDelete(String xtbhs){
		String[] xtbh = xtbhs.split(",");
		try{
			for(int i=0; i<xtbh.length; i++){
				gjjxmapper.deleteGjjxConnByGjjxXtbh(xtbh[i]);		
				gjjxmapper.delete(xtbh[i]);
			}
			return true;
		}catch (Exception e) {
			logger.error("删除光交接箱：",e);
			return false;
		}
	}
	
	/**
	 * 光交接箱批量编辑
	 * @param map 表单值
	 * @return
	 */
	public boolean batchEdit(Map<String, Object> map){
		try{
			gjjxmapper.batchEdit(map);
			return true;
		}catch (Exception e) {
			logger.error("编辑光交接箱：",e);
			return false;
		}
	}	
	
	/**
	 * 获取资源树(连接管理模块需要，吕仁钊添加)
	 * @param map 表单值
	 * @return
	 */
	public List<Map<String,Object>> getResTree(String xtbh){
		return gjjxmapper.getResTree(xtbh);
	}
}
