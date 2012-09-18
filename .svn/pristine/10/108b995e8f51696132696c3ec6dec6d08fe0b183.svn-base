package com.cabletech.res.action.connectmgr;

import java.io.PrintWriter;
import java.util.ArrayList;
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
import com.cabletech.res.entity.publicmgr.OdmEntity;
import com.cabletech.res.service.connectmgr.ConnectService;
import com.cabletech.res.service.opticcablemgr.GldlyService;
import com.cabletech.res.service.publicmgr.OdmService;

/**
 * 连接管理Action(成端、跳纤、熔纤)
 * 
 * @author Lv Renzhao 2012-06-27
 */
@SuppressWarnings("serial")
@Namespace("/res/connectmgr")
@Results( { @Result(name = "list", location = "/res/connectmgr/connect_list.jsp") })
@Action("connect")
public class ConnectAction extends BaseAction {

	@Resource(name = "connectServiceImpl")
	private ConnectService connectService;
	@Resource(name = "odmServiceImpl") //ODM
	private OdmService odmservice;
	@Resource(name = "gldlyServiceImpl") //光缆段
	private GldlyService gldlyservice;
	
	@Override
	public String execute() {
		String xtbh = request.getParameter("xtbh");
		request.setAttribute("xtbh", xtbh);
		String zylx = request.getParameter("zylx");
		request.setAttribute("zylx", zylx);
		return "list";
	}
	
	/**
	 * 跳纤表格数据
	 */
	public void p2pListJson(){
		String xtbh = request.getParameter("xtbh");
		String zylx = request.getParameter("zylx");
		String ctype="AA201";
		if(StringUtils.isNotBlank(zylx) && !zylx.equals("AA005") && !zylx.equals("AD701")){
			Map<String,Object> params = new HashMap<String, Object>();
			params.put("xtbh", xtbh);
			params.put("zylx", zylx);
			params.put("ctype", ctype);
			if(zylx.equals("AD703")){
				OdmEntity odm = odmservice.getbyid(xtbh);
				params.put("parenttype", odm.getSssblx());
			}
			Map<String, Object> map = connectService.queryPageMap("getPortConnects", params, super.getPage(), super.getLimit());
			convertpagemaptojson(map);
		}
	}
	
	/**
	 * 成端表格数据
	 */
	public void p2lListJson(){
		String xtbh = request.getParameter("xtbh");
		String zylx = request.getParameter("zylx");
		String ctype="AA203";
		if(StringUtils.isNotBlank(zylx) && !zylx.equals("AA005") && !zylx.equals("AD701")){
			Map<String,Object> params = new HashMap<String, Object>();
			params.put("xtbh", xtbh);
			params.put("zylx", zylx);
			params.put("ctype", ctype);
			if(zylx.equals("AD703")){
				OdmEntity odm = odmservice.getbyid(xtbh);
				params.put("parenttype", odm.getSssblx());
			}
			Map<String, Object> map = connectService.queryPageMap("getPortConnects", params, super.getPage(), super.getLimit());
			convertpagemaptojson(map);
		}
	}
	
	/**
	 * 熔纤表格数据
	 */
	public void l2lListJson(){
		String xtbh = request.getParameter("xtbh");
		String zylx = request.getParameter("zylx");
		Map<String,Object> params = new HashMap<String, Object>();
		params.put("xtbh", xtbh);
		params.put("zylx", zylx);
		Map<String, Object> map = connectService.queryPageMap("getLineConnects", params, super.getPage(), super.getLimit());
		convertpagemaptojson(map);
	}
	
	/**
	 * 资源树数据
	 */
	public void resTreeJson(){
		String xtbh = request.getParameter("xtbh");
		String zylx = request.getParameter("zylx");
		List<Map<String,Object>> treeData = connectService.getResTree(xtbh, zylx);
		super.outPutJson(treeData);
	}
	
	/**
	 * 光缆列表数据
	 */
	public void lineListJson(){
		String xtbh = request.getParameter("xtbh");
		String zylx = request.getParameter("zylx");
		Map<String,Object> params = new HashMap<String, Object>();
		params.put("xtbh", xtbh);
		params.put("zylx", zylx);
		Map<String, Object> map = gldlyservice.queryPageMap("getByIdByType", params, super.getPage(), super.getLimit());
		convertpagemaptojson(map);
	}
	
	/**
	 * 获取xml格式的面板图数据
	 */
	public void panelXML(){
		String lid = request.getParameter("lid");
		String ltype = request.getParameter("ltype");
		String rid=request.getParameter("rid");
		String rtype=request.getParameter("rtype");
		String tid=request.getParameter("tid");
		String ttype=request.getParameter("ttype");
		String xmlData = connectService.constructPanel(lid, ltype, rid, rtype,tid,ttype);
		super.outPutXML(xmlData);
	}
	
	/**
	 * 接受客户端回传的xml数据解析并保存对应的关系
	 */
	public void saveConnect(){
		String xml = request.getParameter("topoXml");
		String lid = request.getParameter("lid");
		String ltype = request.getParameter("ltype");
		String rid = request.getParameter("rid");
		String rtype = request.getParameter("rtype");
		String tid = request.getParameter("tid");
		String ttype = request.getParameter("ttype");
		connectService.saveConnects(xml,lid,ltype,rid,rtype,tid,ttype);
	}
	
	/**
	 * 删除成端、跳纤、熔纤连接
	 */
	public void deleteConnects(){
		String zylx = request.getParameter("zylx");
		String xtbhs = request.getParameter("xtbhs");
		String ctype = request.getParameter("ctype");
		String[] arr_xtbh = xtbhs.split(",");
		if("AA202".equals(ctype)){
			for(String xtbh : arr_xtbh){
				connectService.deleteLineConnect(xtbh);
			}
		}else{
			for(String xtbh : arr_xtbh){
				connectService.deletePortConnect(xtbh, zylx, ctype);
			}
		}
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
