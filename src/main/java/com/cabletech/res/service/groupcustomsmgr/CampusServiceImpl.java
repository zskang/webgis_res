package com.cabletech.res.service.groupcustomsmgr;

import java.text.SimpleDateFormat;

import javax.annotation.Resource;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cabletech.baseinfo.business.rest.EsriRestEntity;
import com.cabletech.core.service.BaseServiceImpl;
import com.cabletech.res.entity.groupcustomsmgr.CampusEntity;
import com.cabletech.res.mapper.groupcustomsmgr.CampusMapper;

/**
 * 校园网管理 Service实现
 * 
 * @author zhb 2012/5/11
 */
@Service
public class CampusServiceImpl extends BaseServiceImpl implements CampusService {

	@Resource(name = "campusMapper")
	private CampusMapper campusMapper;
	
	/**
	 * 获取校园网实体
	 * @param resId 资源编号
	 * @return entity
	 */	
	public CampusEntity getbyid(String resId){
		return campusMapper.getbyid(resId);
	}
	
	/**
	 * 新增或更新校园网实体
	 * @param entity 校园网实体
	 */
	@Transactional
	public boolean saveorupdate(CampusEntity entity){
		try{
			EsriRestEntity esrientity = new EsriRestEntity();
			esrientity.setAttrobj(entity);
			esrientity.setRestype(super.restservice.POINT);
			esrientity.setRescode("A34");
			esrientity.setX(entity.getProjectx());
			esrientity.setY(entity.getProjecty());
			if(StringUtils.isBlank(entity.getXtbh())){
				entity.setLon(entity.getPointX());
				entity.setLat(entity.getPointY());	
				entity.setCreatetime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date()));	
				entity.setXtbh(super.getXTBH());
			}
			if(restservice.restPost(esrientity)){
				return true;
			}else{
				return false;
			}
		}catch (Exception e) {
			logger.error("新增或更新校园网实体：",e);
			return false;
		}
	}
	
	/**
	 * 逻辑删除校园网
	 * @param entity 校园网实体
	 */
	public boolean delete(CampusEntity entity){
		try {
			campusMapper.deleteCampus(entity.getXtbh());
			return true;
		} catch (Exception e) {
			logger.error("删除校园网：",e);
			return false;
		}
	}
	
	@Override
	@Transactional
	public boolean batchDelete(String xtbhs){
		String[] xtbh = xtbhs.split(",");
		try{
			for(int i=0; i<xtbh.length; i++){
				campusMapper.deleteCampus(xtbh[i]);
			}
			return true;
		}catch (Exception e) {
			logger.error("删除校园网：",e);
			return false;
		}
	}	

}
