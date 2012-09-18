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
import com.cabletech.res.entity.basemgr.DgxxEntity;
import com.cabletech.res.service.basemgr.DgxxService;

/**
 * 承载层-电杆信息管理
 * 
 * @author zhb 2011-05-11
 */
@SuppressWarnings("serial")
@Namespace("/res/basemgr")
@Results( {
		@Result(name = "frame", location = "/res/basemgr/dgxx/dgxx_frame.jsp"),
		@Result(name = "input", location = "/res/basemgr/dgxx/dgxx_input.jsp"),
		@Result(name = "view", location = "/res/basemgr/dgxx/dgxx_view.jsp"),
		@Result(name = "query", location = "/res/basemgr/dgxx/dgxx_query.jsp"),
		@Result(name = "list", location = "/res/basemgr/dgxx/dgxx_list.jsp"),
		@Result(name = "edit", location = "/res/basemgr/dgxx/dgxx_edit.jsp")})
@Action("dgxx")
public class DgxxAction extends BaseAction {

	private DgxxEntity entity;// 电杆实体

	@Resource(name = "dgxxServiceImpl")
	private DgxxService dgxxService;

	/**
	 * 电杆资源编辑
	 * 
	 * @return view 查看页面
	 * @throws Exception
	 */
	public String view() throws Exception {
		return "view";
	}

	/**
	 * 电杆资源保存
	 * @return view 查看页面
	 * @throws Exception
	 */
	public String save() throws Exception {
		UserInfo user = (UserInfo)request.getSession().getAttribute("user");
		entity.setOrgid(user.getOrgId());
		String toPage;
		if(StringUtils.isNotBlank(entity.getXtbh())){
			toPage = "view";
		}else{
			toPage = "input";
		}		
		if(dgxxService.saveorupdate(entity)){
			setInfoMessage("保存成功!", toPage);
		}else{
			setInfoMessage("保存失败!", toPage);
		}
		request.setAttribute("entity", entity);
		return toPage;
	}

	/**
	 * 电杆资源查看详细
	 * @return
	 */
	@Override
	public String execute() {
		String xtbh = request.getParameter("xtbh");
		request.setAttribute("xtbh", xtbh);
		return "frame";
	}

	/**
	 * 电杆查询条件
	 * @return
	 * @throws Exception
	 */
	public String query() throws Exception {
		UserInfo user = (UserInfo)request.getSession().getAttribute("user");
		String condition = request.getQueryString();
		Map<String, Object> decodeCondtionMap = super.getDecodeCondtionMap(condition, user);
		request.setAttribute("searchCondition", decodeCondtionMap);
		return "query";
	}


	/**
	 * 查询电杆
	 * @return
	 * @throws Exception
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
		String method = "queryDgxxList";
		if (conditionMap.containsKey("simid") && StringUtils.isNotBlank(conditionMap.get("simid").toString())) {
			method = "queryDgxxListWithSimid";
		}
		map = dgxxService.queryPageMap(method, conditionMap, super.getPage("page"), super.getLimit("rows"));		
		request.setAttribute("map", map);
		// 转换为列表参数
		request.setAttribute("condition", condition);
		return "list";
	}
	
	/**
	 * 删除
	 * @return
	 * @throws Exception
	 */
	public String delete()throws Exception{
		if(dgxxService.delete(entity)){
			super.outmessage("删除成功！");
		}else{
			super.outmessage("删除失败！");
		}
		return null;
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
		out.print(dgxxService.getTreeNodes(entity));
		out.flush();
		return null;
	}
  
	@Override
	protected void prepareViewModel() throws Exception {
		String xtbh = request.getParameter("xtbh");
		request.setAttribute("tipview", super.getParameterValue("tipview"));//tip 视图显示
		if (StringUtils.isNotBlank(xtbh)) {
			entity = dgxxService.getbyid(xtbh);
			request.setAttribute("entity", entity);
		} else {
			entity = new DgxxEntity();
		}
	}
	
	/**
	 * 电杆的批量逻辑删除
	 */
	public String batchDelete(){
		String xtbhs = request.getParameter("xtbhs");
		if(dgxxService.batchDelete(xtbhs)){
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
		if(dgxxService.batchEdit(map)){
			super.outmessage("编辑成功！");
		}else{
			super.outmessage("编辑失败！");
		}
		return null;		
	}	

	@Override
	protected void prepareSaveModel() throws Exception {
		if (entity == null) {
			entity = new DgxxEntity();
		}
	}

	@Override
	public DgxxEntity getModel() {
		if (entity == null) {
			entity = new DgxxEntity();
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
			entity = new DgxxEntity();
		}
		entity.setActionMessage(info);		
	}		

}
