package com.cabletech.res.action.publicmgr;

import java.io.PrintWriter;
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
import com.cabletech.res.entity.publicmgr.JfxxEntity;
import com.cabletech.res.entity.publicmgr.NodeBEntity;
import com.cabletech.res.service.publicmgr.JfxxService;

/**
 * 承载层-机房信息管理
 * 
 * @author 周刚 2012-07-12
 */
@SuppressWarnings("serial")
@Namespace("/res/publicmgr")
@Results({
		@Result(name = "frame", location = "/res/publicmgr/jfxx/jfxx_frame.jsp"),
		@Result(name = "input", location = "/res/publicmgr/jfxx/jfxx_input.jsp"),
		@Result(name = "input4nbsp", location = "/res/publicmgr/jfxx/jfxx_input_nbsp.jsp"),
		@Result(name = "view", location = "/res/publicmgr/jfxx/jfxx_view.jsp"),
		@Result(name = "query", location = "/res/publicmgr/jfxx/jfxx_query.jsp"),
		@Result(name = "list", location = "/res/publicmgr/jfxx/jfxx_list.jsp"),
		@Result(name = "list_dwzh", location = "/res/publicmgr/jfxx/jfxx_list_dwzh.jsp"),
		@Result(name = "edit", location = "/res/publicmgr/jfxx/jfxx_edit.jsp") })
@Action("jfxx")
public class JfxxAction extends BaseAction {

	private JfxxEntity entity;
	private JfxxEntity jfxxEntity = new JfxxEntity();

	/**
	 * 业务类
	 */
	@Resource(name = "jfxxServiceImpl")
	private JfxxService jfxxservice;

	@Override
	public String view() throws Exception {
		prepareViewModel();
		return VIEW;
	}

	@Override
	public String input() throws Exception {
		prepareViewModel();
		return INPUT;
	}

	/**
	 * 机房查询
	 * 
	 */
	public String query() throws Exception {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		String condition = request.getQueryString();
		Map<String, Object> decodeCondtionMap = super.getDecodeCondtionMap(
				condition, user);
		request.setAttribute("searchCondition", decodeCondtionMap);
		return "query";
	}

	@Override
	public String execute() {
		String resId = request.getParameter("resId");// 获取资源id
		request.setAttribute("resId", resId);
		return "frame";
	}

	/**
	 * 代维综合系统使用的列表
	 * 
	 * @return str
	 */
	public String listDwzh() {
		return "list_dwzh";
	}

	/**
	 * 机房资源查询结果
	 */
	public String list() throws Exception {

		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		String condition = entity.getSerializeQueryCondition();
		if (StringUtils.isBlank(condition)) {
			condition = request.getQueryString();
		}
		Map<String, Object> conditionMap = super.getDecodeCondtionMap(
				condition, user);
		jfxxservice.setExportconditionmap(conditionMap);
		Map<String, Object> map = null;
		String method = "queryJfxxList";
		if (conditionMap.containsKey("simid")
				&& StringUtils.isNotBlank(conditionMap.get("simid").toString())) {
			method = "queryJfxxListWithSimid";
		}
		map = jfxxservice.queryPageMap(method, conditionMap,
				super.getPage("page"), super.getLimit("rows"));
		request.setAttribute("map", map); // 转换为列表参数
		request.setAttribute("condition", condition);

		return LIST;
	}

	/**
	 * 列表数据
	 * 
	 */
	public void listdata() {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");// 获取当前用户
		preSetjfListQuery(jfxxEntity, user);
		String condition = jfxxEntity.getSerializeQueryCondition();
		logger.info(condition);
		if (StringUtils.isBlank(condition)) {
			condition = request.getQueryString();
		}
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		try {
			conditionMap = super.getDecodeCondtionMap(condition, user);
			String mapper = "";
			if (user.isMobile()) {
				mapper = "getJfListYD";
			}
			if (user.isContractor()) {
				mapper = "getJfListDW";
			}
			jfxxservice.setExportconditionmap(conditionMap);
			Map<String, Object> map = jfxxservice.queryPageMap(mapper,
					conditionMap, super.getPage(), super.getLimit());
			convertpagemaptojson(map);
		} catch (Exception e) {
		}

	}

