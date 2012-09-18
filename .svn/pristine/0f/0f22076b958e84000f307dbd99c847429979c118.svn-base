package com.cabletech.res.action.connectmgr;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import com.cabletech.core.action.BaseAction;
import com.cabletech.res.entity.cableequipmgr.GfxxEntity;
import com.cabletech.res.entity.cableequipmgr.GzdhEntity;
import com.cabletech.res.entity.opticcablemgr.GldlyEntity;
import com.cabletech.res.entity.publicmgr.OdmEntity;
import com.cabletech.res.service.cableequipmgr.GfxxService;
import com.cabletech.res.service.cableequipmgr.GjjxService;
import com.cabletech.res.service.cableequipmgr.GjtService;
import com.cabletech.res.service.cableequipmgr.GzdhService;
import com.cabletech.res.service.connectmgr.ConnectService;
import com.cabletech.res.service.connectmgr.PconnectService;
import com.cabletech.res.service.opticcablemgr.GldlyService;
import com.cabletech.res.service.publicmgr.OdmService;

/**
 * 批量连接管理Action(成端、跳纤、熔纤)
 * 
 * @author Lv Renzhao 2012-07-17
 */
@SuppressWarnings("serial")
@Namespace("/res/connectmgr")
@Results( { @Result(name = "input", location = "/res/connectmgr/pconnect_input.jsp") })
@Action("pconnect")
public class PconnectAction extends BaseAction {

	@Resource(name = "pconnectServiceImpl")
	private PconnectService pconnectService;
	
	/**
	 * 批量新增入口点 
	 */
	public String execute() {
		String lid = request.getParameter("lid");
		request.setAttribute("lid", lid);
		String ltype = request.getParameter("ltype");
		request.setAttribute("ltype", ltype);
		String left_zymc = pconnectService.getZYMC(lid,ltype);
		request.setAttribute("left_zymc", left_zymc);
		String rid = request.getParameter("rid");
		request.setAttribute("rid", rid);
		String rtype = request.getParameter("rtype");
		request.setAttribute("rtype", rtype);
		String right_zymc = pconnectService.getZYMC(rid,rtype);
		request.setAttribute("right_zymc", right_zymc);
		String tid = request.getParameter("tid");
		request.setAttribute("tid", tid);
		String ttype = request.getParameter("ttype");
		request.setAttribute("ttype", ttype);
		List<Map<String,Object>> left_bh = pconnectService.getBH(lid,ltype,tid,ttype);
		List<Map<String,Object>> right_bh = pconnectService.getBH(rid,rtype,tid,ttype);
		request.setAttribute("left_bh", left_bh);
		request.setAttribute("right_bh", right_bh);
		return "input";
	}
	
	/**
	 * 批量新增保存
	 */
	public void save(){
		String lid = request.getParameter("lid");
		String ltype = request.getParameter("ltype");
		String rid = request.getParameter("rid");
		String rtype = request.getParameter("rtype");
		String tid = request.getParameter("tid");
		String ttype = request.getParameter("ttype");
		String l_s = request.getParameter("l_s");
		String l_e = request.getParameter("l_e");
		String r_s = request.getParameter("r_s");
		String r_e = request.getParameter("r_e");
		pconnectService.save(lid, ltype, rid, rtype, tid, ttype, l_s, l_e, r_s, r_e);
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
