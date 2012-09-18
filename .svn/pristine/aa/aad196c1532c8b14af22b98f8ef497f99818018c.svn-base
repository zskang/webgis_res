package com.cabletech.res.action.publicmgr;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import com.cabletech.baseinfo.business.entity.UserInfo;
import com.cabletech.core.action.BaseAction;
import com.cabletech.res.entity.publicmgr.OdfEntity;
import com.cabletech.res.entity.publicmgr.OdmEntity;
import com.cabletech.res.service.publicmgr.OdmService;

/**
 * 公共资源-odm管理
 * 
 * @author zhanglei 2011-05-11
 */
@SuppressWarnings("serial")
@Namespace("/res/publicmgr")
@Results( {
		@Result(name = "frame", location = "/res/publicmgr/odm/odm_frame.jsp"),
		@Result(name = "input", location = "/res/publicmgr/odm/odm_input.jsp"),
		@Result(name = "view", location = "/res/publicmgr/odm/odm_view.jsp"),
		@Result(name = "query", location = "/res/publicmgr/odm/odm_query.jsp"),
		@Result(name = "list", location = "/res/publicmgr/odm/odm_list.jsp"),
		@Result(name = "edit", location = "/res/publicmgr/odm/odm_edit.jsp")
		})
@Action("odm")
public class OdmAction extends BaseAction {

	private OdmEntity entity;

	@Resource(name = "odmServiceImpl")
	private OdmService odmservice;
 	
	/**
	 * 驗證框號
	 */
	public void checkGh()
	{
		 try
		 {
			 String sssblx=super.getParameterValue("sssblx");
			 String sssb=super.getParameterValue("sssb");
			 String gh=super.getParameterValue("gh");
			 String sssbm=super.getParameterValue("sssbm");
			 String isPass="success";
			 Map<String,Object> map=new HashMap<String, Object>();
			 Map<String,Object> map2=new HashMap<String, Object>();
			 map.put("sssblx",sssblx);
			 map.put("sssb",sssb);
			 map.put("gh",gh);
			 map.put("sssbm",sssbm);
			 map2.put("sssb", sssb);
			 List list=odmservice.getOdmByGh(map);
			 List<Map<String,Object>> list2=odmservice.getOdfByGhOdm(map2);
			 Map rMap=list2.get(0);
			 String num=String.valueOf(Integer.valueOf(rMap.get("ODMKHS").toString())*Integer.valueOf(rMap.get("ODMHLS").toString()));
			 if(list.size()>0)
			 {
				 isPass="fail";
			 }
			 Map<String,Object> resultMap=new HashMap<String, Object>();
			 resultMap.put("isPass", isPass);
			 resultMap.put("num",num);
			 convertmaptojson(resultMap);
		 }catch(Exception ex)
		 {
			 ex.printStackTrace();
		 }
		
	}
	/**
	 * odm资源保存信息
	 * 
	 */ 
	public String save() {
		UserInfo user = (UserInfo)request.getSession().getAttribute("user");
		//entity.setOrgid(user.getOrgId());
		String toPage;
		if(StringUtils.isNotBlank(entity.getXtbh())){
			toPage = "view";
		}else{
			toPage = "input";
		}
		if(odmservice.saveorupdate(entity)){
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
	 * odm资源查询条件
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
		//out.print(odmservice.getTreeNodes(entity));
		//out.flush();
		return null;
	}
	
	/**
	 * 删除
	 * @return
	 * @throws Exception
	 */
	public String delete()throws Exception{
		String xtbh = entity.getXtbh();
		if(odmservice.delete(xtbh)){
			super.outmessage("删除成功！");
		}else{
			super.outmessage("删除失败！");
		}
		return null;
	}
 	
	/**
	 * odm查询结果
	 * @throws Exception 
	 */
	public String list() throws Exception {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		String condition = entity.getSerializeQueryCondition();
		if (StringUtils.isBlank(condition)) {
			condition = request.getQueryString();
		}
		Map<String, Object> conditionMap = super.getDecodeCondtionMap(condition, user);
		Map<String, Object> map = odmservice.queryPageMap("queryOdm",conditionMap, super.getPage("page"), super.getLimit("rows"));
		request.setAttribute("map", map);
		// 转换为列表参数
		request.setAttribute("condition", condition);
		return "list";
	}
	
	@Override
	protected void prepareViewModel() throws Exception {
		String xtbh = request.getParameter("xtbh");// 获取资源id
		request.setAttribute("tipview", super.getParameterValue("tipview"));//tip 视图显示
		if (StringUtils.isNotBlank(xtbh)) {
			UserInfo user = (UserInfo)request.getSession().getAttribute("user");
		    entity = odmservice.getbyid(xtbh);
		    entity.setOrgid(user.getOrgId());
		    
			request.setAttribute("entity", entity);
		} else {
			entity = new OdmEntity();
		}
	}

	@Override
	protected void prepareSaveModel() throws Exception {
		if(entity == null){
			entity = new OdmEntity();
		}
	}

	@Override
	public OdmEntity getModel() {
		if(entity == null){
			entity = new OdmEntity();
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
			entity = new OdmEntity();
		}
		entity.setActionMessage(info);		
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
		if(odmservice.batchEdit(map)){
			super.outmessage("编辑成功！");
		}else{
			super.outmessage("编辑失败！");
		}
		return null;		
	}
	/**
	 * ODM的批量逻辑删除
	 */
	public String batchDelete(){
		String xtbhs = request.getParameter("xtbhs");
		if(odmservice.batchDelete(xtbhs)){
			super.outmessage("删除成功！");
		}else{
			super.outmessage("删除失败！");
		}
		return null;		
	}
}
