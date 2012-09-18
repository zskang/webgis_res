package com.cabletech.res.service.basemgr;

import java.text.SimpleDateFormat;
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
import com.cabletech.res.entity.basemgr.DgxxEntity;
import com.cabletech.res.entity.basemgr.YsEntity;
import com.cabletech.res.mapper.basemgr.DgxxMapper;
import com.cabletech.res.mapper.basemgr.GjxxMapper;
import com.cabletech.res.mapper.basemgr.YsMapper;
 
/**
 * 引上段管理
 * @author zhanglei 2011-05-11
 *
 */
@Service
public class YsServiceImpl extends BaseServiceImpl  implements YsService {
	
	@Resource(name = "ysMapper")
	private YsMapper ysmapper;
	
	@Resource(name = "dgxxMapper")
	private DgxxMapper dgxxmapper;
	
	@Resource(name = "gjxxMapper")
	private GjxxMapper gjxxmapper;
	/**
	 * 引上段修改
	 * @param entity 引上段实体
	 */
	@Transactional
	public boolean saveorupdate(YsEntity entity){
		try{
			List<Map<String, String>> points = new ArrayList<Map<String, String>>();
			EsriRestEntity esrientity = new EsriRestEntity();
			esrientity.setAttrobj(entity);
			esrientity.setRestype(super.restservice.LINE);
			esrientity.setRescode("AD605");	
			points = super.getPoints(entity.getQdlx(), entity.getQdmc(), entity.getZdlx(), entity.getZdmc());
			esrientity.setList(points);
			if(StringUtils.isBlank(entity.getXtbh())){
				entity.setCreatedate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date()));
				entity.setXtbh(super.getXTBH());
			}		
			if(super.restservice.restPost(esrientity)){
				return true;
			}else{
				return false;
			}			
		}catch (Exception e) {
			logger.error("新增或更新引上实体：",e);
			return false;
		}
	}
	
	/**
	 * 组合引上段的坐标
	 * @param entity 引上实体
	 * @return Sting 引上shape
	 */
	private String getGeostr(YsEntity entity) {
		String geostr = "";
		String[] Allxy = new String[4];
		if(entity.getQdlx().equals("A20")){
			Allxy[0] = dgxxmapper.getbyid(entity.getQdmc()).getProjectx();
			Allxy[1] = dgxxmapper.getbyid(entity.getQdmc()).getProjecty();
		}else{
			Allxy[0] = gjxxmapper.getbyid(entity.getQdmc()).getProjectx();
			Allxy[1] = gjxxmapper.getbyid(entity.getQdmc()).getProjecty();
		}
		if(entity.getZdlx().equals("A20")){
			Allxy[2] = dgxxmapper.getbyid(entity.getZdmc()).getProjectx();
			Allxy[3] = dgxxmapper.getbyid(entity.getZdmc()).getProjectx();
		}else{
			Allxy[2] = gjxxmapper.getbyid(entity.getZdmc()).getProjectx();
			Allxy[3] = gjxxmapper.getbyid(entity.getZdmc()).getProjectx();
		}
		geostr = super.getLineStr(Allxy[0],Allxy[1],Allxy[2],Allxy[3]);
		return geostr;
	}

	/**
	 * 单条查看引上段
	 * @param xtbh 系统编号
	 * @return 单条引上段实体
	 */
	public YsEntity getbyid(String xtbh){
		return ysmapper.getbyid(xtbh);
	}
	
	/**
	 * 引上段单条删除
	 * @param xtbh 系统编号
	 * @return Boolean 删除成功或者失败
	 */
	public boolean delete(String xtbh){
		try {
			ysmapper.delete(xtbh);
			return true;
		} catch (Exception e) {
			logger.error("删除引上段：",e);
			return false;
		}
	}
	
	/**
	 * 获取资源相关结点串
	 * @param entity 引上实体
	 * @return
	 */
	public String getTreeNodes(YsEntity entity){
		Map<String, Object> restype = super.getResourceType();
		StringBuffer nodes = new StringBuffer();
		List<Map<String, Object>> gldlylist = ysmapper.getGldlyByYsbh(entity.getXtbh());
		Map<String, Object> map = getQdZdParameterMap(entity);
		List<Map<String, Object>> qdzdlist = ysmapper.getQdZdByYsbh(map);
		nodes.append(super.getRootNode(entity.getXtbh(), entity.getZymc(), 1));
		nodes.append(getQdZdNode(entity, qdzdlist));
		nodes.append(super.getNode(entity.getXtbh(), "15", restype, gldlylist));
		return nodes.toString();
	}
	
	/**
	 * 获取引上起端和终端资源结点串
	 * @param entity 引上实体
	 * @param list 数据集合
	 * @return 结点串
	 */
	public String getQdZdNode(YsEntity entity, List<Map<String, Object>> list){
		StringBuffer node = new StringBuffer();
		if(list != null && list.size()>0){
			node.append(",{\"id\":\"y\",\"pId\":\""+entity.getXtbh()+"\",\"name\":\""+getResName(entity.getQdlx())+"-"+getResName(entity.getZdlx())+"（"+list.size()+"）\",\"open\":\"true\"}");
			for(Map<String,Object> map:list){
				node.append(",{\"id\":\""+map.get("XTBH")+"\",\"pId\":\"y\",\"parentKey\":\""+getResAccessIndex(map.get("LX").toString())+"\",\"name\":\""+map.get("ZYMC")+"\"}");
			}
		}
		return node.toString();		
	}
	
	/**
	 * 获取前端访问索引
	 * @param lx 资源类型
	 * @return 索引值
	 */
	public int getResAccessIndex(String lx){
		String[] res = {"AD605","AD6010","A23","AD604","AD609","A21","AD601","AD606","A22","AD603","AD608","A20","AD602","AD607","A33","AA005","管道闸"};
		int j = 0;
		for(int i=0; i<res.length; i++){
			if(lx.equals(res[i])){
				j = i+1;break;
			}
		}
		return j;
	}
	
	/**
	 * 获取查询条件
	 * @param entity 引上实体
	 * @return 返回起始终止类型
	 */
	public Map<String, Object> getQdZdParameterMap(YsEntity entity){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("xtbh",entity.getXtbh());
		map.put("qdlx", entity.getQdlx());
		map.put("zdlx", entity.getZdlx());
		map.put("qdTableName",getTableNameByType(entity.getQdlx()));
		map.put("zdTableName",getTableNameByType(entity.getZdlx()));
		return map;
	}
	 
	/**
	 * 根据资源类型返回表名
	 * @param lx 资源类型
	 * @return 表名称
	 */
	public String getTableNameByType(String lx){
		String[] restypes = {"A20","A21","A22","A23"};
		String[] restables = {"res_dgxx","res_gjxx","res_bsxx","res_gqxx"};
		String bb = "";
		for(int i=0; i<restypes.length; i++){
			if(lx.equals(restypes[i])){
				bb = restables[i];
				break;
			}
		}
		return bb;
	}
	
	/**
	 * 获取资源名称
	 * @param key 资源类型
	 * @return 资源名称
	 */
	public String getResName(String key){
		String[] restypes = {"A20","A21","A22","A23"};
		String[] restables = {"电杆","管井","标石","挂墙"};
		String temp = "";
		int i = getSearchIndex(key, restypes);
		if(i != -1){
			temp = restables[i];
		}
		return temp;
	}
	
	/**
	 * 获取查询索引
	 * @param key 关键字
	 * @param restypes 待查询数组
	 * @return
	 */
	public int getSearchIndex(String key, String[] restypes){
		int j = -1;
		for(int i=0; i<restypes.length; i++){
			if(restypes[i].equals(key)){
				j = i;
				break;
			}
		}
		return j;
	}
	
	/**
	 * 引上的批量逻辑删除
	 * @param xtbhs 引上的系统编号
	 * @return true删除成功 false删除失败
	 */
	@Transactional
	public boolean batchDelete(String xtbhs){
		String[] xtbh = xtbhs.split(",");
		try{
			for(int i=0; i<xtbh.length; i++){
				ysmapper.delete(xtbh[i]);
			}
			return true;
		}catch (Exception e) {
			logger.error("删除引上：",e);
			return false;
		}
	}
	
	/**
	 * 引上批量编辑
	 * @param map 表单值
	 * @return
	 */
	public boolean batchEdit(Map<String, Object> map){
		try{
			ysmapper.batchEdit(map);
			return true;
		}catch (Exception e) {
			logger.error("编辑引上：",e);
			return false;
		}
	}
}
