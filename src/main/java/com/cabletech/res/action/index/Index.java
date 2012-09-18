package com.cabletech.res.action.index;

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
import com.cabletech.core.common.OutputMap;
import com.cabletech.core.common.PrintMap;
import com.cabletech.res.service.index.NoticeService;
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
@Results({ 
	    @Result(name = "index", location = "/index.jsp"),
	    @Result(name = "demo", location = "/demo.jsp"),
		@Result(name = "right", location = "/res/index/rightmenu.jsp"),
		@Result(name = "onlineuserinfo", location = "/res/index/onlineuserinfo.jsp"),
		@Result(name = "search", location = "/res/index/search_list.jsp")
		
		})
@Action("index")
public class Index extends BaseAction {
	
	@Resource(name = "noticeServiceImpl")
	private NoticeService noticeService;
	
	public void getGisConfig(){
		UserInfo userinfo = null;
		if (StringUtils.isBlank(request.getParameter("userid"))) {
			userinfo = (UserInfo) request.getSession().getAttribute("user");
		} else {
			String userid = request.getParameter("userid");
			userinfo = baseInfoProvider.getLoginUserService()
					.getUserInfoByUserId(userid);
		}
		String json = baseInfoProvider.getGisService().getFlexConfigJson(userinfo.getUserId());
		super.outmessage(json);
	}
	
	@Override
	public Object getModel() {
		return null;
	}

	/**
	 * 登录操作
	 */
	@Override
	public String execute() {
		UserInfo userinfo = null;
		if (StringUtils.isBlank(request.getParameter("userid"))) {
			userinfo = (UserInfo) request.getSession().getAttribute("user");
		} else {
			String userid = request.getParameter("userid");
			userinfo = baseInfoProvider.getLoginUserService()
					.getUserInfoByUserId(userid);
		}
		request.getSession().setAttribute("user", userinfo);
		request.setAttribute("config", config);
		request.setAttribute("messages", noticeService.getUnReadNotices(userinfo));
		return "index";
	}
	
	/**
	 * 搜索
	 * @return page
	 */
	public String search() {
		return "search";
	}
	
	/**
	 * 导出地图
	 */
	public void export(){
		String src_zq=request.getParameter("src_zq");
		String src_zy=request.getParameter("src_zy");
		String ctx = request.getRealPath("/_temp");
		String href="";
		if(StringUtils.isNotBlank(src_zq) && StringUtils.isNotBlank(src_zy)){
			href = PrintMap.getExportMapImg(src_zq, src_zy, ctx);
		}
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		OutputMap opm = new OutputMap();
		opm.setHref(request.getContextPath()+"/_temp/"+href);
		String json = gson.toJson(opm);
		outmessage(json);
	}
	
	/**
	 * 主页右边的菜单
	 * 
	 * @return String
	 */
	public String rightmenu() {

		return "right";
	}
	
	/**
	 * 获取头部菜单
	 * 
	 * @return
	 */
	public void getTopMenu() {
		UserInfo ui = (UserInfo) request.getSession().getAttribute("user");
		List<Map<String, Object>> list = baseInfoProvider.getMenuService().getUserMenuList(ui.getUserId(), config.getRoot());
		super.convertlisttojson(list);
	}
	
	/**
	 * 获取当前登录人的详细信息
	 * 
	 * @return
	 */
	public String onlineuerinfo(){
		return "onlineuserinfo";
	}
	
	/**
	 * 测试页面
	 * 
	 * @return
	 */
	public String demo(){
		UserInfo userinfo = null;
		if (StringUtils.isBlank(request.getParameter("userid"))) {
			userinfo = (UserInfo) request.getSession().getAttribute("user");
		} else {
			String userid = request.getParameter("userid");
			userinfo = baseInfoProvider.getLoginUserService()
					.getUserInfoByUserId(userid);
		}
		request.getSession().setAttribute("user", userinfo);
		request.setAttribute("config", config);
		return "demo";
	}
 
	@Override
	protected void prepareViewModel() throws Exception {

	}

	@Override
	protected void prepareSaveModel() throws Exception {

	}

}
