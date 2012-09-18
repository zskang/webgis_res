package com.cabletech.res.service.opticcablemgr;

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
import com.cabletech.res.entity.opticcablemgr.GldlyEntity;
import com.cabletech.res.mapper.cableequipmgr.GfxxMapper;
import com.cabletech.res.mapper.cableequipmgr.GzdhMapper;
import com.cabletech.res.mapper.opticcablemgr.GldlyMapper;
import com.cabletech.res.mapper.publicmgr.OdfMapper;

/**
 * 光缆段路由信息管理
 * 
 * @author zhanglei 2011-05-11
 * 
 */
@Service
public class GldlyServiceImpl extends BaseServiceImpl implements GldlyService {

	@Resource(name = "gldlyMapper")
	private GldlyMapper gldlymapper;
	
	@Resource(name = "odfMapper")
	private OdfMapper odfmapper;
	
	@Resource(name = "gfxxMapper")
	private GfxxMapper gfxxmapper;
	
	@Resource(name = "gzdhMapper")
	private GzdhMapper gzdhmapper;
	

	/**
	 * 验证两个odf所属的站点是否相同
	 * @param xtbh1
	 * @param xtbh2
	 * @return
	 */
	public boolean checkOdfSSZD(String xtbh1,String xtbh2)
	{
		List<Map<String,Object>> sList=odfmapper.getZdxxByOdf(xtbh1);
		List<Map<String,Object>> eList=odfmapper.getZdxxByOdf(xtbh2);
		
		if(sList.size()!=0&&eList.size()!=0)
		{
			Map sMap=sList.get(0);
			Map eMap=eList.get(0);
			if(sMap.get("XTBH").equals(eMap.get("XTBH")))
			{
				return true;
			}else
			{
				return false;
			}
		}else
		{
			return false;
		}
		
		
	}
	/**
	 * 验证两个odf所属的站点是否相同
	 * @param xtbh1
	 * @param xtbh2
	 * @return
	 */
	public boolean checkGFxxSSZD(String xtbh1,String xtbh2)
	{
		List<Map<String,Object>> sList=odfmapper.getZdxxByOdf(xtbh1);
		List<Map<String,Object>> eList=odfmapper.getZdxxByOdf(xtbh2);
		
		if(sList.size()!=0&&eList.size()!=0)
		{
			Map sMap=sList.get(0);
			Map eMap=eList.get(0);
			if(sMap.get("XTBH").equals(eMap.get("XTBH")))
			{
				return true;
			}else
			{
				return false;
			}
		}else
		{
			return false;
		}
		
	}
	/**
	 * 验证两个odf所属的站点是否相同
	 * @param xtbh1
	 * @param xtbh2
	 * @return
	 */
	public boolean checkGzdhSSZD(String xtbh1,String xtbh2)
	{
		List<Map<String,Object>> sList=odfmapper.getZdxxByOdf(xtbh1);
		List<Map<String,Object>> eList=odfmapper.getZdxxByOdf(xtbh2);
		
		if(sList.size()!=0&&eList.size()!=0)
		{
			Map sMap=sList.get(0);
			Map eMap=eList.get(0);
			if(sMap.get("XTBH").equals(eMap.get("XTBH")))
			{
				return true;
			}else
			{
				return false;
			}
		}else
		{
			return false;
		}
		
		
	}
	/**
	 * 根据设备id和类型查询所有A端或Z端是该设备的路由端(吕仁钊 2012/7/2添加)
	 * 
	 * @param xtbh
	 *            系统编号
	 * @param zylx
	 *            资源类型
	 * @return 结果集
	 */
	public List<Map<String, Object>> getByIdByType(String xtbh, String zylx) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("xtbh", xtbh);
		params.put("zylx", zylx);
		return gldlymapper.getByIdByType(params);
	}

	/**
	 * 新增或更新光缆段路由实体
	 * 
	 * @param entity
	 *            光缆段路由实体
	 */
	@Transactional
	public boolean saveorupdate(GldlyEntity entity) {
		try {
			List<Map<String, String>> points = new ArrayList<Map<String, String>>();
			EsriRestEntity esrientity = new EsriRestEntity();
			esrientity.setAttrobj(entity);
			esrientity.setRestype(super.restservice.LINE);
			esrientity.setRescode("A33");	
			points = super.getPoints(entity.getAdsblx(), entity.getAdsbmc(), entity.getZdsblx(), entity.getZdsbmc());
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
		} catch (Exception e) {
			logger.error("新增或更新光缆段路由：", e);
			return false;
		}
	}

	/**
	 * 单条查看光缆段路由信息
	 * 
	 * @param xtbh
	 *            系统编号
	 * @return 单条光缆段路由实体
	 */
	public GldlyEntity getbyid(String xtbh) {
		return gldlymapper.getbyid(xtbh);
	}

	/**
	 * 光缆段路由单条删除
	 * 
	 * @param xtbh
	 *            系统编号
	 * @return boolean 删除成功或者失败
	 */
	public boolean delete(String xtbh) {
		try {
			gldlymapper.deleteGldly(xtbh);
			return true;
		} catch (Exception e) {
			logger.error("删除光缆段路由：", e);
			return false;
		}
	}
	
	@Override
	@Transactional
	public boolean batchDelete(String xtbhs){
		String[] xtbh = xtbhs.split(",");
		try{
			for(int i=0; i<xtbh.length; i++){
				gldlymapper.deleteGldly(xtbh[i]);
				GldlyEntity gldly = gldlymapper.getbyid(xtbh[i]);
				Map<String,Object> params = new HashMap<String, Object>();
				params.put("xtbh", gldly.getAdsbmc());
				params.put("zylx", gldly.getAdsblx());
				if(!"AA005".equals(gldly.getAdsblx())){
					gldlymapper.deleteCDXX(params);
				}
				params = new HashMap<String, Object>();
				params.put("xtbh", gldly.getZdsbmc());
				params.put("zylx", gldly.getZdsblx());
				if(!"AA005".equals( gldly.getZdsblx())){
					gldlymapper.deleteCDXX(params);
				}
				params = new HashMap<String, Object>();
				params.put("xtbh", xtbh[i]);
				gldlymapper.deleteRQXX(params);
			}
			return true;
		}catch (Exception e) {
			logger.error("删除光缆段：",e);
			return false;
		}
	}	

	/**
	 * 获取Ztree的结构数据
	 * 
	 * @param entity
	 *            光缆段路由
	 */
	@Override
	public String getTreeNodes(GldlyEntity entity) {
		Map<String, Object> restype = super.getResourceType();
		StringBuffer nodes = new StringBuffer();
		List<Map<String, Object>> odflist = gldlymapper.getOdfByGldly(entity
				.getXtbh());
		List<Map<String, Object>> gjjxlist = gldlymapper.getGjjxByGldly(entity
				.getXtbh());
		List<Map<String, Object>> gzdhlist = gldlymapper.getGzdhByGldly(entity
				.getXtbh());
		List<Map<String, Object>> gfxxlist = gldlymapper.getGfxxByGldly(entity
				.getXtbh());
		List<Map<String, Object>> qxlist = gldlymapper.getQXByGldly(entity
				.getXtbh());
		List<Map<String, Object>> glpllist = gldlymapper.getGlplByGldly(entity
				.getXtbh());
		List<Map<String, Object>> gjtlist = gldlymapper.getGjtByGldly(entity
				.getXtbh());
		nodes.append(super.getRootNode(entity.getXtbh(), entity.getZymc(), 15));
		nodes.append(super.getNode(entity.getXtbh(), "30", restype, odflist));
		nodes.append(super.getNode(entity.getXtbh(), "21", restype, gjjxlist));
		nodes.append(super.getNode(entity.getXtbh(), "18", restype, gzdhlist));
		nodes.append(super.getNode(entity.getXtbh(), "20", restype, gfxxlist));
		//nodes.append(super.getNode(entity.getXtbh(), "32", restype, qxlist));
		nodes.append(super.getNode(entity.getXtbh(), "33", restype, glpllist));
		nodes.append(super.getNode(entity.getXtbh(), "16", restype, gjtlist));
		return nodes.toString();
	}
}
