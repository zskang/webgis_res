package com.cabletech.contractor.action.gisextend;

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
import com.cabletech.contractor.service.gisextend.GisExtendService;
import com.cabletech.core.action.BaseAction;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

/**
 * GIS地图扩展接口Action
 */
@Namespace("/")
@Results( {@Result(name = "simplemap", location = "/contractor/gisextend/simplemap.jsp"),
	@Result(name = "edittable", location = "/contractor/gisextend/edittable.jsp")})
@Action("gisextend")
public class GisExtendAction extends BaseAction {


	private static final long serialVersionUID = 1L;
	
  	@Resource(name = "baseInfoProvider")
	private BaseInfoProvider baseInfoProvider;
  	
  	@Resource(name = "gisExtendServiceImpl")
  	private GisExtendService service;
  	
	/**
	 * 绘制图元并返回串值
	 * @return
	 */
	public String drawReturn(){
		String graphictype = null2e(request.getParameter("graphictype"));
		String eid = request.getParameter("eid");//父窗口接受串值的文本域ID
		String[] params = new String[]{graphictype, eid};
		if(isNotNullParams(params)){
			request.setAttribute("graphictype", graphictype);
			request.setAttribute("eid", eid);
		}
		request.setAttribute("reqtype", "drawreturn");//请求类型
		setLoginUser();
		return "simplemap";
	}
	
	/**
	 * 根据具体业务类型绘制图元，无返回串值
	 * @return
	 */
	public String drawType(){
		//业务类型
		String actiontype = null2e(request.getParameter("actiontype"));
		request.setAttribute("actiontype", actiontype);
		
		if(actiontype.equals("001")){//轨迹播放
			String simid = null2e(request.getParameter("simid"));
			String patrolid = null2e(request.getParameter("patrolid"));
			String businesstype = null2e(request.getParameter("businesstype"));
			String starttime = request.getParameter("starttime");
			String endtime = request.getParameter("endtime");
			String[] params = new String[]{simid, patrolid, businesstype, starttime, endtime};
			if(isNotNullParams(params)){
				request.setAttribute("businesstype", businesstype);
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("simid", simid);
				map.put("patrolid", patrolid);
				map.put("businesstype", businesstype);
				map.put("starttime", starttime);
				map.put("endtime", endtime);
				List<Map<String, Object>> list = null;
				if(businesstype.equals("C35")){
					list = service.getHistoryPositionByCar(map);
				}else{
					list = service.getHistoryPositionByMan(map);
				}
				request.setAttribute("json", getJson(list));
			}
			request.setAttribute("reqtype", "drawtype001");//请求类型
		}else if(actiontype.equals("002")){//计划路由呈现
			String planid = null2e(request.getParameter("planid"));
			String taskid = null2e(request.getParameter("taskid"));
			String plantype = null2e(request.getParameter("plantype"));
			String[] params = new String[]{planid, plantype};
			if(isNotNullParams(params)){
				if(plantype.equals("C30")){//线路巡检
					request.setAttribute("xy", service.getPointsXY(planid, taskid));
					request.setAttribute("graphictype", "2");
				}
				request.setAttribute("reqtype", "drawtype002");//请求类型
			}
		}//
		setLoginUser();
		return "simplemap";
	}
	
	/**
	 * 返回json串
	 * @param list 集合
	 * @return
	 */
	public String getJson(List<Map<String, Object>> list){
		String json = "";
		if(list != null && list.size()>0){
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			json = gson.toJson(list).toLowerCase();				
		}
		return json;		
	}
	
	/**
	 * 根据资源类型和资源编号绘制图元并无返回串值
	 * @return
	 */
	public String draw(){
		//字段名
		String keycolumn = null2e(request.getParameter("keycolumn"));
		//资源类型
		String resourcetype = null2e(request.getParameter("resourcetype"));
		String rid = request.getParameter("rid");//资源编号
		String[] params = new String[]{keycolumn, resourcetype, rid};
		if(isNotNullParams(params)){
			String queryWhere = keycolumn.toUpperCase()+"="+rid;//图层查询条件
			request.setAttribute("resourcetype", resourcetype);//资源类型
			request.setAttribute("queryWhere", queryWhere);
		}
		request.setAttribute("reqtype", "draw");//请求类型
		setLoginUser();		
		return "simplemap";
	}
	
	/**
	 * 根据 x y 绘制
	 * @return
	 */
	public String drawXY(){
		String graphictype = request.getParameter("graphictype");//1 点 2线 3面
		String xy = request.getParameter("xy");
		String marked = super.converstringtoutf8(request.getParameter("marked"));
		String[] params = new String[]{graphictype, xy};
		if(isNotNullParams(params)){
			request.setAttribute("xy", xy);
			request.setAttribute("graphictype", graphictype);
			request.setAttribute("marked", marked);
		}
		request.setAttribute("reqtype", "drawxy");//请求类型
		setLoginUser();		
		return "simplemap";
	}
	
