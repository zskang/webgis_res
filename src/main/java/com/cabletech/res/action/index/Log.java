package com.cabletech.res.action.index;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import com.cabletech.baseinfo.business.entity.UserInfo;
import com.cabletech.core.action.BaseAction;
import com.cabletech.core.common.OutputMap;
import com.cabletech.core.common.PrintMap;
import com.cabletech.res.entity.publicmgr.OdmEntity;
import com.cabletech.res.service.index.LogService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

/**
 * 主Action，实现基本的登录认证工作
 * 
 * @author cqp 2012-04-25
 * 
 */
@SuppressWarnings("serial")
@Namespace("/res")
@Results( {
		@Result(name = "list", location = "/res/index/log_list.jsp")
})
@Action("log")
public class Log extends BaseAction {
	
	@Resource(name = "logServiceImpl")
	private LogService logService;
	
	@Override
	public String execute() {
		return LIST;
	}
	
	/**
	 * 消息日志列表
	 */
	public void logListJson(){
		Map<String ,Object> params = new HashMap<String, Object>();
		String xtbh = request.getParameter("xtbh");
		params.put("xtbh", xtbh);
		String zylx = request.getParameter("zylx");
		params.put("zylx", zylx);
		String zymc = request.getParameter("zymc");
		params.put("zymc", zymc);
		String action = request.getParameter("action");
		params.put("action", action);
		String actman = request.getParameter("actman");
		params.put("actman", actman);
		String begin = request.getParameter("begin");
		params.put("begin", begin);
		String end = request.getParameter("end");
		params.put("end", end);
		Map<String, Object> map = logService.queryPageMap("getLogList", params, super.getPage(), super.getLimit());
		convertpagemaptojson(map);
	}
	@Override
	protected void prepareViewModel() throws Exception {

	}

	@Override
	protected void prepareSaveModel() throws Exception {

	}

	@Override
	public Object getModel() {
		return null;
	}

}
