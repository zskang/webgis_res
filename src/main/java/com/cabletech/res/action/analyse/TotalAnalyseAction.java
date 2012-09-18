package com.cabletech.res.action.analyse;

import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;

import oracle.sql.CLOB;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import com.cabletech.baseinfo.business.entity.UserInfo;
import com.cabletech.core.action.BaseAction;
import com.cabletech.res.entity.analyse.AnalyseEntity;
import com.cabletech.res.service.analyse.AnalyseService;

/**
 * 承载资源统计
 * 
 * @author 吕仁钊 2012-08-11
 */
@SuppressWarnings("serial")
@Namespace("/res/analyse")
@Results( { @Result(name = "list", location = "/res/analyse/total_analyse_list.jsp") })
@Action("totalanalyse")
public class TotalAnalyseAction extends BaseAction {

	@Resource(name = "analyseServiceImpl")
	private AnalyseService analyseService;

	/**
	 * 初始化
	 * 
	 * @return
	 */
	@Override
	public String execute() {
		return "list";
	}

	/**
	 * 初始化表头
	 */
	public void initGridHeader() {
		String zylx = request.getParameter("zylx");
		String tjlx = request.getParameter("tjlx");
		Map<String, Object> analyse = analyseService.getAnalyse(zylx, tjlx);
		String header_sql = clob2String(analyse.get("PLATE_NAME"));
		List<LinkedHashMap<String, Object>> gridHeader = analyseService
				.executeSql(header_sql);
		super.converttojson(gridHeader);
	}

	/**
	 * 初始化表格数据
	 */
	public void initGridData() {
		Map<String, Object> params = new HashMap<String, Object>();
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		params.put("regionid", user.getRegionId());
		String zylx = request.getParameter("zylx");
		String tjlx = request.getParameter("tjlx");
		String date_condition = "";
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		if (StringUtils.isNotBlank(start)) {
			date_condition = " and r.createdate >= to_date('" + start
					+ "','yyyy/mm/dd')";
		}
		if (StringUtils.isNotBlank(end)) {
			date_condition = " and r.createdate <= to_date('" + end
					+ "','yyyy/mm/dd')";
		}
		if (StringUtils.isNotBlank(start) && StringUtils.isNotBlank(end)) {
			date_condition = " and r.createdate between to_date('" + start
					+ "','yyyy/mm/dd') and to_date('" + end + "','yyyy/mm/dd')";
		}
		Map<String, Object> analyse = analyseService.getAnalyse(zylx, tjlx);
		String data_sql = clob2String(analyse.get("STATISTICS_SQL"));
		String exe_sql = data_sql;
		if ("AE702".equals(tjlx)) {
			exe_sql = data_sql.replace("{date_condition}", date_condition);
		}
		params.put("sql", exe_sql);
		Map<String, Object> map = analyseService.queryPageMap("executeSql",
				params, super.getPage(), super.getLimit());
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

	/**
	 * 将clob转化为字符串
	 * 
	 * @param obj
	 *            clob
	 * @return str
	 */
	private String clob2String(Object obj) {
		StringBuffer result = new StringBuffer("");
		CLOB clob = (CLOB) obj;
		try {
			result.append((clob == null || clob.length() == 0) ? null : clob
					.getSubString((long) 1, (int) clob.length()));
			result = new StringBuffer(result.toString());
		} catch (Exception e) {
			result = new StringBuffer("");
		}
		return result.toString();
	}
}
