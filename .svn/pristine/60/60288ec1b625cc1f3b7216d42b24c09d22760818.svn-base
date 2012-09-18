package com.cabletech.res.action.basemgr;

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
import com.cabletech.res.entity.basemgr.GqdxtEntity;
import com.cabletech.res.service.basemgr.GqdxtService;

/**
 * 承载层-挂墙段系统管理
 * 
 * @author zhanglei 2011-05-11
 */
@SuppressWarnings("serial")
@Namespace("/res/basemgr")
@Results({
	@Result(name = "frame", location = "/res/basemgr/gqdxt/gqdxt_frame.jsp"),
	@Result(name = "input", location = "/res/basemgr/gqdxt/gqdxt_input.jsp"),
	@Result(name = "view", location = "/res/basemgr/gqdxt/gqdxt_view.jsp"),
	@Result(name = "query", location = "/res/basemgr/gqdxt/gqdxt_query.jsp"),
	@Result(name = "list", location = "/res/basemgr/gqdxt/gqdxt_list.jsp"),
	@Result(name = "edit", location = "/res/basemgr/gqdxt/gqdxt_edit.jsp")
})
@Action("gqdxt")
public class GqdxtAction extends BaseAction {
	
	private GqdxtEntity entity;//挂墙段系统实体
	
	@Resource(name = "gqdxtServiceImpl")
	private GqdxtService gqdxtservice;
	
	/**
	 * 挂墙段系统查看详细
	 * @return
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
		if(gqdxtservice.saveorupdate(entity)){
			setInfoMessage("保存成功!", toPage);
		}else{
			setInfoMessage("保存失败!", toPage);
		}
		request.setAttribute("entity", entity);
		return toPage;
	}
	
	@Override
	public String execute() {
		String xtbh = request.getParameter("xtbh");//获取资源xtbh
		request.setAttribute("xtbh", xtbh);
		return "frame";
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
		out.print(gqdxtservice.getTreeNodes(entity));
		out.flush();
		return null;
	}
	
	@Override
	protected void prepareViewModel() throws Exception {
		String xtbh = request.getParameter("xtbh");//获取资源xtbh
		request.setAttribute("tipview", super.getParameterValue("tipview"));//tip 视图显示
		if (StringUtils.isNotBlank(xtbh)) {
			entity = gqdxtservice.getbyid(xtbh);
			request.setAttribute("entity", entity);
		} else {
			entity = new GqdxtEntity();
		}
	}

	/**
	 * 挂墙段系统查询条件
	 * @throws Exception 
	 */
	public String query() throws Exception {
		UserInfo user = (UserInfo)request.getSession().getAttribute("user");
		String condition = request.getQueryString();
		Map<String, Object> decodeCondtionMap = super.getDecodeCondtionMap(condition, user);
		request.setAttribute("map", decodeCondtionMap);
		return "query";
	}
 	
	/**
	 * 删除
	 * @return
	 * @throws Exception
	 */
	public String delete()throws Exception{
		String xtbh = entity.getXtbh();
		if(gqdxtservice.delete(xtbh)){
			super.outmessage("删除成功！");
		}else{
			super.outmessage("删除失败！");
		}
		return null;
	}
	
	/**
	 * 挂墙段系统查询结果
	 * @throws Exception 
	 */
	public String list() throws Exception {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		String condition = entity.getSerializeQueryCondition();
		if (StringUtils.isBlank(condition)) {
			condition = request.getQueryString();
		}
		Map<String, Object> conditionMap = super.getDecodeCondtionMap(condition, user);
		Map<String, Object> json = gqdxtservice.queryPageMap("queryGqdxtList",conditionMap, super.getPage("page"), super.getLimit("rows"));
		request.setAttribute("map", json);
		// 转换为列表参数
		request.setAttribute("condition", condition);
		return "list";
	}
	
	/**
	 * 挂墙系统的批量逻辑删除
	 */
	public String batchDelete(){
		String xtbhs = request.getParameter("xtbhs");
		if(gqdxtservice.batchDelete(xtbhs)){
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
		if(gqdxtservice.batchEdit(map)){
			super.outmessage("编辑成功！");
		}else{
			super.outmessage("编辑失败！");
		}
		return null;		
	} 
	
	@Override
	protected void prepareSaveModel() throws Exception {
		if(entity == null){
			entity = new GqdxtEntity();
		}
	}

	@Override
	public GqdxtEntity getModel() {
		if(entity == null){
			entity = new GqdxtEntity();
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
			entity = new GqdxtEntity();
		}
		entity.setActionMessage(info);		
	}	
}
