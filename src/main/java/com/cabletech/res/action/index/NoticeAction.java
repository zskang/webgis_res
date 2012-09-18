package com.cabletech.res.action.index;

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
import com.cabletech.core.common.OutputMap;
import com.cabletech.core.common.PrintMap;
import com.cabletech.res.entity.basemgr.GjxxEntity;
import com.cabletech.res.entity.index.NoticeEntity;
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
@Results( {
		@Result(name = "list", location = "/res/index/notice_list.jsp"),
		@Result(name = "list_admin", location = "/res/index/notice_admin_list.jsp"),
		@Result(name = "view", location = "/res/index/notice_view.jsp"),
		@Result(name = "input", location = "/res/index/notice_input.jsp")
})
@Action("notice")
public class NoticeAction extends BaseAction {

	@Resource(name = "noticeServiceImpl")
	private NoticeService noticeService;
	
	private NoticeEntity entity; 
	
	@Override
	public String execute() {
		return LIST;
	}
	
	/**
	 * 管理入口
	 * @return
	 */
	public String admin() {
		return "list_admin";
	}
	
	/**
	 * 添加公告
	 * @return
	 */
	public String save() {
		UserInfo user = (UserInfo)request.getSession().getAttribute("user");
		entity.setRegionid(user.getRegionId());
		entity.setIssueperson(user.getUserId());
		if(noticeService.saveorupdate(entity)){
			request.setAttribute("actionMessage","保存成功!");
		}else{
			request.setAttribute("actionMessage","保存失败!");
		}
		return INPUT;
	} 
	
	/**
	 * 读取通告列表
	 */
	public void noticeJsonList(){
		Map<String,Object> params = new HashMap<String, Object>();
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		params.put("userid", user.getUserId());
		params.put("title",request.getParameter("title"));
		params.put("type",request.getParameter("noticetype"));
		Map<String, Object> map = noticeService.queryPageMap("getNotices", params, super.getPage(), super.getLimit());
		convertpagemaptojson(map);
	}
	
	/**
	 * 删除通告
	 */
	public void delNotice(){
		String id = request.getParameter("noticeid");
		noticeService.delNotice(id);
	}


	@Override
	protected void prepareViewModel() throws Exception {
		String xtbh = request.getParameter("nid");// 获取资源id
		if (StringUtils.isNotBlank(xtbh)) {
			entity = noticeService.getById(xtbh);
			UserInfo user = (UserInfo) request.getSession().getAttribute("user");
			noticeService.setRead(xtbh, user.getUserId());
			request.setAttribute("entity", entity);
		} else {
			entity = new NoticeEntity();
		}
	}

	@Override
	protected void prepareSaveModel() throws Exception {
		if (entity == null) {
			entity = new NoticeEntity();
		}
	}

	@Override
	public Object getModel() {
		if (entity == null) {
			entity = new NoticeEntity();
		}
		return entity;
	}

}
