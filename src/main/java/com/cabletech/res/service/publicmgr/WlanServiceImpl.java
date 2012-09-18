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
import com.cabletech.res.entity.publicmgr.WlanEntity;
import com.cabletech.res.mapper.publicmgr.WlanMapper;
import com.cabletech.res.service.common.MainTenceService;

/** 
 *  
 * 
 */
@Service
public class WlanServiceImpl extends BaseServiceImpl implements WlanService,
		ExportSupport {

	@Resource(name = "wlanMapper")
	private WlanMapper wlanmapper;
	@Resource(name = "mainTenceServiceImpl")
	private MainTenceService mainTenceServiceImpl;

	private Map<String, Object> exportconditionmap = new HashMap<String, Object>();

	/**
	 * 保存
	 * 
	 * @param entity
	 *            WlanEntity
	 */
	@Transactional
	public boolean save(WlanEntity entity) {
		try {
			if (StringUtils.isNotBlank(entity.getId())) {
				entity.setId(entity.getId());
				wlanmapper.updateWlan(entity);
			} else {
				entity.setId(super.getXTBH());
				wlanmapper.saveWlan(entity);
			} 
			mainTenceServiceImpl.save(entity.getSiteId(), "A28", "C31");
			return true;
		} catch (Exception e) {
			logger.error("新增或更新Wlan信息：", e);
			return false;
		}
	}

	@Transactional(readOnly = true)
	public List<Map<String, Object>> queryWlanList(Map<String, Object> map)
			throws Exception {
		return wlanmapper.queryWlanList(map);
	}

	/**
	 * 查看
	 * 
	 * @param id
	 *            String 系统编号
	 * @return WlanEntity 站点实体
	 */
	@Transactional
	public WlanEntity view(String id) {
		return wlanmapper.getbyid4wlan(id);
	}

	/**
	 * 删除
	 * 
	 * @param id
	 *            String 系统编号
	 */
	@Transactional
	public boolean delete(String id) {
		try {
			mainTenceServiceImpl.delete(view(id).getSiteId(), "A28", "C32");
			wlanmapper.deleleWlan(id);
			return true;
		} catch (Exception e) {
			logger.error("删除站点：", e);
			return false;
		}
	}

	@Override
	@Transactional
	public boolean batchDelete(String ids) {
		String[] idsw = ids.split(",");
		try {
			for (int i = 0; i < idsw.length; i++) {
				mainTenceServiceImpl.delete(view(idsw[i]).getSiteId(), "A28",
						"C32");
				wlanmapper.deleleWlan(idsw[i]);
			}
			return true;
		} catch (Exception e) {
			logger.error("删除光分纤箱：", e);
			return false;
		}
	}

	@Override
	public void setExportconditionmap(Map<String, Object> map) {
		exportconditionmap = map;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public List getExportDatas(Map<String, Object> paramet) {
		return wlanmapper.queryWlanList(exportconditionmap);
	}
}
