package com.cabletech.contractor.action.index;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import com.cabletech.baseinfo.business.entity.UserInfo;
import com.cabletech.core.action.BaseAction;

/**
 * 主Action，实现基本的登录认证工作
 * 
 * @author cqp
 * 
 */
@SuppressWarnings("serial")
@Namespace("/contractor")
@Results({ @Result(name = "index", location = "/contractor_index.jsp") })
@Action("index")
public class Index extends BaseAction {

	@Override
	public Object getModel() {
		// TODO Auto-generated method stub
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
		return "index";
	}

	/**
	 * 获取头部菜单
	 * 
	 * @return
	 */
	public void getTopMenu() {
		UserInfo ui = (UserInfo) request.getSession().getAttribute("user");
		List<Map<String, Object>> list = baseInfoProvider.getMenuService()
				.getUserMenuList(ui.getUserId(), config.getRoot());
		super.convertmaptojson(list);
	}

	@Override
	protected void prepareViewModel() throws Exception {

	}

	@Override
	protected void prepareSaveModel() throws Exception {

	}

}
