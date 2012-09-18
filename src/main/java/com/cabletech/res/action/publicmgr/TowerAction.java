package com.cabletech.res.action.publicmgr;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import com.cabletech.baseinfo.business.entity.UserInfo;
import com.cabletech.core.action.BaseAction;
import com.cabletech.res.entity.publicmgr.TowerEntity;
import com.cabletech.res.service.publicmgr.TowerService;

/**
 * 铁塔
 * 
 * @author zg
 * 
 */
@Namespace("/res/publicmgr")
@Results({
		@Result(name = "input", location = "/res/publicmgr/tower/tower_input.jsp"),
		@Result(name = "frame", location = "/res/publicmgr/tower/tower_frame.jsp"),
		@Result(name = "view", location = "/res/publicmgr/tower/tower_view.jsp"),
		@Result(name = "list", location = "/res/publicmgr/tower/tower_list.jsp"), })
@Action("tower")
public class TowerAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	private TowerEntity entity;
	/**
	 * 业务类
	 */
	@Resource(name = "towerServiceImpl")
	private TowerService service;

	/**
	 * NodeB保存信息
	 * 
	 */
	public String save() {
		String url = "/res/publicmgr/tower!list.action?";
		if (service.save(entity)) {
			super.addMessage("保存成功!", url, INFO_SUCCESS_LEVEL);
		} else {
			super.addMessage("保存失败!", url, INFO_ERROR_LEVEL);
		}
		return SUCCESS;
	}

	@Override
	public String execute() {
		String towerid = request.getParameter("towerid");// 获取资源id
		request.setAttribute("towerid", towerid);
		return "frame";
	}

	/**
	 * 删除
	 * 
	 * @return
	 * @throws Exception
	 */
	public String delete() throws Exception {
		String url = "/res/publicmgr/tower!list.action?";
		String towerid = request.getParameter("towerid");
		if (service.delete(towerid)) {
			super.addMessage("删除成功！", url, INFO_SUCCESS_LEVEL);
		} else {
			super.addMessage("删除失败！", url, INFO_ERROR_LEVEL);
		}
		return SUCCESS;
	}

	/**
	 * 列表页面
	 * 
	 * @return
	 * @throws Exception
	 */
	public String list() throws Exception {
		/*UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		String condition = request.getQueryString();
		Map<String, Object> decodeCondtionMap = super.getDecodeCondtionMap(
				condition, user);
		request.setAttribute("searchCondition", decodeCondtionMap);*/
		return "list";
	}

	/**
	 * 原始输入表单
	 */
	@Override
	public String input() throws Exception {
		return INPUT;
	}

	/**
	 * 查询列表的数据
	 * 
	 * @throws Exception
	 */
	public void listdata() throws Exception {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		String condition = entity.getSerializeQueryCondition();
		if (StringUtils.isBlank(condition)) {
			condition = request.getQueryString();
		}
		Map<String, Object> conditionMap = super.getDecodeCondtionMap(
				condition, user);
		service.setExportconditionmap(conditionMap);
		Map<String, Object> map = null;
		map = service.queryPageMap("queryTowerList", conditionMap,
				super.getPage(), super.getLimit());
		super.convertpagemaptojson(map);
	}

	@Override
	public Object getModel() {
		if (entity == null) {
			entity = new TowerEntity();
		}
		return entity;
	}

	@Override
	protected void prepareViewModel() throws Exception {
		String towerid = request.getParameter("towerid");// 获取资源id
		if (StringUtils.isNotBlank(towerid)) {
			TowerEntity entity = service.view(towerid);
			request.setAttribute("entity", entity);
		} else {
			entity = new TowerEntity();
		}
	}

	@Override
	protected void prepareSaveModel() throws Exception {
		if (entity == null) {
			entity = new TowerEntity();
		}

	}

}
