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
import com.cabletech.res.entity.publicmgr.NodeBEntity;
import com.cabletech.res.service.publicmgr.NodeBService;

/**
 * NodeB Action
 * 
 * @author ZG
 * 
 */
@Namespace("/res/publicmgr")
@Results({
		@Result(name = "input", location = "/res/publicmgr/nodeb/nodeb_input.jsp"),
		@Result(name = "input4nbsp", location = "/res/publicmgr/nodeb/nodeb_input_nbsp.jsp"),
		@Result(name = "frame", location = "/res/publicmgr/nodeb/nodeb_frame.jsp"),
		@Result(name = "view", location = "/res/publicmgr/nodeb/nodeb_view.jsp"),
		@Result(name = "list", location = "/res/publicmgr/nodeb/nodeb_list.jsp"), })
@Action("nodeb")
public class NodeBAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	private NodeBEntity entity;

	/**
	 * 业务类
	 */
	@Resource(name = "nodeBServiceImpl")
	private NodeBService service;

	/**
	 * NodeB保存信息
	 * 
	 */
	public String save() {
		String url = "/res/publicmgr/nodeb!list.action?";
		entity.setBand(request.getParameter("band"));// entity带不过来band，只好加了这一句，若找到了原因，就可删掉了
		if (service.save(entity)) {
			super.addMessage("保存成功!", url, INFO_SUCCESS_LEVEL);
		} else {
			super.addMessage("保存失败!", url, INFO_ERROR_LEVEL);
		}
		request.setAttribute("entity", entity);
		return SUCCESS;
	}

	@Override
	public String execute() {
		String nodeid = request.getParameter("nodeid");// 获取资源id
		request.setAttribute("nodeid", nodeid);
		return "frame";
	}

	@Override
	public String view() {
		return VIEW;
	}

	/**
	 * 删除
	 * 
	 * @return
	 * @throws Exception
	 */
	public String delete() throws Exception {
		String nodeid = request.getParameter("nodeid");
		String url = "/res/publicmgr/nodeb!list.action?";
		if (service.delete(nodeid)) {
			super.addMessage("删除成功！", url, INFO_SUCCESS_LEVEL);
		} else {
			super.addMessage("删除失败！", url, INFO_ERROR_LEVEL);
		}
		return SUCCESS;
	}

	/**
	 * NodeB 列表页面
	 * 
	 * @return
	 * @throws Exception
	 */
	public String list() throws Exception {
		return "list";
	}

	@Override
	public String input() throws Exception {
		return "input";
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
		map = service.queryPageMap("queryNodeBList", conditionMap,
				super.getPage(), super.getLimit());
		super.convertpagemaptojson(map);
	}

	@Override
	public Object getModel() {
		if (entity == null) {
			entity = new NodeBEntity();
		}
		return entity;
	}

	@Override
	protected void prepareViewModel() throws Exception {
		String nodeid = request.getParameter("nodeid");// 获取资源id
		if (StringUtils.isNotBlank(nodeid)) {
			NodeBEntity entity = service.view(nodeid);
			request.setAttribute("entity", entity);
		} else {
			entity = new NodeBEntity();
		}
	}

	@Override
	protected void prepareSaveModel() throws Exception {
		if (entity == null) {
			entity = new NodeBEntity();
		}

	}

}
