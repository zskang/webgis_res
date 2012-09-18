package com.cabletech.res.service.publicmgr;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cabletech.baseinfo.excel.ExportSupport;
import com.cabletech.core.service.BaseServiceImpl;
import com.cabletech.res.entity.publicmgr.TowerEntity;
import com.cabletech.res.mapper.publicmgr.TowerMapper;
import com.cabletech.res.service.common.MainTenceService;

/**
 * 铁塔
 * 
 * @author wangt
 * 
 */
@Service
public class TowerServiceImpl extends BaseServiceImpl implements TowerService,
		ExportSupport {

	@Resource(name = "towerMapper")
	private TowerMapper mapper;

	@Resource(name = "mainTenceServiceImpl")
	private MainTenceService service;

	private Map<String, Object> exportconditionmap = new HashMap<String, Object>();

	@Override
	public void setExportconditionmap(Map<String, Object> map) {
		exportconditionmap = map;
	}

	@Transactional
	@Override
	public boolean delete(String towerid) {
		try {
			service.delete(view(towerid).getSiteid(), "A37", "C33");
			mapper.delete(towerid);
			return true;
		} catch (Exception e) {
			logger.error("删除tower：", e);
			return false;
		}
	}

	@Transactional
	@Override
	public TowerEntity view(String towerid) {
		// TODO Auto-generated method stub
		return mapper.getbyid(towerid);
	}

	@Override
	@Transactional
	public boolean save(TowerEntity entity) {
		try {
			if (StringUtils.isNotBlank(entity.getTowerid())) {
				mapper.update(entity);
			} else {
				entity.setTowerid(super.getXTBH());
				mapper.save(entity);
			}
			service.save(entity.getSiteid(), "A25", "C31");
			return true;
		} catch (Exception e) {
			logger.error("新增或更新GroupCustomerEntity：", e);
			return false;
		}
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public List getExportDatas(Map<String, Object> paramet) {
		return mapper.queryTowerList(exportconditionmap);
	}
}
