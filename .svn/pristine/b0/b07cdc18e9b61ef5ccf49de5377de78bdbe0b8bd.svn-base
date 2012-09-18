package com.cabletech.res.action.boardfibermgr;

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
import com.cabletech.baseinfo.business.entity.UserInfo;
import com.cabletech.core.action.BaseAction;
import com.cabletech.res.entity.boardfibermgr.JxgxllzEntity;
import com.cabletech.res.service.boardfibermgr.JxgxllzService;

/**
 * 局向光纤链路组
 * @author Administrator
 *
 */
@SuppressWarnings("serial")
@Namespace("/res/boardfibermgr")
@Results( {
	@Result(name = "input", location = "/res/boardfibermgr/jxgxllz/jxgxllz_input.jsp"),
	@Result(name = "list", location = "/res/boardfibermgr/jxgxllz/jxgxllz_list.jsp")})
@Action("jxgxllz")
public class JxgxllzAction extends BaseAction {
	
	private JxgxllzEntity entity;

	@Resource(name = "jxgxllzServiceImpl")
	private JxgxllzService jxgxllzservice;	
	
	/**
	 * 获取链路组列表
	 * @return
	 * @throws Exception
	 */
	public String list() throws Exception {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		String condition = entity.getSerializeQueryCondition();
		if (StringUtils.isBlank(condition)) {
			condition = request.getQueryString();
		}
		Map<String, Object> conditionMap = super.getDecodeCondtionMap(condition, user);
		Map<String, Object> json = jxgxllzservice.queryPageMap("queryJxgxllzList",conditionMap, super.getPage("page"), super.getLimit("rows"));
		request.setAttribute("map", json);
		// 转换为列表参数
		request.setAttribute("condition", condition);
		request.setAttribute("searchCondition", conditionMap);
		return "list";		
	}
	
	/**
	 * 删除
	 * @return
	 * @throws Exception
	 */
	public String delete()throws Exception{
		String xtbh = super.getParameterValue("xtbhs");
		boolean flag = false;
		if(xtbh.indexOf(",")==-1){
			flag = jxgxllzservice.delete(xtbh);
		}else{
			flag = jxgxllzservice.batchDelete(xtbh);
		}
		if(flag){
			super.outmessage("删除成功！");
		}else{
			super.outmessage("删除失败！");
		}
		return null;
	}
	
	/**
	 * 链路组保存
	 * @return view 查看页面
	 * @throws Exception
	 */	
	public String save(){
		String toPage;
		if(StringUtils.isNotBlank(entity.getXtbh())){
			toPage = "view";
		}else{
			toPage = "input";
		}			
		if(jxgxllzservice.saveorupdate(entity)){
			if(toPage.equals("input")){
				entity = new JxgxllzEntity();
				entity.setActionMessage("新增成功!");
			}			
		}else{
			entity = new JxgxllzEntity();
			entity.setActionMessage("新增失败!");
		}
		request.setAttribute("entity", entity);
		return toPage;
	}
	
	/**
	 * 获取链路组信息
	 * @return
	 * @throws Exception
	 */
	public String getJxgxllz()throws Exception{
		response.setContentType("application/html;charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache");		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("llzmc", "");
		List<Map<String, Object>> list = jxgxllzservice.queryJxgxllzList(map);
		StringBuffer buffer = new StringBuffer();
		if(list != null && list.size()>0){
			PrintWriter out = response.getWriter();
			for(Map<String, Object> l:list){
				buffer.append("\""+l.get("ID")+"\":\""+l.get("LLZMC")+"\",");
			}
			out.print(buffer.toString().substring(0, buffer.toString().length()-1));
			out.flush();
		}
		return null;
	}
	

	@Override
	public String execute() {
		return null;
	}

	@Override
	public JxgxllzEntity getModel() {
		if(entity == null){
			entity = new JxgxllzEntity();
		}
		return entity;
	}

	@Override
	protected void prepareSaveModel() throws Exception {
		
	}

	@Override
	protected void prepareViewModel() throws Exception {
		String id = request.getParameter("id");// 获取资源id
		request.setAttribute("tipview", super.getParameterValue("tipview"));//tip 视图显示
		if (StringUtils.isNotBlank(id)) {
			entity = jxgxllzservice.getbyid(id);
			request.setAttribute("entity", entity);
		} else {
			entity = new JxgxllzEntity();
		}		
	}
	
}
