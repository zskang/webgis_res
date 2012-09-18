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
import com.cabletech.res.entity.cableequipmgr.GzdhEntity;
import com.cabletech.res.service.cableequipmgr.GzdhService;

/**
 * 光交资源-光终端盒
 * 
 * @author zhanglei 2011-05-11
 */
@SuppressWarnings("serial")
@Namespace("/res/cableequipmgr")
@Results( {
		@Result(name = "frame", location = "/res/cableequipmgr/gzdh/gzdh_frame.jsp"),
		@Result(name = "input", location = "/res/cableequipmgr/gzdh/gzdh_input.jsp"),
		@Result(name = "view", location = "/res/cableequipmgr/gzdh/gzdh_view.jsp"),
		@Result(name = "query", location = "/res/cableequipmgr/gzdh/gzdh_query.jsp"),
		@Result(name = "list", location = "/res/cableequipmgr/gzdh/gzdh_list.jsp"),
		@Result(name = "edit", location = "/res/cableequipmgr/gzdh/gzdh_edit.jsp")})
@Action("gzdh")
public class GzdhAction extends BaseAction {

	private GzdhEntity entity;

	@Resource(name = "gzdhServiceImpl")
	private GzdhService gzdhservice;
	
	/**
	 * 光终端盒查询条件
	 * @return
	 * @throws Exception
	 */
	public String query()throws Exception{
		UserInfo user = (UserInfo)request.getSession().getAttribute("user");
		String condition = request.getQueryString();
		Map<String, Object> decodeCondtionMap = super.getDecodeCondtionMap(condition, user);
		request.setAttribute("searchCondition", decodeCondtionMap);
		return "query";
	}
	
	/**
	 * 光终端盒查询结果
	 * @return
	 * @throws Exception
	 */
	public String list()throws Exception{
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		if (user == null) {
			user = new UserInfo();
			user.setRegionId("440601");
		}
		String condition = entity.getSerializeQueryCondition();
		if (StringUtils.isBlank(condition)) {
			condition = request.getQueryString();
		}
		Map<String, Object> conditionMap = super.getDecodeCondtionMap(
				condition, user);
		Map<String, Object> map = null;
		String method = "queryGzdhList";
		if (conditionMap.containsKey("simid") && StringUtils.isNotBlank(conditionMap.get("simid").toString())) {
			method = "queryGzdhListWithSimid";
		}
		map = gzdhservice.queryPageMap(method, conditionMap, super.getPage("page"), super.getLimit("rows"));		
		request.setAttribute("map", map);
		// 转换为列表参数
		request.setAttribute("condition", condition);
		return "list";
	}
	

	/**
	 * 光终端盒保存修改
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
		if(gzdhservice.saveorupdate(entity)){
			setInfoMessage("保存成功!", toPage);
		}else{
			setInfoMessage("保存失败!", toPage);
		}
		request.setAttribute("entity", entity);
		return toPage;
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
		out.print(gzdhservice.getTreeNodes(entity));
		out.flush();
		return null;
	}	
	
	@Override
	public String execute() {
		String resId = request.getParameter("resId");//获取资源id
		request.setAttribute("resId", resId);
		return "frame";
	}

	@Override
	protected void prepareViewModel() throws Exception {
		String xtbh = request.getParameter("xtbh");// 获取资源id
		request.setAttribute("tipview", super.getParameterValue("tipview"));//tip 视图显示
		if (StringUtils.isNotBlank(xtbh)) {
			entity = gzdhservice.getbyid(xtbh);
			request.setAttribute("entity", entity);
		} else {
			entity = new GzdhEntity();
		}
	}
 
	@Override
	protected void prepareSaveModel() throws Exception {
		if (entity == null) {
			entity = new GzdhEntity();
		}
	}

	@Override
	public GzdhEntity getModel() {
		if (entity == null) {
			entity = new GzdhEntity();
		}
		return entity;
	}
	/**
	 * 删除
	 * @return
	 * @throws Exception
	 */
	public String delete()throws Exception{
		prepareViewModel();
		if(gzdhservice.delete(entity)){
	 		super.outmessage("删除成功！");
		}else{
			super.outmessage("删除失败！");
		}
		return null;
	}	
	
	/**
	 * 光终端盒的批量逻辑删除
	 */
	public String batchDelete(){
		String xtbhs = request.getParameter("xtbhs");
		if(gzdhservice.batchDelete(xtbhs)){
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
		if(gzdhservice.batchEdit(map)){
			super.outmessage("编辑成功！");
		}else{
			super.outmessage("编辑失败！");
		}
		return null;		
	}
	
	/**
	 * 设置提示信息
	 * @param info 提示信息
	 * @param toPage 页面
	 */
	public void setInfoMessage(String info, String toPage){
		if(toPage.equals("input")){
			entity = new GzdhEntity();
		}
		entity.setActionMessage(info);		
	}	

}
