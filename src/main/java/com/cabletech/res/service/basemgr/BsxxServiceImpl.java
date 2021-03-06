package com.cabletech.res.service.basemgr;

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
import com.cabletech.res.entity.basemgr.BsxxEntity;
import com.cabletech.res.mapper.basemgr.BsdMapper;
import com.cabletech.res.mapper.basemgr.BsxxMapper;
import com.cabletech.res.mapper.basemgr.YsMapper;

/**
 * 标石信息管理
 * @author zhanglei 2011-05-11
 *
 */
@Service
public class BsxxServiceImpl extends BaseServiceImpl implements BsxxService {
	
	@Resource(name = "bsxxMapper")
	private BsxxMapper bsxxmapper;
	
	@Resource(name = "bsdMapper")
	private BsdMapper bsdmapper;
	
	@Resource(name = "ysMapper")
	private YsMapper ysmapper;	
	
	/**
	 * 保存
	 * @param entity 标石实体
	 */
	@Transactional
	public boolean saveorupdate(BsxxEntity entity){
		try{
			entity.setCreatedate(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date().getTime()));
			EsriRestEntity esrientity = new EsriRestEntity();
			esrientity.setAttrobj(entity);
			esrientity.setRestype(super.restservice.POINT);
			esrientity.setRescode("A22");
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
			logger.error("新增或更新标石信息：",e);
			return false;
		} 
	}
 	
	/**
	 * 查看
	 * @param xtbh 系统编号
	 * @return 标石实体
	 */
	public BsxxEntity getbyid(String xtbh){
		return bsxxmapper.getbyid(xtbh);
	}
	
	/**
	 * 标石信息单条删除
	 * @param xtbh 系统编号
	 * @return Boolean 删除成功或者失败
	 */
	public boolean delete(String xtbh){
		try {
			bsxxmapper.deleteBs(xtbh);
			bsdmapper.deleteBsdByBs(xtbh);
			ysmapper.deleteYsByBs(xtbh);
			return true;
		} catch (Exception e) {
			logger.error("删除标石信息：",e);
			return false;
		}
	}
	
	/**
	 * 获取Ztree的结构数据
	 * @param entity 标石信息实体
	 */
	@Override
	public String getTreeNodes(BsxxEntity entity){
		Map<String, Object> restype = super.getResourceType();
		StringBuffer nodes = new StringBuffer();
		List<Map<String, Object>> gldlylist = bsxxmapper.getGldlyBybsxx(entity.getXtbh());
		List<Map<String, Object>> bsdlist = bsxxmapper.getBsdBybsxx(entity.getXtbh());
		List<Map<String, Object>> gjtlist = bsxxmapper.getGjtByGjbh(entity.getXtbh());
		nodes.append(super.getRootNode(entity.getXtbh(), entity.getZymc(),9));
		nodes.append(super.getNode(entity.getXtbh(), "15", restype, gldlylist));
		nodes.append(super.getNode(entity.getXtbh(), "16", restype, gjtlist));
		nodes.append(super.getNode(entity.getXtbh(), "10", restype, bsdlist));
		return nodes.toString();
	}
	
	/**
	 * 标石的批量逻辑删除
	 * @param xtbhs 标石的系统编号
	 * @return true删除成功 false删除失败
	 */
	@Transactional
	public boolean batchDelete(String xtbhs){
		String[] xtbh = xtbhs.split(",");
		try{
			for(int i=0; i<xtbh.length; i++){
				bsxxmapper.deleteBs(xtbh[i]);
				bsdmapper.deleteBsdByBs(xtbh[i]);
				ysmapper.deleteYsByBs(xtbh[i]);
			}
			return true;
		}catch (Exception e) {
			logger.error("删除标石：",e);
			return false;
		}
	}
	
	/**
	 * 标石批量编辑
	 * @param map 表单值
	 * @return
	 */
	public boolean batchEdit(Map<String, Object> map){
		try{
			bsxxmapper.batchEdit(map);
			return true;
		}catch (Exception e) {
			logger.error("编辑标石：",e);
			return false;
		}
	}	
}
