package com.cabletech.res.entity.publicmgr;

import com.cabletech.res.entity.basemgr.BaseEntity;

/**
 * NodeB之实体
 * @author wangt
 *
 */
public class NodeBEntity extends BaseEntity{

	private static final long serialVersionUID = 1L;
	
	//系统编号
	private String nodeid;
	//站点名称
	private String zdmc;
	//机房名称
	private String jfmc;
	//机房id
	private String roomid;
	//站点id
	private String siteid;
	//资源管理id
	private String irmsid;
	//OMC中网元名称
	private String nename;
	//中文名称
	private String cnname;
	//所属RNC
	private String rncid;
	//传输类型
	private String transfertype;
	//频段
	private String band;
	//基站类型（蜂窝类型）
	private String bstype;
	//VIP标志
	private String bslevel;
	//设备型号
	private String devicemodel;
	//网元状态
	private String state;
	//设备厂家
	private String producer;
	//开通时间
	private String openingtime;
	
	
	public String getNodeid() {
		return nodeid;
	}
	public void setNodeid(String nodeid) {
		this.nodeid = nodeid;
	}
	public String getRoomid() {
		return roomid;
	}
	public void setRoomid(String roomid) {
		this.roomid = roomid;
	}
	public String getSiteid() {
		return siteid;
	}
	public void setSiteid(String siteid) {
		this.siteid = siteid;
	}
	public String getIrmsid() {
		return irmsid;
	}
	public void setIrmsid(String irmsid) {
		this.irmsid = irmsid;
	}
	public String getNename() {
		return nename;
	}
	public void setNename(String nename) {
		this.nename = nename;
	}
	public String getCnname() {
		return cnname;
	}
	public void setCnname(String cnname) {
		this.cnname = cnname;
	}
	public String getRncid() {
		return rncid;
	}
	public void setRncid(String rncid) {
		this.rncid = rncid;
	}
	public String getTransfertype() {
		return transfertype;
	}
	public void setTransfertype(String transfertype) {
		this.transfertype = transfertype;
	}
	public String getBand() {
		return band;
	}
	public void setBand(String band) {
		this.band = band;
	}
	public String getBstype() {
		return bstype;
	}
	public void setBstype(String bstype) {
		this.bstype = bstype;
	}
	public String getBslevel() {
		return bslevel;
	}
	public void setBslevel(String bslevel) {
		this.bslevel = bslevel;
	}
	public String getDevicemodel() {
		return devicemodel;
	}
	public void setDevicemodel(String devicemodel) {
		this.devicemodel = devicemodel;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getProducer() {
		return producer;
	}
	public void setProducer(String producer) {
		this.producer = producer;
	}
	public String getOpeningtime() {
		return openingtime;
	}
	public void setOpeningtime(String openingtime) {
		this.openingtime = openingtime;
	}
	public String getZdmc() {
		return zdmc;
	}
	public void setZdmc(String zdmc) {
		this.zdmc = zdmc;
	}
	public String getJfmc() {
		return jfmc;
	}
	public void setJfmc(String jfmc) {
		this.jfmc = jfmc;
	}

}
