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
import com.cabletech.res.entity.basemgr.GldEntity;
import com.cabletech.res.service.basemgr.GldService;

/**
 * 承载层-杆路段管理
 * @author zhb
 */
@SuppressWarnings("serial")
@Namespace("/res/basemgr")
@Results({
	@Result(name = "frame", location = "/res/basemgr/gld/gld_frame.jsp"),
	@Result(name = "input", location = "/res/basemgr/gld/gld_input.jsp"),
	@Result(name = "view", location = "/res/basemgr/gld/gld_view.jsp"),
	@Result(name = "query", location = "/res/basemgr/gld/gld_query.jsp"),
	@Result(name = "list", location = "/res/basemgr/gld/gld_list.jsp"),	
	@Result(name = "edit", location = "/res/basemgr/gld/gld_edit.jsp")
})
@Action("gld")
public class GldAction extends BaseAction {
 
	//杆路段实体
	private GldEntity entity;
	
	@Resource(name = "gldServiceImpl")
	private GldService gldService;
	
	/**
	 * 查询杆路段是否已存在
	 */
	public void checkGld()
	{
		try
		{
			String qddg=super.getParameterValue("qddg");
			String zddg=super.getParameterValue("zddg");
			Map<String,Object> contionMap=new HashMap<String, Object>();
			contionMap.put("qddg", qddg);
			contionMap.put("zddg", zddg);
			String count=gldService.getGldIsExist(contionMap);
			Map<String,Object> resultMap=new HashMap<String, Object>();
			resultMap.put("count", count);
			convertmaptojson(resultMap);
		}catch(Exception ex)
		{
			logger.info("查询杆路段是否已存在!!", ex);
		}
		
	}
	/**
	 * 杆路资源查看
	 * @return view 查看页面
	 * @throws Exception
	 */
	public String view()throws Exception {
		return "view";
	}
	
	/**
	 * 杆路资源保存修改
	 * @return view 查看页面
	 * @throws Exception
	 */	
	public String save(){
		UserInfo user = (UserInfo)request.getSession().getAttribute("user");
		entity.setOrgid(user.getOrgId());
		String toPage;
		if(StringUtils.isNotBlank(entity.getXtbh())){
			toPage = "view";
		}else{
			toPage = "input";
		}
		if(gldService.saveorupdate(entity)){
			setInfoMessage("保存成功！", toPage);
		}else{
			setInfoMessage("保存失败", toPage);
		}
		request.setAttribute("entity", entity);
		return toPage;
	}
 
	/**
	 * 杆路资源查看详细
	 * @return frame
	 */	
	@Override
	public String execute() {
		String xtbh = request.getParameter("xtbh");
		request.setAttribute("xtbh", xtbh);
		return "frame";
	}
	 
	/**
	 * 杆路查询条件
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
	 * 查询杆路
	 * @return
	 */
	public String list()throws Exception{
		UserInfo user = (UserInfo)request.getSession().getAttribute("user");
		String condition = entity.getSerializeQueryCondition();
		if(StringUtils.isBlank(condition)){
			condition = request.getQueryString();
		}
		Map<String, Object> conditionMap = super.getDecodeCondtionMap(condition, user);
		Map<String, Object> map = gldService.queryPageMap("queryGldList", conditionMap, super.getPage("page"), super.getLimit("rows"));
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
		if(gldService.delete(entity)){
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
		out.print(gldService.getTreeNodes(entity));
		out.flush();
		return null;
	}
	
	@Override
	protected void prepareViewModel() throws Exception {
		String xtbh = request.getParameter("xtbh");
		request.setAttribute("tipview", super.getParameterValue("tipview"));//tip 视图显示
		if (StringUtils.isNotBlank(xtbh)) {
			entity = gldService.getbyid(xtbh);
			request.setAttribute("entity", entity);
		} else {
			entity = new GldEntity();
		}
	}

	/**
	 * 杆路段的批量逻辑删除
	 */
	public String batchDelete(){
		String xtbhs = request.getParameter("xtbhs");
		if(gldService.batchDelete(xtbhs)){
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
		if(gldService.batchEdit(map)){
			super.outmessage("编辑成功！");
		}else{
			super.outmessage("编辑失败！");
		}
		return null;		
	}	
	
	@Override
	protected void prepareSaveModel() throws Exception {
		if (entity == null) {
			entity = new GldEntity();
		}
	}

	@Override
	public GldEntity getModel() {
		if (entity == null) {
			entity = new GldEntity();
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
			entity = new GldEntity();
		}
		entity.setActionMessage(info);		
	}
}
