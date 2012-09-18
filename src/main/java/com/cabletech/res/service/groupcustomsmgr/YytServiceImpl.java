package com.cabletech.res.service.groupcustomsmgr;

import java.text.SimpleDateFormat;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cabletech.baseinfo.business.rest.EsriRestEntity;
import com.cabletech.core.service.BaseServiceImpl;
import com.cabletech.res.entity.groupcustomsmgr.YytEntity;
import com.cabletech.res.mapper.groupcustomsmgr.YytMapper;

/**
 * 营业厅管理
 * @author zhanglei 2011-05-22
 *
 */
@Service
public class YytServiceImpl extends BaseServiceImpl implements YytService {
	
	@Resource(name = "yytMapper")
	private YytMapper yytmapper;
	
	/**
	 * 保存
	 * @param entity 营业厅实体
	 * @return 
	 */
	@Transactional
	public boolean saveorupdate(YytEntity entity){
		try{
			EsriRestEntity esrientity = new EsriRestEntity();
			esrientity.setAttrobj(entity);
			esrientity.setRestype(super.restservice.POINT);
			esrientity.setRescode("A36");
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
				logger.error("新增或更新营业厅：",e);
				return false;
			}
	}
	
	/**
	 * 查看
	 * @param xtbh 系统编号
	 * @return 营业厅实体
	 */
	public YytEntity getbyid(String xtbh){
		return yytmapper.getbyid(xtbh);
	}

	@Override
	public boolean delete(String xtbh) {
		try {
			yytmapper.delete(xtbh);
			/**
			 * 删除关联资源
			 */
			return true;
		} catch (Exception e) {
			logger.error("删除 营业厅：",e);
			return false;
		}
	}
	
	@Override
	@Transactional
	public boolean batchDelete(String xtbhs){
		String[] xtbh = xtbhs.split(",");
		try{
			for(int i=0; i<xtbh.length; i++){
				yytmapper.delete(xtbh[i]);
			}
			return true;
		}catch (Exception e) {
			logger.error("删除集团客户：",e);
			return false;
		}
	}	
}
