package com.cabletech.res.service.basemgr;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.cabletech.core.service.BaseServiceImpl;
import com.cabletech.res.entity.basemgr.YsxtEntity;
import com.cabletech.res.mapper.basemgr.YsMapper;
import com.cabletech.res.mapper.basemgr.YsxtMapper;


/**
 * 引上段系统管理
 * @author zhanglei 2011-05-11
 *
 */
@Service
public class YsxtServiceImpl extends BaseServiceImpl  implements YsxtService {
	
	@Resource(name = "ysxtMapper")
	private YsxtMapper ysxtmapper;
	
	@Resource(name = "ysMapper")
	private YsMapper ysmapper;

	/**
	 * 新增或更新引上段系统实体
	 * @param entity 引上段系统实体
	 */
	@Transactional
	public boolean saveorupdate(YsxtEntity entity){
		try{
			if(StringUtils.isNotBlank(entity.getXtbh())){
				ysxtmapper.update(entity);
			}else{
				entity.setXtbh(super.getXTBH());
				ysxtmapper.save(entity);
			}
			return true;
		}catch (Exception e) {
			logger.error("新增或更新引上段系统实体：",e);
			return false;
		}
	}
	
	/**
	 * 单条查看引上段系统
	 * @param xtbh 系统编号
	 * @return 单条引上段系统实体
	 */
	public YsxtEntity getbyid(String xtbh){
		return ysxtmapper.getbyid(xtbh);
	}
	
	/**
	 * 引上段系统单条删除
	 * @param xtbh 系统编号
	 * @return boolean 删除成功或者失败
	 */
	public boolean delete(String xtbh){
		try {
			ysxtmapper.deleteYsxt(xtbh);
			ysmapper.deleteSsysxt(xtbh);
			return true;
		} catch (Exception e) {
			logger.error("删除引上段系统：",e);
			return false;
		}
	}
	
	/**
	 * 获取资源相关结点串
	 * @param entity 引上系统实体
	 * @return
	 */
	public String getTreeNodes(YsxtEntity entity){
		Map<String, Object> restype = super.getResourceType();
		StringBuffer nodes = new StringBuffer();
		List<Map<String, Object>> gldlylist = ysxtmapper.getGldlyByYsxtbh(entity.getXtbh());
		List<Map<String, Object>> yslist = ysxtmapper.getYsByYsxtbh(entity.getXtbh());
		nodes.append(super.getRootNode(entity.getXtbh(), entity.getZymc(), 2));
		nodes.append(super.getNode(entity.getXtbh(), "15", restype, gldlylist));
		nodes.append(super.getNode(entity.getXtbh(), "1", restype, yslist));
		return nodes.toString();
	}
	
	/**
	 * 引上系统的批量逻辑删除
	 * @param xtbhs 引上系统的系统编号
	 * @return true删除成功 false删除失败
	 */
	@Transactional
	public boolean batchDelete(String xtbhs){
		String[] xtbh = xtbhs.split(",");
		try{
			for(int i=0; i<xtbh.length; i++){
				ysxtmapper.deleteYsxt(xtbh[i]);
				ysmapper.deleteSsysxt(xtbh[i]);
			}
			return true;
		}catch (Exception e) {
			logger.error("删除引上系统：",e);
			return false;
		}
	}
	
	/**
	 * 引上系统批量编辑
	 * @param map 表单值
	 * @return
	 */
	public boolean batchEdit(Map<String, Object> map){
		try{
			ysxtmapper.batchEdit(map);
			return true;
		}catch (Exception e) {
			logger.error("编辑引上系统：",e);
			return false;
		}
	}	
}
