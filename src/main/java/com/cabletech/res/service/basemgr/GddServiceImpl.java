package com.cabletech.res.service.basemgr;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.cabletech.baseinfo.business.rest.EsriRestEntity;
import com.cabletech.core.service.BaseServiceImpl;
import com.cabletech.res.entity.basemgr.GddEntity;
import com.cabletech.res.entity.basemgr.GjxxEntity;
import com.cabletech.res.mapper.basemgr.GddMapper;
import com.cabletech.res.mapper.basemgr.GjxxMapper;

/**
 * 承载--管道段管理 Service实现
 * 
 * @author 吕仁钊  2012/5/11
 */
@Service
public class GddServiceImpl extends BaseServiceImpl implements GddService {

	@Resource(name = "gddMapper")
	private GddMapper gddmapper;
	
	@Resource(name = "gjxxMapper")
	private GjxxMapper gjxxmapper;

	/**
	 * 查询管道段是否已存在
	 * @param map 传入条件
	 * @return
	 */
	public String getGddIsExist(Map<String, Object> map)
	{
		return gddmapper.getGddIsExist(map);
	}
	/**
	 * 根据id获取管道段信息
	 * @param resId 资源ID
	 */
	public GddEntity getbyid(String resId) {
		return gddmapper.getbyid(resId);
	}

	/**
	 * 管道段跟新
	 * @param entity 管道段资源实体
	 */
	@Transactional
	public boolean saveorupdate(GddEntity entity){
		try{
			List<Map<String, String>> points = new ArrayList<Map<String, String>>();
			EsriRestEntity esrientity = new EsriRestEntity();
			esrientity.setAttrobj(entity);
			esrientity.setRestype(super.restservice.LINE);
			esrientity.setRescode("AD601");			
			GjxxEntity start = gjxxmapper.getbyid(entity.getQdgj());
			Map<String, String> map = new HashMap<String, String>();
			map.put("x", start.getProjectx());
			map.put("y", start.getProjecty());
			points.add(map);
			GjxxEntity end = gjxxmapper.getbyid(entity.getZdgj());
			Map<String, String> map2 = new HashMap<String, String>();
			map2.put("x", end.getProjectx());
			map2.put("y", end.getProjecty());
			points.add(map2);
			esrientity.setList(points);
			if(StringUtils.isBlank(entity.getXtbh())){
				entity.setXtbh(super.getXTBH());
			}		
			if(super.restservice.restPost(esrientity)){
				return true;
			}else{
				return false;
			}			
		}catch (Exception e) {
			logger.error("新增或更新管道段：",e);
			return false;
		}
	}
	
	/**
	 * 管道段单条删除
	 * @param xtbh 系统编号
	 * @return Boolean 删除成功或者失败
	 */
	public boolean delete(String xtbh){
		try {
			gddmapper.deleteGdd(xtbh);
			return true;
		} catch (Exception e) {
			logger.error("删除管道段：",e);
			return false;
		}
	}
	
	
	/**
	 * 获取Ztree的结构数据
	 * @param entity 管道段实体
	 */
	@Override
	public String getTreeNodes(GddEntity entity){
		Map<String, Object> restype = super.getResourceType();
		StringBuffer nodes = new StringBuffer();
		List<Map<String, Object>> gjxxlist = gddmapper.getGddByGjxx(entity.getXtbh());
		List<Map<String, Object>> gldlylist = gddmapper.getGldlyByGdd(entity.getXtbh());
		nodes.append(super.getRootNode(entity.getXtbh(), entity.getZymc(),7));
		nodes.append(super.getNode(entity.getXtbh(), "6", restype, gjxxlist));
		nodes.append(super.getNode(entity.getXtbh(), "15", restype, gldlylist));
		return nodes.toString();
	}
	
	/**
	 * 管道段的批量逻辑删除
	 * @param xtbhs 管道段的系统编号
	 * @return true删除成功 false删除失败
	 */
	@Transactional
	public boolean batchDelete(String xtbhs){
		String[] xtbh = xtbhs.split(",");
		try{
			for(int i=0; i<xtbh.length; i++){
				gddmapper.deleteGdd(xtbh[i]);
			}
			return true;
		}catch (Exception e) {
			logger.error("删除管道段：",e);
			return false;
		}
	}
	
	/**
	 * 管道段批量编辑
	 * @param map 表单值
	 * @return
	 */
	public boolean batchEdit(Map<String, Object> map){
		try{
			gddmapper.batchEdit(map);
			return true;
		}catch (Exception e) {
			logger.error("编辑管道段：",e);
			return false;
		}
	}	
}
