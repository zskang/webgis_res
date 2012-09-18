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
import com.cabletech.res.entity.basemgr.GjxxEntity;
import com.cabletech.res.mapper.basemgr.GddMapper;
import com.cabletech.res.mapper.basemgr.GjxxMapper;
import com.cabletech.res.mapper.basemgr.YsMapper;

/**
 * 管井信息管理
 * @author zhanglei 2011-05-11
 *
 */
@Service
public class GjxxServiceImpl extends BaseServiceImpl implements GjxxService {

	@Resource(name = "gjxxMapper")
	private GjxxMapper gjxxmapper;
	
	@Resource(name = "ysMapper")
	private YsMapper ysmapper;
	
	@Resource(name = "gddMapper")
	private GddMapper gddmapper;
	
	/**
	 * 保存修改
	 * @param entity 管井实体
	 */
	@Transactional
	public boolean saveorupdate(GjxxEntity entity){
		try{
			EsriRestEntity esrientity = new EsriRestEntity();
			esrientity.setAttrobj(entity);
			esrientity.setRestype(super.restservice.POINT);
			esrientity.setRescode("A21");
			esrientity.setX(entity.getProjectx());
			esrientity.setY(entity.getProjecty());
			if(StringUtils.isBlank(entity.getXtbh())){
				entity.setLon(entity.getPointX());
				entity.setLat(entity.getPointY());
				entity.setOncreate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date()));
				entity.setXtbh(super.getXTBH());
			}
			if(restservice.restPost(esrientity)){
				return true;
			}else{
				return false;
			}
		}catch (Exception e) {
			logger.error("新增或更新管井信息实体：",e);
			return false;
		}
	}
	
	/**
	 * 查看
	 * @param xtbh 系统编号
	 * @return 管井实体
	 */
	public GjxxEntity getbyid(String xtbh){
		return gjxxmapper.getbyid(xtbh);
	}
	
	/**
	 * 管井的逻辑删除
	 * @param xtbh 管井的系统编号
	 * @return true删除成功 false删除失败
	 */
	public boolean delete(String xtbh){
		try {
			gjxxmapper.deleteGj(xtbh);
			gddmapper.deleteGddByGj(xtbh);
			ysmapper.deleteYsByGj(xtbh);
			return true;
		} catch (Exception e) {
			logger.error("删除管井：",e);
			return false;
		}
	}
	/**
	 * 获取Ztree的结构数据
	 * @param entity 管井信息实体
	 */
	@Override
	public String getTreeNodes(GjxxEntity entity){
		Map<String, Object> restype = super.getResourceType();
		StringBuffer nodes = new StringBuffer();
		List<Map<String, Object>> gldlylist = gjxxmapper.getGldlyByGjbh(entity.getXtbh());
		List<Map<String, Object>> gddlist = gjxxmapper.getGddByGjbh(entity.getXtbh());
		List<Map<String, Object>> gjtlist = gjxxmapper.getGjtByGjbh(entity.getXtbh());
		List<Map<String, Object>> gjpmlist = gjxxmapper.getGjpmByGjbh(entity.getXtbh());
		List<Map<String, Object>> glpllist = gjxxmapper.getGlplByGjbh(entity.getXtbh());
		nodes.append(super.getRootNode(entity.getXtbh(), entity.getZymc(),6));
		nodes.append(super.getNode(entity.getXtbh(), "15", restype, gldlylist));
		nodes.append(super.getNode(entity.getXtbh(), "7", restype, gddlist));
		nodes.append(super.getNode(entity.getXtbh(), "16", restype, gjtlist));
		nodes.append(super.getNode(entity.getXtbh(), "17", restype, gjpmlist));
		nodes.append(super.getNode(entity.getXtbh(), "33", restype, glpllist));
		return nodes.toString();
	}
	
	/**
	 * 管井的批量逻辑删除
	 * @param xtbhs 管井的系统编号
	 * @return true删除成功 false删除失败
	 */
	@Transactional
	public boolean batchDelete(String xtbhs){
		String[] xtbh = xtbhs.split(",");
		try{
			for(int i=0; i<xtbh.length; i++){
				gjxxmapper.deleteGj(xtbh[i]);
				gddmapper.deleteGddByGj(xtbh[i]);
				ysmapper.deleteYsByGj(xtbh[i]);
			}
			return true;
		}catch (Exception e) {
			logger.error("删除管井：",e);
			return false;
		}
	}
	
	/**
	 * 管井批量编辑
	 * @param map 表单值
	 * @return
	 */
	public boolean batchEdit(Map<String, Object> map){
		try{
			gjxxmapper.batchEdit(map);
			return true;
		}catch (Exception e) {
			logger.error("编辑管井：",e);
			return false;
		}
	}	
}
