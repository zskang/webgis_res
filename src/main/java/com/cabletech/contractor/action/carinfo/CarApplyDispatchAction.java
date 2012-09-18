package com.cabletech.contractor.action.carinfo;

import java.util.HashMap;
import java.util.Map;
import javax.annotation.Resource;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import com.cabletech.contractor.entity.carinfo.CarApplyDispatchEntity;
import com.cabletech.contractor.service.carinfo.CarApplyDispatchServiceImpl;
import com.cabletech.core.action.BaseAction;

/**
 * 车辆任务调度查看Action
 */
@Namespace("/contractor")
@Results({
		@Result(name = "view", location = "/contractor/carinfo/currenttask_view.jsp"),
		@Result(name = "data", location = "/contractor/carinfo/cardata_info.jsp")})
@Action("carapplydispatch")
public class CarApplyDispatchAction extends BaseAction {

	private static final long serialVersionUID = 1L;

	@Resource(name = "carApplyDispatchServiceImpl")
	private CarApplyDispatchServiceImpl service;
	
	private CarApplyDispatchEntity entity;

	@Override
	public String execute() {
		return "data";
	}
	
	/**
	 * 查看车辆当前任务
	 */
	public String view() throws Exception {
		return "view";
	}	
	

	@Override
	protected void prepareSaveModel() throws Exception {
		if(entity == null){
			entity = new CarApplyDispatchEntity();
		}

	}

	@Override
	protected void prepareViewModel() throws Exception {
		String id = request.getParameter("id");
		if(StringUtils.isNotBlank(id)){
			entity = service.getCarApplyById(id);
			request.setAttribute("id", id);
			request.setAttribute("entity", entity);
		}else{
			entity = new CarApplyDispatchEntity();
		}

	}

	/**
	 * 获取车辆历史任务
	 */
	public void getCarHistoryTaskList()
	{
		String id = request.getParameter("id");
		try
		{
//		   List<Map<String,Object>> list=service.getCarHistoryTaskList(id);
//		   convertlisttojson(list);

		    Map<String,Object> params = new HashMap<String, Object>();
			params.put("id", id);
			Map<String, Object> map = service.queryPageMap("getCarHistoryTaskList", params, super.getPage(), super.getLimit());
			convertpagemaptojson(map);
		}catch(Exception ex)
		{
			logger.info("获取车辆历史任务失败！", ex);
		}
	}
	@Override
	public Object getModel() {
		if(entity == null){
			entity = new CarApplyDispatchEntity();
		}
		return entity;
	}
}