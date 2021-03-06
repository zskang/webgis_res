package com.cabletech.res.action.opticcablemgr;

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
import com.cabletech.res.entity.opticcablemgr.GldlyEntity;
import com.cabletech.res.service.opticcablemgr.GldlyService;

/**
 *光缆-光缆段路由管理
 * 
 * @author zhanglei 2011-05-11
 */
@SuppressWarnings("serial")
@Namespace("/res/opticcablemgr")
@Results( {
		@Result(name = "frame", location = "/res/opticcablemgr/gldly/gldly_frame.jsp"),
		@Result(name = "input", location = "/res/opticcablemgr/gldly/gldly_input.jsp"),
		@Result(name = "view", location = "/res/opticcablemgr/gldly/gldly_view.jsp"),
		@Result(name = "query", location = "/res/opticcablemgr/gldly/gldly_query.jsp"),
		@Result(name = "list", location = "/res/opticcablemgr/gldly/gldly_list.jsp")
		})
@Action("gldly")
public class GldlyAction extends BaseAction {

	private GldlyEntity entity;

	@Resource(name = "gldlyServiceImpl")
	private GldlyService gldlyservice;
 	
	/**
	 * 检查两个设备所属站点是否相同
	 * @return
	 */
	public String checkZD()
	{
		try
		{
			String isPass="success";
			String sblx=super.getParameterValue("qdlx");
			String qdsbmc=super.getParameterValue("qdmc");
			String zdsbmc=super.getParameterValue("zdmc");
			if(sblx.equals("AA001"))
			{
				boolean t=gldlyservice.checkOdfSSZD(qdsbmc, zdsbmc);
				if(t)
				{
					isPass="fail";
				}
			}else if(sblx.equals("AA004"))
			{
				boolean t=gldlyservice.checkGFxxSSZD(qdsbmc,zdsbmc);
				if(t)
				{
					isPass="fail";
				}
			}else if(sblx.equals("AA006"))
			{
				boolean t=gldlyservice.checkGzdhSSZD(qdsbmc,zdsbmc);
				if(t)
				{
					isPass="fail";
				}
			}
			Map<String,Object> resultMap=new HashMap<String, Object>();
			resultMap.put("isPass", isPass);
			convertmaptojson(resultMap);
		}catch(Exception ex)
		{
			logger.info("检查两个设备所属站点是否相同",ex);
		}
		return null;
	}
	
	/**
	 * 光缆段路由保存信息
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
		if(gldlyservice.saveorupdate(entity)){
			setInfoMessage("保存成功!", toPage);
		}else{
			setInfoMessage("保存失败!", toPage);
		}
		request.setAttribute("entity", entity);
		return toPage;
	}

	@Override
	public String execute() {
		String xtbh = request.getParameter("xtbh");//获取资源id
		request.setAttribute("xtbh", xtbh);
		return "frame";
	}

	/**
	 * 光缆段路由查询条件
	 * @return
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
		if(gldlyservice.delete(xtbh)){
			super.outmessage("删除成功！");
		}else{
			super.outmessage("删除失败！");
		}
		return null;
	}
	
	/**
	 * 光缆段的批量逻辑删除
	 */
	public String batchDelete(){
		String xtbhs = request.getParameter("xtbhs");
		if(gldlyservice.batchDelete(xtbhs)){
			super.outmessage("删除成功！");
		}else{
			super.outmessage("删除失败！");
		}
		return null;		
	}	
	
	/**
	 *光缆段路由查询结果
	 * @throws Exception 
	 */
	public String list() throws Exception {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		String condition = entity.getSerializeQueryCondition();
		if (StringUtils.isBlank(condition)) {
			condition = request.getQueryString();
		}
		Map<String, Object> conditionMap = super.getDecodeCondtionMap(condition, user);
		Map<String, Object> json= gldlyservice.queryPageMap("queryGldly",conditionMap, super.getPage("page"), super.getLimit("rows"));
		request.setAttribute("map", json);
		// 转换为列表参数
		request.setAttribute("condition", condition);
		return "list";
	} 
	
	@Override
	protected void prepareViewModel() throws Exception {
		String xtbh = request.getParameter("xtbh");// 获取资源id
		request.setAttribute("tipview", super.getParameterValue("tipview"));//tip 视图显示
		if (StringUtils.isNotBlank(xtbh)) {
			entity = gldlyservice.getbyid(xtbh);
			request.setAttribute("entity", entity);
		} else {
			entity = new GldlyEntity();
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
		out.print(gldlyservice.getTreeNodes(entity));
		out.flush();
		return null;
	}	
	
	@Override
	protected void prepareSaveModel() throws Exception {
		if(entity == null){
			entity = new GldlyEntity();
		}
	}

	@Override
	public GldlyEntity getModel() {
		if(entity == null){
			entity = new GldlyEntity();
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
			entity = new GldlyEntity();
		}
		entity.setActionMessage(info);		
	}	
}
