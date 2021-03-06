package com.cabletech.res.service.basemgr;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.cabletech.core.service.BaseServiceImpl;
import com.cabletech.res.entity.basemgr.BsdxtEntity;
import com.cabletech.res.mapper.basemgr.BsdMapper;
import com.cabletech.res.mapper.basemgr.BsdxtMapper;

/**
 * 直埋段系统管理
 * @author zhanglei 2011-05-11
 *
 */
@Service
public class BsdxtServiceImpl extends BaseServiceImpl implements BsdxtService {
	
	@Resource(name = "bsdxtMapper")
	private BsdxtMapper bsdxtmapper;

	@Resource(name = "bsdMapper")
	private BsdMapper bsdmapper;
	
	/**
	 * 保存
	 * @param entity 直埋段系统实体
	 */
	@Transactional
	public boolean saveorupdate(BsdxtEntity entity){
		try{
			if(StringUtils.isNotBlank(entity.getXtbh())){
				bsdxtmapper.update(entity);
			}else{
				entity.setXtbh(super.getXTBH());
				bsdxtmapper.save(entity);
			}	
				return true;
			}catch (Exception e) {
				logger.error("新增或更新直埋段系统：",e);
				return false;
			}
	}
 	 
	/**
	 * 查看
	 * @param xtbh 系统编号
	 * @return 直埋段系统实体
	 */
	public BsdxtEntity getbyid(String xtbh){
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("xtbh",xtbh);
		String count=bsdxtmapper.getBsxxCountByBsdxt(map);
		BsdxtEntity g=bsdxtmapper.getbyid(xtbh);
		g.setBss(count);
		return g;
	}
	
	/**
	 * 直埋段系统单条删除
	 * @param xtbh 系统编号
	 * @return Boolean 删除成功或者失败
	 */
	public boolean delete(String xtbh){
		try {
			bsdxtmapper.delete(xtbh);
			bsdmapper.deleteSsbsxt(xtbh);
			return true;
		} catch (Exception e) {
			logger.error("删除直埋段系统：",e);
			return false;
		}
	}
	
	
	/**
	 * 获取Ztree的结构数据
	 * @param entity 标石段系统实体
	 */
	@Override
	public String getTreeNodes(BsdxtEntity entity){
		Map<String, Object> restype = super.getResourceType();
		StringBuffer nodes = new StringBuffer();
		List<Map<String, Object>> bsdlist = bsdxtmapper.getBsdByBsdxt(entity.getXtbh());
		List<Map<String, Object>> gldlylist = bsdxtmapper.getGldlyByBsdxt(entity.getXtbh());
		nodes.append(super.getRootNode(entity.getXtbh(), entity.getZymc(),11));
		nodes.append(super.getNode(entity.getXtbh(), "10", restype, bsdlist));
		nodes.append(super.getNode(entity.getXtbh(), "15", restype, gldlylist));
		return nodes.toString();
	}
	
	/**
	 * 直埋系统的批量逻辑删除
	 * @param xtbhs 直埋系统的系统编号
	 * @return true删除成功 false删除失败
	 */
	@Transactional
	public boolean batchDelete(String xtbhs){
		String[] xtbh = xtbhs.split(",");
		try{
			for(int i=0; i<xtbh.length; i++){
				bsdxtmapper.delete(xtbh[i]);
				bsdmapper.deleteSsbsxt(xtbh[i]);
			}
			return true;
		}catch (Exception e) {
			logger.error("删除直埋系统：",e);
			return false;
		}
	}
	
	/**
	 * 直埋系统批量编辑
	 * @param map 表单值
	 * @return
	 */
	public boolean batchEdit(Map<String, Object> map){
		try{
			bsdxtmapper.batchEdit(map);
			return true;
		}catch (Exception e) {
			logger.error("编辑直埋系统：",e);
			return false;
		}
	}	
}
