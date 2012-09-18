package com.cabletech.res.action.cableequipmgr;

import java.io.PrintWriter;
import java.util.Map;
import javax.annotation.Resource;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import com.cabletech.baseinfo.business.entity.UserInfo;
import com.cabletech.core.action.BaseAction;
import com.cabletech.res.entity.cableequipmgr.GfxxEntity;
import com.cabletech.res.service.cableequipmgr.GfxxService;

/**
 * 光交资源-光分纤箱信息管理
 * 
 * @author 杨隽 2011-05-23 创建
 */
@SuppressWarnings("serial")
@Namespace("/res/cableequipmgr")
@Results({
		@Result(name = "frame", location = "/res/cableequipmgr/gfxx/gfxx_frame.jsp"),
		@Result(name = "input", location = "/res/cableequipmgr/gfxx/gfxx_input.jsp"),
		@Result(name = "view", location = "/res/cableequipmgr/gfxx/gfxx_view.jsp"),
		@Result(name = "query", location = "/res/cableequipmgr/gfxx/gfxx_query.jsp"),
		@Result(name = "list", location = "/res/cableequipmgr/gfxx/gfxx_list.jsp"),
		@Result(name = "edit", location = "/res/cableequipmgr/gfxx/gfxx_edit.jsp")})
@Action("gfxx")
public class GfxxAction extends BaseAction {
	private GfxxEntity entity;
	@Resource(name = "gfxxServiceImpl")
	private GfxxService gfxxService;

	@Override
	public String execute() {
		String xtbh = request.getParameter("xtbh");
		request.setAttribute("xtbh", xtbh);
		return "frame";
	}
 
	/**
	 * 光分纤箱信息保存修改
	 *  
	 * @return String
	 */
	public String save() {
		UserInfo user = (UserInfo)request.getSession().getAttribute("user");
		entity.setOrgid(user.getOrgId());
		String toPage;
		if(StringUtils.isNotBlank(entity.getXtbh())){
			toPage = "view";
		}else{
			toPage = "input";
		}		
		if(gfxxService.saveOrUpdate(entity)){
			setInfoMessage("保存成功!", toPage);
		}else{
			setInfoMessage("保存失败!", toPage);
		}
		request.setAttribute("entity", entity);
		return toPage;
	}

	/**
	 * 光分纤箱资源查询条件
	 * 
	 * @return String
	 */
	public String query() throws Exception {
		UserInfo user = (UserInfo)request.getSession().getAttribute("user");
		String condition = request.getQueryString();
		Map<String, Object> decodeCondtionMap = super.getDecodeCondtionMap(condition, user);
		request.setAttribute("searchCondition", decodeCondtionMap);
		return "query";
	}

	/**
	 * 光分纤箱资源查询结果
	 * 
	 * @return String
	 */
	public String list() throws Exception {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		String condition = entity.getSerializeQueryCondition();
		if (StringUtils.isBlank(condition)) {
			condition = request.getQueryString();
		}
		Map<String, Object> conditionMap = super.getDecodeCondtionMap(
				condition, user);
		Map<String, Object> map = null;
		String method = "queryGfxxListNoSimid";
		if (conditionMap.containsKey("simid") && StringUtils.isNotBlank(conditionMap.get("simid").toString())) {
			method = "queryGfxxList";
		}
		map = gfxxService.queryPageMap(method, conditionMap, super.getPage("page"), super.getLimit("rows"));		
		request.setAttribute("map", map);
		// 转换为列表参数
		request.setAttribute("condition", condition);
		return LIST;
	}

	/**
	 * 删除光分纤箱信息
	 * 
	 * @return String
	 */
	public String delete() throws Exception {
		String xtbh = request.getParameter("xtbh");
		gfxxService.delete(xtbh);
		return "query";
	}

	@Override
	protected void prepareViewModel() throws Exception {
		String xtbh = request.getParameter("xtbh");
		request.setAttribute("tipview", super.getParameterValue("tipview"));//tip 视图显示
		if (StringUtils.isNotBlank(xtbh)) {
			entity = gfxxService.view(xtbh);
			request.setAttribute("entity", entity);
		} else {
			entity = new GfxxEntity();
		}
	}

	@Override
	protected void prepareSaveModel() throws Exception {
		if (entity == null) {
			entity = new GfxxEntity();
		}
	}

	/**
	 * 获取资源关联树结点串
	 * @return 结点串
	 * @throws Exception
	 */
	public String getTreeNodes()throws Exception{
		prepareViewModel();
		response.setContentType("application/html;charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache");		
		PrintWriter out = response.getWriter();
		out.print(gfxxService.getTreeNodes(entity));
		out.flush();
		return null;
	}	
	
	/**
	 * 光分纤箱的批量逻辑删除
	 */
	public String batchDelete(){
		String xtbhs = request.getParameter("xtbhs");
		if(gfxxService.batchDelete(xtbhs)){
			super.outmessage("删除成功！");
		}else{
			super.outmessage("删除失败！");
		}
		return null;		
	}	
	
	/**
	 * 转向批量编辑页面
	 * @return
	 */	
	public String toBatchEditPage(){
		String xtbhs = request.getParameter("xtbhs");
		request.setAttribute("xtbhs", xtbhs);
		return "edit";
	}
	
	/**
	 * 批量编辑
	 * @return
	 */	
	public String batchEdit() throws Exception{
		String former = request.getQueryString();
		Map<String, Object> map = super.getSerializeForm(former);
		if(gfxxService.batchEdit(map)){
			super.outmessage("编辑成功！");
		}else{
			super.outmessage("编辑失败！");
		}
		return null;		
	}	
	
	@Override
	public GfxxEntity getModel() {
		if (entity == null) {
			entity = new GfxxEntity();
		}
		return entity;
	}
	
	/**
	 * 设置提示信息
	 * @param info 提示信息
	 * @param toPage 页面
	 */
	public void setInfoMessage(String info, String toPage){
		if(toPage.equals("input")){
			entity = new GfxxEntity();
		}
		entity.setActionMessage(info);		
	}	
}
