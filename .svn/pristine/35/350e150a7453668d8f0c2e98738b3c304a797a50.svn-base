package com.cabletech.res.service.groupcustomsmgr;

import java.text.SimpleDateFormat;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cabletech.baseinfo.business.rest.EsriRestEntity;
import com.cabletech.core.service.BaseServiceImpl;
import com.cabletech.res.entity.groupcustomsmgr.GroupCustomsEntity;
import com.cabletech.res.mapper.groupcustomsmgr.GroupCustomsMapper;

/**
 * 集团客户信息管理
 * @author wangt 2011-05-22
 *
 */
@Service
public class GroupCustomsServiceImpl extends BaseServiceImpl implements GroupCustomsService {
	
	@Resource(name = "groupCustomsMapper")
	private GroupCustomsMapper mapper;
	
	/**
	 * 保存
	 * @param entity 集团客户实体
	 * @return 
	 */
	public boolean saveorupdate(GroupCustomsEntity entity){
		try{
			EsriRestEntity esrientity = new EsriRestEntity();
			esrientity.setAttrobj(entity);
			esrientity.setRestype(super.restservice.POINT);
			esrientity.setRescode("AA502");
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
			logger.error("新增或更新集团客户：",e);
			return false;
		}
	}
	
	/**
	 * 查看
	 * @param xtbh 系统编号
	 * @return 集团客户实体
	 */
	public GroupCustomsEntity getbyid(String xtbh){
		return mapper.getbyid(xtbh);
	}

	@Override
	public boolean delete(GroupCustomsEntity entity) {
		try {
			mapper.delete(entity.getXtbh());
			/**
			 * 删除关联资源
			 */
			return true;
		} catch (Exception e) {
			logger.error("删除集团客户：",e);
			return false;
		}
	}
	
	@Override
	@Transactional
	public boolean batchDelete(String xtbhs){
		String[] xtbh = xtbhs.split(",");
		try{
			for(int i=0; i<xtbh.length; i++){
				mapper.delete(xtbh[i]);
			}
			return true;
		}catch (Exception e) {
			logger.error("删除集团客户：",e);
			return false;
		}
	}	
}
