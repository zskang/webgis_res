package com.cabletech.res.entity.boardfibermgr;

/**
 * 成端熔纤实体
 * @author Administrator
 *
 */
public class DzConnEntity {
	private String xtbh;//系统编号
	private String sssb;//所属设备系统编号
	private String sssblx;//所属设备类型
	private String ssodm;//所属ODM系统编号
	private String dzbh;//端子编号
	private String portname;//端子名称
	private String to_classid;//z端类型
	private String to_id;//z端系统编号
	private String to_firstunit;//z端纤芯号
	
	private String connector_type;//连接设备类型
	private String connector_id;//连接设备编号
	private String from_id;//A端设备系统编号
	private String from_firstunit;//A端纤芯号
	
	private String gld;//光缆端系统编号
	private String unit;//纤芯号
	
	private String tableconnname;//设备成端表
	
	public String getTableconnname() {
		return tableconnname;
	}
	public void setTableconnname(String tableconnname) {
		this.tableconnname = tableconnname;
	}
	public String getConnector_id() {
		return connector_id;
	}
	public void setConnector_id(String connector_id) {
		this.connector_id = connector_id;
	}
	public String getConnector_type() {
		return connector_type;
	}
	public void setConnector_type(String connector_type) {
		this.connector_type = connector_type;
	}
	public String getDzbh() {
		return dzbh;
	}
	public void setDzbh(String dzbh) {
		this.dzbh = dzbh;
	}
	public String getFrom_firstunit() {
		return from_firstunit;
	}
	public void setFrom_firstunit(String from_firstunit) {
		this.from_firstunit = from_firstunit;
	}
	public String getFrom_id() {
		return from_id;
	}
	public void setFrom_id(String from_id) {
		this.from_id = from_id;
	}
	public String getSssb() {
		return sssb;
	}
	public void setSssb(String sssb) {
		this.sssb = sssb;
	}
	public String getTo_classid() {
		return to_classid;
	}
	public void setTo_classid(String to_classid) {
		this.to_classid = to_classid;
	}
	public String getTo_firstunit() {
		return to_firstunit;
	}
	public void setTo_firstunit(String to_firstunit) {
		this.to_firstunit = to_firstunit;
	}
	public String getTo_id() {
		return to_id;
	}
	public void setTo_id(String to_id) {
		this.to_id = to_id;
	}
	public String getXtbh() {
		return xtbh;
	}
	public void setXtbh(String xtbh) {
		this.xtbh = xtbh;
	}
	public String getSsodm() {
		return ssodm;
	}
	public void setSsodm(String ssodm) {
		this.ssodm = ssodm;
	}
	public String getSssblx() {
		return sssblx;
	}
	public void setSssblx(String sssblx) {
		this.sssblx = sssblx;
	}
	public String getGld() {
		return gld;
	}
	public void setGld(String gld) {
		this.gld = gld;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}

	@Override
	public String toString(){
		return getTo_id()+"====="+getTo_firstunit();
	}
	public String getPortname() {
		return portname;
	}
	public void setPortname(String portname) {
		this.portname = portname;
	}
	
}
