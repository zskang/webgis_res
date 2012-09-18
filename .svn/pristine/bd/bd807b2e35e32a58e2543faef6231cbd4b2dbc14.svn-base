package com.cabletech.res.action.publicmgr;

import java.util.HashMap;
import java.util.Map;
import javax.annotation.Resource;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import com.cabletech.baseinfo.business.entity.UserInfo;
import com.cabletech.core.action.BaseAction;
import com.cabletech.res.entity.publicmgr.PrepeaterEntity;
import com.cabletech.res.entity.publicmgr.ZdxxEntity;
import com.cabletech.res.service.publicmgr.PrepeaterService;
import com.cabletech.res.service.publicmgr.ZdxxService;

/**
 * 公共资源-直放站信息管理
 * 
 * @author 周刚 2012-07-12
 */
@SuppressWarnings("serial")
@Namespace("/res/publicmgr")
@Results({
		@Result(name = "input", location = "/res/publicmgr/prepeater/prepeater_input.jsp"),
		@Result(name = "input4nbsp", location = "/res/publicmgr/prepeater/prepeater_input_nbsp.jsp"),
		@Result(name = "view", location = "/res/publicmgr/prepeater/prepeater_view.jsp"),
		@Result(name = "list", location = "/res/publicmgr/prepeater/prepeater_list_dwzh.jsp") })
@Action("prepeater")
public class PrepeaterAction extends BaseAction {
	private PrepeaterEntity entity;
	private PrepeaterEntity queryentity = new PrepeaterEntity();
	/**
	 * 业务类
	 */
	@Resource(name = "prepeaterServiceImpl")
	private PrepeaterService prepeaterService;
	/**
	 * 站点业务类
	 */
	@Resource(name = "zdxxServiceImpl")
	private ZdxxService zdxxService;

	@Override
	public String execute() {
		return "frame";
	}

	@Override
	public String view() throws Exception {
		prepareViewModel();
		return VIEW;
	}

	/*
	 * 进入表单页面
	 * 
	 * @see com.cabletech.core.action.BaseAction#input()
	 */
	@Override
	public String input() throws Exception {
		prepareViewModel();
		return INPUT;
	}

	/**
	 * 资源保存
	 * 
	 * @return String
	 */
	public String save() {
		String url = "/res/publicmgr/prepeater!list.action?";
		try {
			if (prepeaterService.save(entity)) {
				super.addMessage("保存成功!", url, INFO_SUCCESS_LEVEL);
			} else {
				super.addMessage("保存失败!", url, INFO_ERROR_LEVEL);
			}
		} catch (Exception e) {
		}
		return SUCCESS;
	}

	/**
	 * 列表数据
	 */
	public void listData() {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");// 获取当前用户
		String condition = queryentity.getSerializeQueryCondition();
		if (StringUtils.isBlank(condition)) {
			condition = request.getQueryString();
		}
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		try {
			conditionMap = super.getDecodeCondtionMap(condition, user);
			Map<String, Object> map = prepeaterService.queryPageMap(
					"queryPrepeaterList", conditionMap, super.getPage(),
					super.getLimit());
			prepeaterService.setExportconditionmap(conditionMap);
			convertpagemaptojson(map);
		} catch (Exception e) {

		}
		request.setAttribute("condition", condition);

	}

	/**
	 * 资源查询结果
	 * 
	 * @return String
	 */
	public String list() throws Exception {
		return LIST;
	}

	/**
	 * 删除站点信息
	 * 
	 * @return String
	 */
	public String delete() throws Exception {
		String url = "/res/publicmgr/prepeater!list.action?";
		String prepeaterId = entity.getPrepeaterId();
		if (prepeaterService.delete(prepeaterId)) {
			super.addMessage("删除成功!", url, INFO_SUCCESS_LEVEL);
		} else {
			super.addMessage("删除失败!", url, INFO_ERROR_LEVEL);
		}
		return SUCCESS;
	}

	@Override
	protected void prepareViewModel() throws Exception {
		String prepeaterId = request.getParameter("prepeaterId");
		if (StringUtils.isNotBlank(prepeaterId)) {
			entity = prepeaterService.view(prepeaterId);
			request.setAttribute("entity", entity);
		} else {
			entity = new PrepeaterEntity();
		}
	}

	/**
	 * 批量删除
	 */
	public String batchDelete() {
		String ids = request.getParameter("ids");
		try {
			if (prepeaterService.batchDelete(ids)) {
				super.outmessage("删除成功！");
			} else {
				super.outmessage("删除失败！");
			}
		} catch (Exception e) {

		}
		return null;
	}

	@Override
	protected void prepareSaveModel() throws Exception {
		if (entity == null) {
			entity = new PrepeaterEntity();
		}
	}

	@Override
	public PrepeaterEntity getModel() {
		if (entity == null) {
			entity = new PrepeaterEntity();
		}
		return entity;
	}

	/**
	 * 设置提示信息
	 * 
	 * @param info
	 *            提示信息
	 * @param toPage
	 *            页面
	 */
	public void setInfoMessage(String info, String toPage) {
		if (toPage.equals("input")) {
			entity = new PrepeaterEntity();
		}
		entity.setActionMessage(info);
	}
}
