package com.cabletech.contractor.action.sublineinfo;

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
import com.cabletech.contractor.entity.sublineinfo.SublineInfoEntity;
import com.cabletech.contractor.service.sublineinfo.SublineInfoService;
import com.cabletech.core.action.BaseAction;
import com.cabletech.res.entity.basemgr.BaseEntity;

/**
 * 路由段操作Action
 * @author Administrator
 *
 */
@SuppressWarnings("serial")
@Namespace("/contractor")
@Results({ @Result(name = "linkline", location = "/contractor/sublineinfo/linkline.jsp"),
	@Result(name = "errorlink", location = "/contractor/sublineinfo/errorlink.jsp")})
@Action("sublineinfo")
public class SublineInfoAction extends BaseAction {
	
	private SublineInfoEntity entity;
	
	@Resource(name = "sublineInfoServiceImpl")
	private SublineInfoService sublineinfoservice;
	
	@Resource(name = "baseInfoProvider")
	private BaseInfoProvider baseInfoProvider;	
	
	@Override
	public String execute() {
		return null;
	}
	
	/**
	 * 转入连线操作页面
	 * @return
	 */
	public String toLinkLinePage(){
		String userid = request.getParameter("userid");
		if(StringUtils.isNotBlank(userid)){
			UserInfo user = (UserInfo) baseInfoProvider.getLoginUserService().getUserInfoByUserId(userid);
			String restype = request.getParameter("restype");//资源类型
			String objectid = request.getParameter("objectid");//资源空间存储标识
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("tablename", sublineinfoservice.getTableNameByResType(restype));
			map.put("objectid", objectid);
			BaseEntity baseentity = sublineinfoservice.getResourceEntity(map);
			List<Map<String, Object>> sublinelist = sublineinfoservice.getSulineList(user);
			request.setAttribute("baseentity", baseentity);
			request.setAttribute("restype", restype);
			request.setAttribute("sublinelist", sublinelist);
			return "linkline";
		}else{
			return "errorlink";
		}
	}
	
	/**
	 * 获取点线关系
	 * @throws Exception
	 */
	public void getSubline2Points()throws Exception{
		String sublineid = request.getParameter("sublineid");
		List<Map<String, Object>> list = sublineinfoservice.getSubline2Points(sublineid);
		super.convertlisttojson(list);
	}
	
	/**
	 * 连线操作
	 *
	 */
	public void linkline(){
		String sublineid = request.getParameter("sublineid");//线段编号
		String objectid = request.getParameter("objectid");//线段空间注册编号
		String points = request.getParameter("points");//点序关系
		String newpointid = request.getParameter("newpointid");//新增点编号
		String newrestype = request.getParameter("newrestype");//新增资源点类型
		String[] objects = points.split("!");
		SublineInfoEntity entity = new SublineInfoEntity();
		entity.setSublineid(sublineid);
		entity.setObjectid(Integer.parseInt(objectid));
		entity.setNewpointid(newpointid);
		entity.setNewrestype(newrestype);
		if(sublineinfoservice.linkline(entity, objects)){
			super.outmessage("连线成功！");
		}else{
			super.outmessage("连线失败！");
		}		
	}

	@Override
	public Object getModel() {
		if(entity ==null){
			entity = new SublineInfoEntity();
		}
		return entity;
	}

	@Override
	protected void prepareSaveModel() throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	protected void prepareViewModel() throws Exception {
		// TODO Auto-generated method stub
		
	}
	
}
