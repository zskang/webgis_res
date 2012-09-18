package com.cabletech.res.action.groupcustomsmgr;

import java.util.Map;
import javax.annotation.Resource;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import com.cabletech.baseinfo.business.entity.UserInfo;
import com.cabletech.core.action.BaseAction;
import com.cabletech.res.entity.groupcustomsmgr.CampusEntity;
import com.cabletech.res.service.groupcustomsmgr.CampusService;

/**
 * 校园网管理
 * 
 * @author zhb
 */
@SuppressWarnings("serial")
@Namespace("/res/groupcustomsmgr")
@Results({
	@Result(name = "frame", location = "/res/groupcustomsmgr/campus/campus_frame.jsp"),
	@Result(name = "input", location = "/res/groupcustomsmgr/campus/campus_input.jsp"),
	@Result(name = "view", location = "/res/groupcustomsmgr/campus/campus_view.jsp"),
	@Result(name = "query", location = "/res/groupcustomsmgr/campus/campus_query.jsp"),
	@Result(name = "list", location = "/res/groupcustomsmgr/campus/campus_list.jsp")	
})
@Action("campus")
public class CampusAction extends BaseAction {
 
	//校园网实体
	private CampusEntity entity;
	
	@Resource(name = "campusServiceImpl")
	private CampusService campusService;
	
	/**
	 * 校园网保存
	 * @return view 查看页面||input 编辑页面
	 */	
	public String save(){
		String toPage;
		if(StringUtils.isNotBlank(entity.getXtbh())){
			toPage = "view";
		}else{
			toPage = "input";
		}
		if(campusService.saveorupdate(entity)){
			setInfoMessage("保存成功!", toPage);
		}else{
			setInfoMessage("保存失败!", toPage);
		}
		request.setAttribute("entity", entity);
		return toPage;
	}

	@Override
	public String execute() {
		String xtbh = request.getParameter("xtbh");
		request.setAttribute("xtbh", xtbh);
		return "frame";
	}
	
	/**
	 * 校园网查询条件
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
	 * 查询校园网
	 * @return
	 */
	public String list()throws Exception{
		UserInfo user = (UserInfo)request.getSession().getAttribute("user");
		String condition = entity.getSerializeQueryCondition();
		if(StringUtils.isBlank(condition)){
			condition = request.getQueryString();
		}
		Map<String, Object> conditionMap = super.getDecodeCondtionMap(condition, user);
		Map<String, Object> map = campusService.queryPageMap("queryCampusList", conditionMap, super.getPage("page"), super.getLimit("rows"));
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
		if(campusService.delete(entity)){
			super.outmessage("删除成功！");
		}else{
			super.outmessage("删除失败！");
		}
		return null;
	}
	
	/**
	 * 批量逻辑删除
	 */
	public String batchDelete(){
		String xtbhs = request.getParameter("xtbhs");
		if(campusService.batchDelete(xtbhs)){
			super.outmessage("删除成功！");
		}else{
			super.outmessage("删除失败！");
		}
		return null;		
	}	
  
	@Override
	protected void prepareViewModel() throws Exception {
		String xtbh = request.getParameter("xtbh");
		request.setAttribute("tipview", super.getParameterValue("tipview"));//tip 视图显示
		if (StringUtils.isNotBlank(xtbh)) {
			entity = campusService.getbyid(xtbh);
			UserInfo user = (UserInfo)request.getSession().getAttribute("user");
			entity.setOrgid(user.getOrgId());
			request.setAttribute("entity", entity);
		} else {
			entity = new CampusEntity();
		}
	}

	@Override
	protected void prepareSaveModel() throws Exception {
		if (entity == null) {
			entity = new CampusEntity();
		}
	}

	@Override
	public CampusEntity getModel() {
		if (entity == null) {
			entity = new CampusEntity();
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
			entity = new CampusEntity();
		}
		entity.setActionMessage(info);		
	}	

}
