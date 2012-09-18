package com.cabletech.core.common;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.commons.lang.StringUtils;
import org.springframework.web.context.support.WebApplicationContextUtils;
import com.cabletech.core.service.ResCommonTagService;

/**
 * 自定义显示标签
 * @author Administrator
 *
 */
public class ResCommonTag extends TagSupport {

	private static final long serialVersionUID = 1L;
	private String keyValue;//主键字段值
	private String keyColumn;//主键字段名称
	private String displayName;//显示字段名称
	private String tableName;//表名称
	private String resType;//资源类型

	/**
	 * 自定义标签
	 */
	public int doStartTag() throws JspException {
		ResCommonTagService service = (ResCommonTagService)WebApplicationContextUtils.getWebApplicationContext(pageContext.getServletContext()).getBean("resCommonTagServiceImpl");
		JspWriter out = pageContext.getOut();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyValue", keyValue);
		map.put("keyColumn", keyColumn==null?"xtbh":keyColumn);
		map.put("displayName", displayName==null?"zymc":displayName);
		//优先根据资源类型获取资源表名
		map.put("tableName", resType==null?tableName:getTableNameByResType(resType));
		try{
			String s=null;
			if(StringUtils.isNotBlank(resType) || StringUtils.isNotBlank(tableName)){
				s=service.getKeyColumnDisplayName(map);
			}
			out.print(s==null?"":s);
		}catch (Exception e) {
			throw new JspTagException(e.getMessage());
		}
		return SKIP_BODY;
	}	
	
	/**
	 * 根据资源类型获取资源表名
	 * @param restype 资源类型
	 * @return
	 */
	public String getTableNameByResType(String restype){
		String[] restypes = {"A20","A21","A22","A23","AD701","AD702","AD703","AD704","AD706","AA001","AA003","AA004","AA005","AA006"};
		String[] restables = {"res_dgxx","res_gjxx","RES_BSXX","RES_GQXX","RES_JF","RES_ODF","RES_ODM","RES_DXJXS","RES_GLPL","RES_ODF","RES_GJJX","RES_GFXX","RES_GJT","RES_GZDH"};
		String temptablename="";
		for(int i=0; i<restypes.length; i++){
			if(restype.toUpperCase().equals(restypes[i])){
				temptablename = restables[i];break;
			}
		}
		return temptablename;
	}
	
	public String getDisplayName() {
		return displayName;
	}

	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}

	public String getKeyColumn() {
		return keyColumn;
	}

	public void setKeyColumn(String keyColumn) {
		this.keyColumn = keyColumn;
	}

	public String getKeyValue() {
		return keyValue;
	}

	public void setKeyValue(String keyValue) {
		this.keyValue = keyValue;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public String getTableName() {
		return tableName;
	}
	
	public String getResType() {
		return resType;
	}

	public void setResType(String resType) {
		this.resType = resType;
	}	
	/**
	 * 自定义标签
	 */
	public int doEndTag() throws JspException {
		return 0;
	}

}
