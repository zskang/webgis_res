package com.cabletech.res.service.publicmgr;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cabletech.baseinfo.business.rest.EsriRestEntity;
import com.cabletech.baseinfo.excel.ExportSupport;
import com.cabletech.core.service.BaseServiceImpl;
import com.cabletech.res.entity.publicmgr.GroupCustomerEntity;
import com.cabletech.res.mapper.publicmgr.GroupCustomerMapper;
import com.cabletech.res.service.common.MainTenceService;

/**
 * 集客
 * @author wangt
 *
 */
@Service
public class GroupCustomerServiceImpl extends BaseServiceImpl implements GroupCustomerService,ExportSupport {
	
	@Resource(name = "groupCustomerMapper")
	private GroupCustomerMapper mapper;
	
	@Resource(name = "mainTenceServiceImpl")
	private MainTenceService service;
	
	private Map<String, Object> exportconditionmap = new HashMap<String, Object>();
	
	@Override
	public void setExportconditionmap(Map<String, Object> map){
		exportconditionmap = map;
	}

	@Override
	@Transactional
	public boolean saveorupdate(GroupCustomerEntity entity) {
		try{
			EsriRestEntity esrientity = new EsriRestEntity();
			esrientity.setAttrobj(entity);
			esrientity.setRestype(super.restservice.POINT);
			esrientity.setRescode("A29");
			esrientity.setX(entity.getProjectx());
			esrientity.setY(entity.getProjecty());
			if(StringUtils.isBlank(entity.getXtbh())){
				entity.setLon(entity.getPointX());
				entity.setLat(entity.getPointY());
				entity.setXtbh(super.getXTBH());
			}
			if(restservice.restPost(esrientity)){
				return true;
			}else{
				return false;
			}			
		   
		}catch (Exception e) {
			logger.error("新增或更新GroupCustomerEntity：",e);
			return false;
		}
	}

	@Override
	public boolean delete(String xtbh) {
		try {
			service.delete(getbyid(xtbh).getSiteid(), "A30", "C34");
			service.delete(getbyid(xtbh).getSiteid(), "A31", "C34");
			mapper.delete(xtbh);
			return true;
		} catch (Exception e) {
			logger.error("删除groupcustomer：",e);
			return false;
		}
	}

	@Override
	public GroupCustomerEntity getbyid(String xtbh) {
		// TODO Auto-generated method stub
		return mapper.getbyid(xtbh);
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public List getExportDatas(Map<String, Object> paramet) {
		return mapper.queryGroupCustomerList(exportconditionmap);
	}
	
}