	/**
	 * 根据表名 关键字 绘制
	 * @return
	 */
	public String drawTable()throws Exception{
		String tablename = request.getParameter("tablename");
		String keycolumn = request.getParameter("keycolumn");
		String marked = super.converstringtoutf8(request.getParameter("marked"));
		String rid = request.getParameter("rid");
		String[] params = new String[]{tablename, keycolumn, rid};
		if(isNotNullParams(params)){
			//查询 x y 串
			String points = service.getTableShapeReturnClob(tablename, keycolumn, rid);
			if(StringUtils.isNotBlank(points)){
				int index = points.indexOf("(");
				String graphictype = points.substring(0, index-1).trim();
				String xy = points.substring(index+1, points.length()-1).trim();
				if(graphictype.equals("POINT")){//点
					graphictype = "1";
				}else if(graphictype.equals("LINESTRING")){//线
					graphictype = "2";
				}else if(graphictype.equals("POLYGON")){//面
					xy = xy.substring(1, xy.length()-1);
					graphictype = "3";
				}
				request.setAttribute("graphictype", graphictype);
				request.setAttribute("xy", xy.trim());
				request.setAttribute("marked", marked);
			}
		}
		request.setAttribute("reqtype", "drawtable");//请求类型
		setLoginUser();		
		return "simplemap";
	}
	
	/**
	 * 向具体的业务表写入备注信息和空间信息 shape
	 * @return
	 */
	public String editTable(){
		String tablename = null2e(request.getParameter("tablename"));
		String keycolumn = null2e(request.getParameter("keycolumn"));
		String titlecolumn = null2e(request.getParameter("titlecolumn"));
		String remarkcolumn = null2e(request.getParameter("remarkcolumn"));
		String graphictype = null2e(request.getParameter("graphictype"));
		String[] params = new String[]{tablename, keycolumn, titlecolumn, remarkcolumn, graphictype};
		if(isNotNullParams(params)){
			request.setAttribute("tablename", tablename);
			request.setAttribute("keycolumn", keycolumn);
			request.setAttribute("titlecolumn", titlecolumn);
			request.setAttribute("remarkcolumn", remarkcolumn);
			request.setAttribute("graphictype", graphictype);
		}
		request.setAttribute("reqtype", "edittable");//请求类型
		setLoginUser();	
		return "simplemap";
	}
	
	/**
	 * 跳转至绘制编辑页面
	 * @return
	 */
	public String toEditTablePage(){
		String userid = request.getParameter("userid");
		String points = request.getParameter("points");
		String tbname = null2e(request.getParameter("tablename"));
		String kycolumn = null2e(request.getParameter("keycolumn"));
		String tlcolumn = null2e(request.getParameter("titlecolumn"));
		String rkcolumn = null2e(request.getParameter("remarkcolumn"));
		String gtype = null2e(request.getParameter("graphictype"));
		request.setAttribute("userid", userid);
		request.setAttribute("points", points);
		request.setAttribute("tablename", tbname);
		request.setAttribute("keycolumn", kycolumn);
		request.setAttribute("titlecolumn", tlcolumn);
		request.setAttribute("remarkcolumn", rkcolumn);
		request.setAttribute("graphictype", gtype);
		return "edittable";
	}
	
	/**
	 * 执行提交编辑绘制业务
	 *
	 */
	public String exeedittable() throws Exception{
		String former = request.getQueryString();
		Map<String, Object> map = super.getSerializeForm(former);
		if(service.saveDrawInfo(map)){
			super.outmessage("编辑成功！");
		}else{
			super.outmessage("编辑失败！");
		}
		return null;		
	}
	
	/**
	 * 计划漏检点
	 * @return
	 */
	public String drawPoints(){
		String tablename = null2e(request.getParameter("tablename"));
		String pid = null2e(request.getParameter("pid"));
		String[] params = new String[]{tablename, pid};
		if(isNotNullParams(params)){
			request.setAttribute("tablename", tablename);
			request.setAttribute("pid", pid);
			List<Map<String, Object>> list = service.getPlanPoints(tablename, pid);
			String xy = "";
			if(list != null && list.size()>0){
				xy = service.getXY(list);
			}
			request.setAttribute("xy", xy);
			request.setAttribute("graphictype", "1");
		}
		request.setAttribute("reqtype", "drawpoints");//请求类型
		setLoginUser();
		return "simplemap";
	}
	
