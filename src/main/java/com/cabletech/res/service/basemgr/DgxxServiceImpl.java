package com.cabletech.res.service.basemgr;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cabletech.baseinfo.business.rest.EsriRestEntity;
import com.cabletech.core.service.BaseServiceImpl;
import com.cabletech.res.entity.basemgr.DgxxEntity;
import com.cabletech.res.mapper.basemgr.DgxxMapper;
import com.cabletech.res.mapper.basemgr.GldMapper;
import com.cabletech.res.mapper.basemgr.YsMapper;

/**
 * 电杆信息管理
 * @author zhb 2011-05-11
 *
 */
@Service
public class DgxxServiceImpl extends BaseServiceImpl  implements DgxxService {

	@Resource(name = "dgxxMapper")
	private DgxxMapper dgxxMapper;
	
	@Resource(name = "gldMapper")
	private GldMapper gldMapper;
	
	@Resource(name = "ysMapper")
	private YsMapper ysMapper;

	/**
	 * 获取电杆信息实体
	 * @param resId 资源编号
	 * @return entity
	 */	
	public DgxxEntity getbyid(String resId) {
		return dgxxMapper.getbyid(resId);
	}

	/**
	 * 新增或更新电杆信息实体
	 * @param entity 电杆实体
	 */	
	public boolean saveorupdate(DgxxEntity entity) {
		try{
			EsriRestEntity esrientity = new EsriRestEntity();
			esrientity.setAttrobj(entity);
			esrientity.setRestype(super.restservice.POINT);
			esrientity.setRescode("A20");
			esrientity.setX(entity.getProjectx());
			esrientity.setY(entity.getProjecty());			
			if(StringUtils.isBlank(entity.getXtbh())){
				entity.setLon(entity.getPointX());
				entity.setLat(entity.getPointY());
				entity.setCreatedate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date()));
				entity.setXtbh(super.getXTBH());
			}			
			if(super.restservice.restPost(esrientity)){
				return true;
			}else{
				return false;
			}
		}catch (Exception e) {
			logger.error("新增或更新电杆信息：",e);
			return false;
		}
	}
	
	/**
	 * 逻辑删除电杆
	 * @param entity 电杆实体
	 */
	@Transactional
	public boolean delete(DgxxEntity entity){
		try {
			dgxxMapper.deleteDgxx(entity.getXtbh());
			gldMapper.deleteGldByDgXtbh(entity.getXtbh());
			ysMapper.deleteYsByDg(entity.getXtbh());
			return true;
		} catch (Exception e) {
			logger.error("删除电杆：",e);
			return false;
		}
	}
	
	/**
	 * 获取Ztree的结构数据
	 * @param entity 电杆信息实体
	 */
	@Override
	public String getTreeNodes(DgxxEntity entity){
		Map<String, Object> restype = super.getResourceType();
		StringBuffer nodes = new StringBuffer();
		List<Map<String, Object>> gldlist = dgxxMapper.getGldByDgxx(entity.getXtbh());
		List<Map<String, Object>> gldlylist = dgxxMapper.getGldlyByDgxx(entity.getXtbh());
		List<Map<String, Object>> yslist = dgxxMapper.getYsByDgxx(entity.getXtbh());
		List<Map<String, Object>> gjtlist = dgxxMapper.getGjtByDgxx(entity.getXtbh());
		List<Map<String, Object>> glpllist = dgxxMapper.getGlplByDgxx(entity.getXtbh());
		nodes.append(super.getRootNode(entity.getXtbh(), entity.getZymc(),12));
		nodes.append(super.getNode(entity.getXtbh(), "13", restype, gldlist));
		nodes.append(super.getNode(entity.getXtbh(), "15", restype, gldlylist));
		nodes.append(super.getNode(entity.getXtbh(), "1", restype, yslist));
		nodes.append(super.getNode(entity.getXtbh(), "16", restype, gjtlist));
		nodes.append(super.getNode(entity.getXtbh(), "33", restype, glpllist));
		return nodes.toString();
	}
	
	/**
	 * 电杆的批量逻辑删除
	 * @param xtbhs 电杆的系统编号
	 * @return true删除成功 false删除失败
	 */
	@Transactional
	public boolean batchDelete(String xtbhs){
		String[] xtbh = xtbhs.split(",");
		try{
			for(int i=0; i<xtbh.length; i++){
				dgxxMapper.deleteDgxx(xtbh[i]);
				gldMapper.deleteGldByDgXtbh(xtbh[i]);
				ysMapper.deleteYsByDg(xtbh[i]);
			}
			return true;
		}catch (Exception e) {
			logger.error("删除电杆：",e);
			return false;
		}
	}
	
	/**
	 * 电杆批量编辑
	 * @param map 表单值
	 * @return
	 */
	public boolean batchEdit(Map<String, Object> map){
		try{
			dgxxMapper.batchEdit(map);
			return true;
		}catch (Exception e) {
			logger.error("编辑电杆：",e);
			return false;
		}
	}	
}
