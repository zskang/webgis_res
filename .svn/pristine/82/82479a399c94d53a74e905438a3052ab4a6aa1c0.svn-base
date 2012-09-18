package com.cabletech.res.action.index;


import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import com.cabletech.core.action.BaseAction;

/**
 * 泡泡简单属性查看
 * 
 * @author Lv Renzhao 2012-06-14
 * 
 */
@SuppressWarnings("serial")
@Namespace("/res")
@Results({ 
	    @Result(name = "popup", location = "/popup.jsp")
		})
@Action("popup")
public class Popup extends BaseAction {
	/**
	 * 查看属性pop
	 */
	@Override
	public String execute() {
		String zylx = request.getParameter("type");
		String xtbh = request.getParameter("id");
		return "popup";
	}
	
	@Override
	protected void prepareViewModel() throws Exception {}

	@Override
	protected void prepareSaveModel() throws Exception {}

	@Override
	public Object getModel() {
		return null;
	}
}