	/**
	 * 绘制在线巡检人
	 * @return
	 */
	public String drawOnlineMen(){
		String id = null2e(request.getParameter("id"));
		String type = null2e(request.getParameter("type"));
		String[] types = {"regionid","orgid","groupid"};
		if(isExistDrawOnlineMenReqType(type, id, types)){
			request.setAttribute("id", id);
			request.setAttribute("type", type);
			request.setAttribute("graphictype", "1");
			String xy = "";
			List<Map<String, Object>> list = service.getOnlineMen(id, type);
			if(list != null && list.size()>0){
				xy = service.getXY(list);
			}
			request.setAttribute("xy", xy);
		}
		request.setAttribute("reqtype", "drawonlinemen");//请求类型
		setLoginUser();
		return "simplemap";
	}
	
	
	/**
	 * 油机选择请求
	 * @return
	 */
	public String selectOeoilengines(){
		String id = null2e(request.getParameter("id"));//站点编号
		String type = null2e(request.getParameter("type"));//站点类型
		String eid = request.getParameter("eid");//父窗口接受串值的文本域ID
		String[] params = new String[]{id, type, eid};
		if(isNotNullParams(params)){
			request.setAttribute("id", id);
			request.setAttribute("type", type);
			request.setAttribute("eid", eid);
		}
		request.setAttribute("reqtype", "selectOeoilengines");//请求类型
		setLoginUser();
		UserInfo user = (UserInfo)request.getSession().getAttribute("user");
		Map<String, Object> map = service.loadAllOeoilengines(id, type, user.getUserId());
		request.setAttribute("resourcejson", getJson((List<Map<String, Object>>)map.get("resourcelist")));
		request.setAttribute("olienginejson", getJson((List<Map<String, Object>>)map.get("olienginelist")));
		return "simplemap";
	}
	
	/**
	 * 通用处理过程（轨迹）
	 * @return
	 */
	public String universalProcessLocus(){
		String id = null2e(request.getParameter("id"));//单号
		String type = null2e(request.getParameter("type"));//流程类型（表名）
		String[] params = new String[]{id, type};
		if(isNotNullParams(params)){
			request.setAttribute("id", id);
			request.setAttribute("type", type);
			List<Map<String, Object>> list = service.getUniversalProcessLocus(id, type);
			request.setAttribute("json", getJson(list));			
		}
		request.setAttribute("reqtype", "universalProcessLocus");//请求类型
		setLoginUser();
		return "simplemap";
	}
	
	/**
	 * 油机发电记录轨迹
	 * @return
	 */
	public String oilenginePosition(){
		String id = null2e(request.getParameter("id"));//任务编号
		String[] params = new String[]{id};
		if(isNotNullParams(params)){
			request.setAttribute("id", id);
		}
		Map<String, Object> map = service.getOilenginePosition(id);
		if(map != null){
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			request.setAttribute("oilengine", gson.toJson((Map<String, Object>)map.get("oilengineInfo")).toLowerCase());
			request.setAttribute("positionlist", getJson((List<Map<String, Object>>)map.get("positionlist")));		
			request.setAttribute("reqtype", "oilenginePosition");//请求类型
			setLoginUser();
		}
		return "simplemap";
	}	
	
	/**
	 * 判断请求是否存在、查看传入参数
	 * @param type 类型
	 * @param id 编号
	 * @param types 类型集合
	 * @return
	 */
	public boolean isExistDrawOnlineMenReqType(String type, String id, String[] types){
		boolean tf = false;
		if(StringUtils.isBlank(type) || StringUtils.isBlank(id)){
			request.setAttribute("isNotNullParams", "===");
			return tf;
		}
		return isArrayEqualType(type, types);
	}
	
	/**
	 * 检查传入参数是否为空
	 * @param params 传入参数
	 * @return
	 */
	public boolean isNotNullParams(String[] params){
		boolean tf = true;
		for(String p:params){
			if(StringUtils.isBlank(p)){
				tf=false; break;
			}
		}
		if(!tf){
			request.setAttribute("isNotNullParams", "===");
		}		
		return tf;
	}
	
	/**
	 * 将用户注入至SESSION
	 */
	public void setLoginUser(){
		String id = null2e(request.getParameter("userid"));
		UserInfo user = baseInfoProvider.getLoginUserService().getUserInfoByUserId(id);
		request.setAttribute("userid", id);
		request.getSession().setAttribute("user", user);
	}
	
	/**
	 * 空对象转空值
	 * @param o 对象
	 * @return
	 */
	public String null2e(Object o){
		return o==null?"":o.toString().trim();
	}
	
	/**
	 * 检查传入参数值是否存在于参数数组中
	 * @param type 传入参数值
	 * @param types 参数数组
	 * @return
	 */
	public boolean isArrayEqualType(String type,String[] types){
		boolean tf = false;
		for(String t : types){
			if(type.equals(t)){
				tf = true;break;
			}
		}
		if(!tf){
			request.setAttribute("isNotNullParams", "===");
		}		
		return tf;
	}

	@Override
	public String execute() {
		setLoginUser();
		return "simplemap";
	}

	@Override
	public Object getModel() {
		// TODO Auto-generated method stub
		return null;
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
