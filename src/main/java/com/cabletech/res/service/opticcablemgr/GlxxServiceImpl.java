package com.cabletech.res.service.opticcablemgr;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.cabletech.core.service.BaseServiceImpl;
import com.cabletech.res.entity.opticcablemgr.GlxxEntity;
import com.cabletech.res.mapper.opticcablemgr.GlxxMapper;


/**
 * 光缆信息管理
 * @author zhanglei 2011-05-11
 *
 */
@Service
public class GlxxServiceImpl extends BaseServiceImpl  implements GlxxService {
	
	@Resource(name = "glxxMapper")
	private GlxxMapper glxxmapper;
	

	/**
	 * 新增或更新光缆信息实体
	 * @param entity 光缆信息实体
	 */
	@Transactional
	public boolean saveorupdate(GlxxEntity entity){
		try{
			if(StringUtils.isNotBlank(entity.getXtbh())){
				glxxmapper.update(entity);
			}else{
				entity.setXtbh(super.getXTBH());
				glxxmapper.save(entity);
			}
			return true;
		}catch (Exception e) {
			logger.error("新增或更新光缆信息实体：",e);
			return false;
		}
	}
	
	/**
	 * 单条查看光缆信息信息
	 * @param xtbh 系统编号
	 * @return 单条光缆信息实体
	 */
	public GlxxEntity getbyid(String xtbh){
		return glxxmapper.getbyid(xtbh);
	}
	
	/**
	 * 光缆信息单条删除
	 * @param xtbh 系统编号
	 * @return boolean 删除成功或者失败
	 */
	public boolean delete(String xtbh){
		try {
			glxxmapper.deleteGlxx(xtbh);
			return true;
		} catch (Exception e) {
			logger.error("删除光缆信息：",e);
			return false;
		}
	}
	
	@Transactional
	@Override
	public boolean batchDelete(String xtbhs){
		String[] xtbh = xtbhs.split(",");
		try{
			for(int i=0; i<xtbh.length; i++){
				glxxmapper.deleteGlxx(xtbh[i]);
				glxxmapper.deleteGldly(xtbh[i]);
			}
			return true;
		}catch (Exception e) {
			logger.error("删除光缆：",e);
			return false;
		}
	}	
	
	/**
	 * 获取Ztree的结构数据
	 * @param entity 光缆信息实体
	 */
	@Override
	public String getTreeNodes(GlxxEntity entity){
		Map<String, Object> restype = super.getResourceType();
		StringBuffer nodes = new StringBuffer();
		List<Map<String, Object>> gldlylist = glxxmapper.getGldlyByGlxx(entity.getXtbh());
		nodes.append(super.getRootNode(entity.getXtbh(), entity.getZymc(),19));
		nodes.append(super.getNode(entity.getXtbh(), "15", restype, gldlylist));
		return nodes.toString();
	}
	
	@Override
	public boolean batchEdit(Map<String, Object> map){
		try{
			glxxmapper.batchEdit(map);
			return true;
		}catch (Exception e) {
			logger.error("编辑电杆：",e);
			return false;
		}
	}	
}