	/**
	 * 重新组装查询语句
	 * 
	 * @param queryentity
	 *            查询实体
	 * @param user
	 *            用户对象
	 */
	private void preSetjfListQuery(JfxxEntity queryentity, UserInfo user) {
		queryentity.setLoginUser(user);
	}

	/**
	 * 机房资源保存信息
	 */
	public String save() {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		entity.setOrgid(user.getOrgId());
		String toPage;
		if (StringUtils.isNotBlank(entity.getXtbh())) {
			toPage = "view";
		} else {
			toPage = "input";
		}
		if (jfxxservice.saveorupdate(entity)) {
			if (toPage.equals("input")) {
				entity = new JfxxEntity();
				entity.setActionMessage("新增成功!");
			}
		} else {
			entity = new JfxxEntity();
			entity.setActionMessage("新增失败!");
		}
		request.setAttribute("entity", entity);
		return toPage;
	}

	/**
	 * 机房资源保存信息（用于代维综合系统）
	 */
	public String saveDwzh() {
		String url = "/res/publicmgr/jfxx!listDwzh.action?";
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		entity.setOrgid(user.getOrgId());
		if (jfxxservice.saveorupdate(entity)) {
			super.addMessage("保存成功!", url, INFO_SUCCESS_LEVEL);
		} else {
			super.addMessage("保存失败!", url, INFO_ERROR_LEVEL);
		}
		return SUCCESS;
	}

	@Override
	protected void prepareViewModel() throws Exception {
		String xtbh = request.getParameter("xtbh");// 获取资源id
		request.setAttribute("tipview", super.getParameterValue("tipview"));// tip
																			// 视图显示
		if (StringUtils.isNotBlank(xtbh)) {
			entity = jfxxservice.getbyid(xtbh);
			request.setAttribute("entity", entity);
		} else {
			entity = new JfxxEntity();
		}
	}

	@Override
	protected void prepareSaveModel() throws Exception {
		if (entity == null) {
			entity = new JfxxEntity();
		}
	}

	/**
	 * 获取资源关联树结点串
	 * 
	 * @return 结点串
	 * @throws Exception
	 */
	public String getTreeNodes() throws Exception {
		prepareViewModel();
		response.setContentType("application/html;charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		PrintWriter out = response.getWriter();
		out.print(jfxxservice.getTreeNodes(entity));
		out.flush();
		return null;
	}

	@Override
	public JfxxEntity getModel() {
		if (entity == null) {
			entity = new JfxxEntity();
		}
		return entity;
	}

	/**
	 * 删除
	 * 
	 * @return
	 * @throws Exception
	 */
	public String delete() throws Exception {
		prepareViewModel();
		if (jfxxservice.delete(entity)) {
			super.outmessage("删除成功！");
		} else {
			super.outmessage("删除失败！");
		}
		return null;
	}

	/**
	 * 删除（用于代维综合系统）
	 * 
	 * @return
	 * @throws Exception
	 */
	public String deleteDwzh() throws Exception {
		String url = "/res/publicmgr/jfxx!listDwzh.action";
		if (jfxxservice.deleteDwzh(entity)) {
			super.addMessage("删除成功！", url, INFO_SUCCESS_LEVEL);
		} else {
			super.addMessage("删除失败！", url, INFO_ERROR_LEVEL);
		}
		return SUCCESS;
	}

	/**
	 * 机房的批量逻辑删除
	 */
	public String batchDelete() {
		String xtbhs = request.getParameter("xtbhs");
		if (jfxxservice.batchDelete(xtbhs)) {
			super.outmessage("删除成功！");
		} else {
			super.outmessage("删除失败！");
		}
		return null;
	}

	/**
	 * 转向批量编辑页面
	 * 
	 * @return
	 */
	public String toBatchEditPage() {
		String xtbhs = request.getParameter("xtbhs");
		request.setAttribute("xtbhs", xtbhs);
		return "edit";
	}

	/**
	 * 批量编辑
	 * 
	 * @return
	 */
	public String batchEdit() throws Exception {
		String former = request.getQueryString();
		Map<String, Object> map = super.getSerializeForm(former);
		if (jfxxservice.batchEdit(map)) {
			super.outmessage("编辑成功！");
		} else {
			super.outmessage("编辑失败！");
		}
		return null;
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
			entity = new JfxxEntity();
		}
		entity.setActionMessage(info);
	}
}
