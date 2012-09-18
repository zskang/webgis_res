package com.cabletech.res.action.basemgr;

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
import com.cabletech.res.entity.basemgr.GddEntity;
import com.cabletech.res.service.basemgr.GddService;

/**
 * 承载层-管道段管理
 * @author
 */
@SuppressWarnings("serial")
@Namespace("/res/basemgr")
@Results({
	@Result(name = "frame", location = "/res/basemgr/gdd/gdd_frame.jsp"),
	@Result(name = "input", location = "/res/basemgr/gdd/gdd_input.jsp"),
	@Result(name = "view", location = "/res/basemgr/gdd/gdd_view.jsp"),
	@Result(name = "query", location = "/res/basemgr/gdd/gdd_query.jsp"),
	@Result(name = "list", location = "/res/basemgr/gdd/gdd_list.jsp"),
	@Result(name = "edit", location = "/res/basemgr/gdd/gdd_edit.jsp")
})
@Action("gdd")
public class GddAction extends BaseAction {
 	
	// 管道段管理Service
	@Resource(name = "gddServiceImpl")
	private GddService gddservice;
	
	private GddEntity entity;
 	
	/**
	 * 查询管道段是否已存在
	 */
	public void checkGdd()
	{
		try
		{
			String qdgj=super.getParameterValue("qdgj");
			String zdgj=super.getParameterValue("zdgj");
			Map<String,Object> contionMap=new HashMap<String, Object>();
			contionMap.put("qdgj", qdgj);
			contionMap.put("zdgj", zdgj);
			String count=gddservice.getGddIsExist(contionMap);
			Map<String,Object> resultMap=new HashMap<String, Object>();
			resultMap.put("count", count);
			convertmaptojson(resultMap);
		}catch(Exception ex)
		{
			logger.info("查询管道段是否已存在!!", ex);
		}
		
	}
	
	/**
	 * 管道段保存修改
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
		if(gddservice.saveorupdate(entity)){
			setInfoMessage("保存成功!", toPage);
		}else{
			setInfoMessage("保存失败!", toPage);
		}
		request.setAttribute("entity", entity);
		return toPage;
	}
	
	/**
	 * 删除
	 * @return
	 * @throws Exception
	 */
	public String delete()throws Exception{
		String xtbh = entity.getXtbh();
		if(gddservice.delete(xtbh)){
			super.outmessage("删除成功！");
		}else{
			super.outmessage("删除失败！");
		}
		return null;
	}
	
	/**
	 * 管道段资源查看详细
	 */
	public String execute() {
		String xtbh = request.getParameter("xtbh");//获取资源id
		request.setAttribute("xtbh", xtbh);
		return "frame";
	}

	@Override
	protected void prepareViewModel() throws Exception {
		String xtbh = request.getParameter("xtbh");//获取资源id
		request.setAttribute("tipview", super.getParameterValue("tipview"));//tip 视图显示
		if (StringUtils.isNotBlank(xtbh)) {
			entity = gddservice.getbyid(xtbh);
			request.setAttribute("entity", entity);
		} else {
			entity = new GddEntity();
		}
	}

	/**
	 * 管道段资源查询条件
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
	 * 获取资源关联树结点串
	 * @return 结点串
	 * @throws Exception
	 */
	public String getTreeNodes()throws Exception{
		prepareViewModel();
		response.setContentType("application/html;charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache");		
		PrintWriter out = response.getWriter();
		out.print(gddservice.getTreeNodes(entity));
		out.flush();
		return null;
	}
	
	/**
	 * 管道段资源查询结果
	 * @throws Exception 
	 */
	public String list() throws Exception {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		String condition = entity.getSerializeQueryCondition();
		if (StringUtils.isBlank(condition)) {
			condition = request.getQueryString();
		}
		Map<String, Object> conditionMap = super.getDecodeCondtionMap(condition, user);
		Map<String, Object> json = gddservice.queryPageMap("queryGddList",conditionMap, super.getPage("page"), super.getLimit("rows"));
		request.setAttribute("map", json);
		// 转换为列表参数
		request.setAttribute("condition", condition);
		return "list";
	}
	
	/**
	 * 管道段的批量逻辑删除
	 */
	public String batchDelete(){
		String xtbhs = request.getParameter("xtbhs");
		if(gddservice.batchDelete(xtbhs)){
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
		if(gddservice.batchEdit(map)){
			super.outmessage("编辑成功！");
		}else{
			super.outmessage("编辑失败！");
		}
		return null;		
	}	 
	
	@Override
	protected void prepareSaveModel() throws Exception {
		if (entity == null) {
			entity = new GddEntity();
		}
	}

	@Override
	public GddEntity getModel() {
		if (entity == null) {
			entity = new GddEntity();
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
			entity = new GddEntity();
		}
		entity.setActionMessage(info);		
	}	
}
