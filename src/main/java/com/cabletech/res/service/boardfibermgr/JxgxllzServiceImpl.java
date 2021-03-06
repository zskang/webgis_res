package com.cabletech.res.service.boardfibermgr;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.cabletech.core.service.BaseServiceImpl;
import com.cabletech.res.entity.boardfibermgr.JxgxllzEntity;
import com.cabletech.res.mapper.boardfibermgr.JxgxllMapper;
import com.cabletech.res.mapper.boardfibermgr.JxgxllzMapper;
import com.cabletech.res.mapper.boardfibermgr.JxgxlyMapper;
import com.cabletech.res.service.tracemgr.TraceService;

/**
 * 链路组Service实现
 * @author Administrator
 *
 */
@Service
public class JxgxllzServiceImpl extends BaseServiceImpl implements JxgxllzService {
	
	@Resource(name="jxgxllzMapper")
	private JxgxllzMapper llzmapper;
	
	@Resource(name="jxgxllMapper")
	private JxgxllMapper llmapper;
	
	@Resource(name="jxgxlyMapper")
	private JxgxlyMapper lymapper;
	
	@Resource(name="traceServiceImpl")
	private TraceService traceservice;

	@Resource(name="jxgxllServiceImpl")
	private JxgxllService jxgxllservice;	
	
	@Override
	public JxgxllzEntity getbyid(String id) {
		return llzmapper.getbyid(id);
	}

	@Override
	public List<Map<String, Object>> queryJxgxllzList(Map<String, Object> map) {
		return llzmapper.queryJxgxllzList(map);
	}
	
	@Transactional
	@Override
	public boolean delete(String id){
		try {
			llzmapper.delete(id);
			llmapper.deleteByllzid(id);
			lymapper.deleteByJxgxllzId(id);
			return true;
		} catch (Exception e) {
			logger.error("删除链路组：",e);
			return false;
		}
	}
	
	@Transactional
	@Override
	public boolean batchDelete(String id){
		try {
			String[] ids = id.split(",");
			for(int i=0; i<ids.length; i++){
				llzmapper.delete(ids[i]);
				llmapper.deleteByllzid(ids[i]);
				lymapper.deleteByJxgxllzId(ids[i]);
			}
			return true;
		} catch (Exception e) {
			logger.error("删除链路组：",e);
			return false;
		}		
	}
	
	@Transactional
	@Override
	public boolean saveorupdate(JxgxllzEntity entity){
		try{
			if(StringUtils.isNotBlank(entity.getId())){
				delete(entity.getId());
			}
			entity.setId(super.getXTBH());
			llzmapper.insert(entity);
			//查询出起始设备所有端子
			List<Map<String, Object>> dzlist = traceservice.getAlldzList(entity.getQssblx(), entity.getQssbid());
			//更新局向光纤路由表、局向光纤信息表
			if(dzlist != null && dzlist.size()>0){
				for(Map<String, Object> map: dzlist){
					String ssodm = map.get("SSODM")==null?"":map.get("SSODM").toString();
					String portname = map.get("PORTNAME")==null?"":map.get("PORTNAME").toString();
					jxgxllservice.addJxgxll(ssodm, portname, entity);
				}
			}
			return true;
		}catch(Exception e){
			logger.error("新增或更新链路组实体：",e);
			return false;			
		}
	}
}
