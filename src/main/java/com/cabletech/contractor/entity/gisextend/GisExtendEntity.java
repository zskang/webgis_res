package com.cabletech.contractor.entity.gisextend;

/**
 * Gis 扩展实体类
 * @author Administrator
 *
 */
public class GisExtendEntity implements java.io.Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String tablename;// 表名
	private String keycolumn;// 主键字段名
	private String keycolumnValue;// 主键字段值
	private String titlecolumn;// 标题字段名
	private String titlecolumnValue;// 标题字段值
	private String remarkcolumn;// 标题字段名
	private String remarkcolumnValue;// 标题字段值
	private String graphictype;// 绘制类型
	private String xy;// xy 串值
	private String userid;

	public String getTablename() {
		return tablename;
	}

	public void setTablename(String tablename) {
		this.tablename = tablename;
	}

	public String getTitlecolumnValue() {
		return titlecolumnValue;
	}

	public void setTitlecolumnValue(String titlecolumnValue) {
		this.titlecolumnValue = titlecolumnValue;
	}

	public String getKeycolumnValue() {
		return keycolumnValue;
	}

	public void setKeycolumnValue(String keycolumnValue) {
		this.keycolumnValue = keycolumnValue;
	}

	public String getRemarkcolumnValue() {
		return remarkcolumnValue;
	}

	public void setRemarkcolumnValue(String remarkcolumnValue) {
		this.remarkcolumnValue = remarkcolumnValue;
	}

	public String getKeycolumn() {
		return keycolumn;
	}

	public void setKeycolumn(String keycolumn) {
		this.keycolumn = keycolumn;
	}

	public String getTitlecolumn() {
		return titlecolumn;
	}

	public void setTitlecolumn(String titlecolumn) {
		this.titlecolumn = titlecolumn;
	}

	public String getRemarkcolumn() {
		return remarkcolumn;
	}

	public void setRemarkcolumn(String remarkcolumn) {
		this.remarkcolumn = remarkcolumn;
	}

	public String getGraphictype() {
		return graphictype;
	}

	public void setGraphictype(String graphictype) {
		this.graphictype = graphictype;
	}

	public String getXy() {
		return xy;
	}

	public void setXy(String xy) {
		this.xy = xy;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

}
