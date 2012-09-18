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
import com.cabletech.res.entity.publicmgr.BTSSiteEntity;
import com.cabletech.res.service.publicmgr.BTSSiteService;

/**
 * BTSSite Action
 * 
 * @author wangt
 * @update zg
 */
@Namespace("/res/publicmgr")
@Results({
		@Result(name = "input", location = "/res/publicmgr/btssite/btssite_input.jsp"),
		@Result(name = "frame", location = "/res/publicmgr/btssite/btssite_frame.jsp"),
		@Result(name = "view", location = "/res/publicmgr/btssite/btssite_view.jsp"),
		@Result(name = "list", location = "/res/publicmgr/btssite/btssite_list.jsp"), })
@Action("btssite")
public class BTSSiteAction extends BaseAction {

	/**
	 * 序列
	 */
	private static final long serialVersionUID = 1L;
	private BTSSiteEntity entity;
	/**
	 * 业务类
	 */
	@Resource(name = "BTSSiteServiceImpl")
	private BTSSiteService service;

	/**
	 * BTSSite 列表页面
	 * 
	 * @return
	 * @throws Exception
	 */
	public String list() throws Exception {
		return LIST;
	}

	/**
	 * 保存信息
	 * 
	 * @return
	 */
	public String save() {
		String url = "/res/publicmgr/btssite!list.action?";
		entity.setBand(request.getParameter("band"));// entity带不过来band，只好加了这一句，若找到了原因，就可删掉了
		if (service.save(entity)) {
			super.addMessage("保存成功!", url, INFO_SUCCESS_LEVEL);
		} else {
			super.addMessage("保存失败!", url, INFO_ERROR_LEVEL);
		}
		return SUCCESS;
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
		request.setAttribute("searchCondition", conditionMap);
		Map<String, Object> map = null;
		map = service.queryPageMap("queryBTSSiteList", conditionMap,
				super.getPage(), super.getLimit());
		super.convertpagemaptojson(map);
	}

	@Override
	public Object getModel() {
		if (entity == null) {
			entity = new BTSSiteEntity();
		}
		return entity;
	}

	@Override
	public String execute() {
		String btssiteid = request.getParameter("btssiteid");// 获取资源id
		request.setAttribute("btssiteid", btssiteid);
		return "frame";
	}

	@Override
	public String view() {
		return VIEW;
	}

	/**
	 * 删除
	 * 
	 * @return NULL
	 * @throws Exception
	 */
	public String delete() throws Exception {
		String btssiteid = request.getParameter("btssiteid");
		String url = "/res/publicmgr/btssite!list.action?";
		if (service.delete(btssiteid)) {
			super.addMessage("删除成功！", url, INFO_SUCCESS_LEVEL);
		} else {
			super.addMessage("删除失败！", url, INFO_ERROR_LEVEL);
		}
		return SUCCESS;
	}

	@Override
	protected void prepareViewModel() throws Exception {
		String btssiteid = request.getParameter("btssiteid");// 获取资源id
		if (StringUtils.isNotBlank(btssiteid)) {
			BTSSiteEntity entity = service.view(btssiteid);
			request.setAttribute("entity", entity);
		} else {
			entity = new BTSSiteEntity();
		}
	}

	@Override
	protected void prepareSaveModel() throws Exception {
		if (entity == null) {
			entity = new BTSSiteEntity();
		}
	}

	@Override
	public String input() {
		return INPUT;
	}

}
