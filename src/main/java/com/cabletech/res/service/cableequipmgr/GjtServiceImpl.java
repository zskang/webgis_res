package com.cabletech.res.service.cableequipmgr;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cabletech.baseinfo.business.rest.EsriRestEntity;
import com.cabletech.core.service.BaseServiceImpl;
import com.cabletech.res.entity.cableequipmgr.GjtEntity;
import com.cabletech.res.mapper.cableequipmgr.GjtMapper;

/**
 * 光接头管理
 * @author wangt 2011-05-22
 *
 */
@Service
public class GjtServiceImpl extends BaseServiceImpl implements GjtService {
	
	@Resource(name = "gjtMapper")
	private GjtMapper gjtmapper;
	
	/**
	 * 保存
	 * @param entity 光接头实体
	 * @return 
	 */
	public boolean saveorupdate(GjtEntity entity){
		try{
			EsriRestEntity esrientity = new EsriRestEntity();
			esrientity.setAttrobj(entity);
			esrientity.setRestype(super.restservice.POINT);
			esrientity.setRescode("AA005");
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
			logger.error("新增或更新光接头：",e);
			return false;
		}
	}
	
	/**
	 * 查看
	 * @param xtbh 系统编号
	 * @return 光接头实体
	 */
	public GjtEntity getbyid(String xtbh){
		return gjtmapper.getbyid(xtbh);
	}
 
	@Override
	public boolean delete(GjtEntity entity) {
		try {
			gjtmapper.deleteGjtConnByGjtXtbh(entity.getXtbh());
			gjtmapper.delete(entity.getXtbh());
			/**
			 * 删除之内的ODF、光终端盒、光分纤箱等资源
			 */
			return true;
		} catch (Exception e) {
			logger.error("删除光接头：",e);
			return false;
		}
	}
	
	/**
	 * 获取Ztree的结构数据
	 * @param entity 光接头实体
	 */
	@Override
	public String getTreeNodes(GjtEntity entity){
		Map<String, Object> restype = super.getResourceType();
		StringBuffer nodes = new StringBuffer();
		List<Map<String, Object>> gldlylist = gjtmapper.getGldlyByGjt(entity);
		nodes.append(super.getRootNode(entity.getXtbh(), entity.getZymc(),16));
		Map<String, Object> map = new HashMap<String, Object>();
		String [] sssslx = getSssslx(entity.getSssslx()).split(",");
		if(sssslx.length>1){
		map.put("xtbh", entity.getXtbh());
		map.put("tablename", sssslx[1]);
		List<Map<String, Object>> ssssblist = gjtmapper.getSsssblxByGjt(map);
		nodes.append(super.getNode(entity.getXtbh(), sssslx[0], restype, ssssblist));
		}
		
		nodes.append(super.getNode(entity.getXtbh(), "15", restype, gldlylist));
		
		return nodes.toString();
	}
	
	/**
	 * @param Sssslx 所属设施类型
	 * @return
	 */
	public String getSssslx(String Sssslx){
		String parString = "";
		if(StringUtils.isNotBlank(Sssslx)){
			if(Sssslx.equals("A20")){
				parString = "12"+","+"res_dgxx";
			}else if(Sssslx.equals("A21")){
				parString = "6"+","+"res_gjxx";
			}else if(Sssslx.equals("A22")){
				parString = "9"+","+"res_bsxx";
			}else if(Sssslx.equals("A23")){
				parString = "3"+","+"res_gqxx";
			}
		}
		return parString;
	}
	
	@Override
	@Transactional
	public boolean batchDelete(String xtbhs){
		String[] xtbh = xtbhs.split(",");
		try{
			for(int i=0; i<xtbh.length; i++){
				gjtmapper.deleteGjtConnByGjtXtbh(xtbh[i]);
				gjtmapper.delete(xtbh[i]);
			}
			return true;
		}catch (Exception e) {
			logger.error("删除光接头：",e);
			return false;
		}
	}
	
	@Override
	public boolean batchEdit(Map<String, Object> map){
		try{
			gjtmapper.batchEdit(map);
			return true;
		}catch (Exception e) {
			logger.error("编辑光接头：",e);
			return false;
		}
	}	
	
	/**
	 * 获取资源树(连接管理模块需要，吕仁钊添加)
	 * @param map 表单值
	 * @return
	 */
	public List<Map<String,Object>> getResTree(String xtbh){
		return gjtmapper.getResTree(xtbh);
	}
}
