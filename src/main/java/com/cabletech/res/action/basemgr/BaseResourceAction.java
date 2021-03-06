package com.cabletech.res.action.basemgr;
 
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
import com.cabletech.baseinfo.business.Service.BaseInfoProvider;
import com.cabletech.baseinfo.business.entity.UserInfo;
import com.cabletech.core.action.BaseAction;
import com.cabletech.core.service.ResCommonTagService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
/**
 * 页面获取xtbh与名称
 * @author cqp 2012-05-11
 *
 */
@SuppressWarnings("serial")
@Namespace("/res/basemgr")
@Results({
	@Result(name = "frame", location = "/res/basemgr/gld/gld_frame.jsp"),
	@Result(name = "input", location = "/res/basemgr/gld/gld_input.jsp"),
	@Result(name = "view", location = "/res/basemgr/gld/gld_view.jsp"),
	@Result(name = "query", location = "/res/basemgr/gld/gld_query.jsp"),
	@Result(name = "list", location = "/res/basemgr/gld/gld_list.jsp")	
})
@Action("baseresource")
public class BaseResourceAction extends BaseAction{
	
	@Resource(name = "baseInfoProvider")
	private BaseInfoProvider baseInfoProvider;
	
	@Resource(name = "resCommonTagServiceImpl")
	private ResCommonTagService service;	
	
	@Override
	public String execute(){
		int currentpage = super.getPage("page");
		int pagesize = super.getLimit("rows");
		UserInfo user = (UserInfo)request.getSession().getAttribute("user");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("tableName",super.getParameterValue("tableName"));
		map.put("columnName",super.getParameterValue("columnName"));
		map.put("columnValue",super.converstringtoutf8(super.getParameterValue("searchTerm")));
		map.put("regionids", baseInfoProvider.getRegionService().getRegionIdList(user.getUserId()));
		
		Map<String, Object> result = null;
		if(StringUtils.isNotBlank(super.getParameterValue("mode"))){//2种
			result = service.queryPageMap("searchMutiResourceData", map, currentpage, pagesize);
		}else{
			result = service.queryPageMap("searchResourceData", map, currentpage, pagesize);
		}
		int total = Integer.parseInt(result.get("total").toString());//总记录数
		result.put("page", currentpage);//当前页数
		result.put("records", (total+pagesize-1)/pagesize);//总页数
		super.convertmaptojson(result);
		return null;
	}
	
	/**
	 * autocomplete 获取数据key-value
	 *
	 */
	public void fecthData()throws Exception{
		UserInfo user = (UserInfo)request.getSession().getAttribute("user");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("tableName",super.getParameterValue("tableName"));
		map.put("columnName","zymc");
		map.put("columnValue", super.getParameterValue("q").trim());
		map.put("regionids", baseInfoProvider.getRegionService().getRegionIdList(user.getUserId()));
		List<Map<String, Object>> list = null;
		if(StringUtils.isNotBlank(super.getParameterValue("mode"))){//2种
			list = service.fetchMutiResourceData(map);
		}else{
			list = service.fetchResourceData(map);
		}
		response.setContentType("application/json;charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		PrintWriter out = response.getWriter();
		out.print(gson.toJson(list));
		out.flush();
	}
 
	@Override
	public Object getModel() {
		return null;
	}

	@Override
	protected void prepareSaveModel() throws Exception {
		
	}

	@Override
	protected void prepareViewModel() throws Exception {
	}
	
}
