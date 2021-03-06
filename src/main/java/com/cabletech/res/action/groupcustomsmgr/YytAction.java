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
import com.cabletech.res.entity.groupcustomsmgr.YytEntity;
import com.cabletech.res.service.groupcustomsmgr.YytService;
/**
 * 承载层-营业厅管理
 * 
 * @author zhanglei 2011-05-11
 */
@SuppressWarnings("serial")
@Namespace("/res/groupcustomsmgr")
@Results( {
		@Result(name = "frame", location = "/res/groupcustomsmgr/yyt/yyt_frame.jsp"),
		@Result(name = "input", location = "/res/groupcustomsmgr/yyt/yyt_input.jsp"),
		@Result(name = "view", location = "/res/groupcustomsmgr/yyt/yyt_view.jsp"),
		@Result(name = "query", location = "/res/groupcustomsmgr/yyt/yyt_query.jsp"),
		@Result(name = "list", location = "/res/groupcustomsmgr/yyt/yyt_list.jsp")})
@Action("yyt")
public class YytAction extends BaseAction {

	private YytEntity entity;

	@Resource(name = "yytServiceImpl")
	private YytService yytservice;
	
	/**
	 * 营业厅查询条件
	 * @return
	 * @throws Exception
	 */
	public String query()throws Exception{
		UserInfo user = (UserInfo)request.getSession().getAttribute("user");
		String condition = request.getQueryString();
		Map<String, Object> decodeCondtionMap = super.getDecodeCondtionMap(condition, user);
		request.setAttribute("map", decodeCondtionMap);
		return "query";
	}
	
	@Override
	public String execute() {
		String resId = request.getParameter("resId");//获取资源id
		request.setAttribute("resId", resId);
		return "frame";
	}
	
	/**
	 * 营业厅查询结果
	 */
	public String list()throws Exception{
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		String condition = entity.getSerializeQueryCondition();
		if (StringUtils.isBlank(condition)) {
			condition = request.getQueryString();
		}
		Map<String, Object> conditionMap = super.getDecodeCondtionMap(
				condition, user);
		Map<String, Object> map = yytservice.queryPageMap("queryYyt", conditionMap, super
					.getPage("page"), super.getLimit("rows"));
		request.setAttribute("map", map);
		// 转换为列表参数
		request.setAttribute("condition", condition);
		return "list";
	}
 
	/**
	 * 营业厅保存信息
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
		if(yytservice.saveorupdate(entity)){
			setInfoMessage("保存成功!", toPage);
		}else{
			setInfoMessage("保存失败!", toPage);
		}
		request.setAttribute("entity", entity);
		return toPage;
	} 

	@Override
	protected void prepareViewModel() throws Exception {
		String xtbh = request.getParameter("xtbh");// 获取资源id
		request.setAttribute("tipview", super.getParameterValue("tipview"));//tip 视图显示
		if (StringUtils.isNotBlank(xtbh)) {
			YytEntity entity = yytservice.getbyid(xtbh);
			UserInfo user = (UserInfo)request.getSession().getAttribute("user");
			entity.setOrgid(user.getOrgId());
			request.setAttribute("entity", entity);
		} else {
			entity = new YytEntity();
		}
	}

	@Override
	protected void prepareSaveModel() throws Exception {
		if (entity == null) {
			entity = new YytEntity();
		}
	}

	@Override
	public YytEntity getModel() {
		if (entity == null) {
			entity = new YytEntity();
		}
		return entity;
	}
	/**
	 * 删除
	 * @return
	 * @throws Exception
	 */
	public String delete()throws Exception{
		String xtbh = entity.getXtbh();
		if(yytservice.delete(xtbh)){
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
		if(yytservice.batchDelete(xtbhs)){
			super.outmessage("删除成功！");
		}else{
			super.outmessage("删除失败！");
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
			entity = new YytEntity();
		}
		entity.setActionMessage(info);		
	}	

}
