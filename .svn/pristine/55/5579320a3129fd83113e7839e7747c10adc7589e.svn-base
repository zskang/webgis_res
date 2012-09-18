package com.cabletech.res.service.opticcablemgr;


import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cabletech.baseinfo.business.rest.EsriRestEntity;
import com.cabletech.core.service.BaseServiceImpl;
import com.cabletech.res.entity.opticcablemgr.GlplEntity;
import com.cabletech.res.mapper.basemgr.DgxxMapper;
import com.cabletech.res.mapper.basemgr.GjxxMapper;
import com.cabletech.res.mapper.opticcablemgr.GldlyMapper;
import com.cabletech.res.mapper.opticcablemgr.GlplMapper;

/**
 * 光缆盘留管理
 * @author zhanglei 2011-05-11
 *
 */
@Service
public class GlplServiceImpl extends BaseServiceImpl implements GlplService {
	
	@Resource(name = "glplMapper")
	private GlplMapper glplmapper;
	
	@Resource(name = "gldlyMapper")
	private GldlyMapper gldlymapper;	
	
	@Resource(name = "gjxxMapper")
	private GjxxMapper gjxxmapper;
	
	@Resource(name = "dgxxMapper")
	private DgxxMapper dgxxmapper;	
	
	
	
	/**
	 * 保存修改
	 * @param entity 光缆盘留实体
	 */
	@Transactional
	public boolean saveorupdate(GlplEntity entity){
		try{
			EsriRestEntity esrientity = new EsriRestEntity();
			esrientity.setAttrobj(entity);
			esrientity.setRestype(super.restservice.POINT);
			esrientity.setRescode("AD706");
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
			logger.error("新增或更新光缆盘留信息实体：",e);
			return false;
		}
	}
	
	/**
	 * 查看
	 * @param xtbh 系统编号
	 * @return 光缆盘留实体
	 */
	public GlplEntity getbyid(String xtbh){
		return glplmapper.getbyid(xtbh);
	}
	
	/**
	 * 光缆盘留的逻辑删除
	 * @param xtbh 光缆盘留的系统编号
	 * @return true删除成功 false删除失败
	 */
	public boolean delete(String xtbh){
		try {
			glplmapper.delete(xtbh);
			return true;
		} catch (Exception e) {
			logger.error("删除光缆盘留：",e);
			return false;
		}
	}
	/**
	 * 获取Ztree的结构数据
	 * @param entity 光缆盘留
	 */
	@Override
	public String getTreeNodes(GlplEntity entity){
		Map<String, Object> restype = super.getResourceType();
		StringBuffer nodes = new StringBuffer();
		List<Map<String, Object>> gldlylist = gldlymapper.getGldlyByglplbh(entity.getXtbh());
		List<Map<String, Object>> dgxxlist = dgxxmapper.getDgxxByglplbh(entity.getXtbh());
		List<Map<String, Object>> gjxxlist = gjxxmapper.getGjxxByglplbh(entity.getXtbh());
		nodes.append(super.getRootNode(entity.getXtbh(), entity.getZymc(),33));
		nodes.append(super.getNode(entity.getXtbh(), "15", restype, gldlylist));
		nodes.append(super.getNode(entity.getXtbh(), "12", restype, dgxxlist));
		nodes.append(super.getNode(entity.getXtbh(), "6", restype, gjxxlist));
		return nodes.toString();
	}
	
	/**
	 * 光缆盘留的批量逻辑删除
	 * @param xtbhs 光缆盘留的系统编号
	 * @return true删除成功 false删除失败
	 */
	@Transactional
	public boolean batchDelete(String xtbhs){
		String[] xtbh = xtbhs.split(",");
		try{
			for(int i=0; i<xtbh.length; i++){
				glplmapper.delete(xtbh[i]);
			}
			return true;
		}catch (Exception e) {
			logger.error("删除光缆盘留：",e);
			return false;
		}
	}
}
