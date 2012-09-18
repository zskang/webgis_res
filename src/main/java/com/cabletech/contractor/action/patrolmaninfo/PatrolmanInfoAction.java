package com.cabletech.contractor.action.patrolmaninfo;

import java.util.Map;
import javax.annotation.Resource;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import com.cabletech.baseinfo.business.Service.BaseInfoProvider;
import com.cabletech.contractor.service.patrolmaninfo.PatrolmanInfoService;
import com.cabletech.core.action.BaseAction;

/**
 * 巡检人员信息Action
 */
@Namespace("/contractor")
@Results({
	@Result(name = "view", location = "/contractor/patrolmaninfo/patrolmaninfo_view.jsp"),
	@Result(name = "data", location = "/contractor/patrolmaninfo/patrolmandata_info.jsp")})
@Action("patrolmaninfo")
public class PatrolmanInfoAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	
	@Resource(name="patrolmanInfoServiceImpl")
	private PatrolmanInfoService service;
	
	@Resource(name="baseInfoProvider")
	private BaseInfoProvider baseInfoProvider;	
	
	/**
	 * 获取当前正在执行任务情况
	 * @throws Exception
	 */
	public void getCurrentTask()throws Exception{
		String id = request.getParameter("id");
		Map<String, Object> map = service.queryPageMap("getCurrentTask", id, super.getPage(), super.getLimit());
		super.convertpagemaptojson(map);		
	}
	
	/**
	 * 获取今日巡检明细
	 * @throws Exception
	 */
	public void getCurrentTaskDetail()throws Exception{
		String id = request.getParameter("id");
		Map<String, Object> map = service.queryPageMap("getCurrentTaskDetail", id, super.getPage(), super.getLimit());
		super.convertpagemaptojson(map);
	}
	
	@Override
	public String execute() {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		String businesstype = request.getParameter("businesstype");
		request.setAttribute("id", id);	
		request.setAttribute("businesstype", businesstype);
		return "data";
	}

	@Override
	public Object getModel() {
		// TODO Auto-generated method stub
		return null;
	}
	
	/**
	 * 查看人员基本信息
	 */
	public String view() throws Exception {
		String id = request.getParameter("id");
		if(StringUtils.isNotBlank(id)){
			Map<String, Object> person = baseInfoProvider.getPersonService().getPersonInfo(id);//service.getUserInfoBySid(id);
			request.setAttribute("id", id);
			request.setAttribute("person", person);
		}		
		return "view";
	}	

	@Override
	protected void prepareSaveModel() throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	protected void prepareViewModel() throws Exception {
		//	TODO Auto-generated method stub
	}

}
