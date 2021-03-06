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
import com.cabletech.res.entity.publicmgr.PrepeaterEntity;
import com.cabletech.res.mapper.publicmgr.PrepeaterMapper;
import com.cabletech.res.service.common.MainTenceService;

/**
 * 
 * @author 周刚 2012 07 17
 * 
 */
@Service
public class PrepeaterServiceImpl extends BaseServiceImpl implements
		PrepeaterService, ExportSupport {
	@Resource(name = "prepeaterMapper")
	private PrepeaterMapper prepeatermapper;
	private Map<String, Object> exportconditionmap = new HashMap<String, Object>();

	@Resource(name = "mainTenceServiceImpl")
	private MainTenceService mainTenceServiceImpl;

	@Transactional(readOnly = true)
	public List<Map<String, Object>> queryPrepeaterList(Map<String, Object> map)
			throws Exception {
		return prepeatermapper.queryPrepeaterList(map);
	}

	/**
	 * 保存
	 * 
	 * @param entity
	 */
	@Transactional
	public boolean save(PrepeaterEntity entity) {
		try {
			if (StringUtils.isNotBlank(entity.getPrepeaterId())) {
				prepeatermapper.updateEntity(entity);
			} else {
				entity.setPrepeaterId(super.getXTBH());
				prepeatermapper.saveEntity(entity);
			}
			mainTenceServiceImpl.save(entity.getSiteId(), "A27", "C31");
			return true;
		} catch (Exception e) {
			logger.error("新增或更新 信息：", e);
			return false;
		}
	}

	/**
	 * 查看
	 * 
	 * @param id
	 *            String 系统编号
	 */
	public PrepeaterEntity view(String id) {
		return prepeatermapper.getbyid4pre(id);
	}

	/**
	 * 删除
	 * 
	 * @param id
	 *            String id
	 */
	@Transactional
	public boolean delete(String id) {
		try {
			mainTenceServiceImpl.delete(view(id)
					.getSiteId(), "A27", "C32");
			prepeatermapper.deleteEntity(id);
			return true;
		} catch (Exception e) {
			logger.error("删除直放站錯誤：", e);
			return false;
		}
	}

	@Override
	@Transactional
	public boolean batchDelete(String ids) {
		String[] id = ids.split(",");
		try {
			for (int i = 0; i < id.length; i++) {
				mainTenceServiceImpl.delete(view(id[i])
						.getSiteId(), "A27", "C32");
				prepeatermapper.deleteEntity(id[i]);
			}
			return true;
		} catch (Exception e) {
			logger.error("删除光分纤箱：", e);
			return false;
		}
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public List getExportDatas(Map<String, Object> paramet) {
		return prepeatermapper.queryPrepeaterList(exportconditionmap);
	}

	@Override
	public void setExportconditionmap(Map<String, Object> conditionMap) {
		exportconditionmap = conditionMap;
	}
}
