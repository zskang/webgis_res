package com.cabletech.res.entity.opticcablemgr;

import com.cabletech.res.entity.basemgr.BaseEntity;

/**
 * 光缆盘留由实体
 * 
 * @author zhanglei 2012-05-09
 */
public class GlplEntity extends BaseEntity{

	private static final long serialVersionUID = 1L;

	private String zymc;//盘留点名称
	private String ssgld;//所属光缆段
	private String pldxh;//盘留点序号
	private String szsslx;//所在设施类型
	private String szssmc;//所在设施名称
	private String lon;//经度
	private String lat;//纬度
	private String plsj;//盘留长度
	private String regionid;//区域
	private String createdate;//新增时间
	private String orgid;//组织ID
	private String ewm;//二维码
	private String status;//状态值
	
	public String getZymc() {
		return zymc;
	}
	public void setZymc(String zymc) {
		this.zymc = zymc;
	}
	public String getSsgld() {
		return ssgld;
	}
	public void setSsgld(String ssgld) {
		this.ssgld = ssgld;
	}
	public String getPldxh() {
		return pldxh;
	}
	public void setPldxh(String pldxh) {
		this.pldxh = pldxh;
	}
	public String getLon() {
		return lon;
	}
	public void setLon(String lon) {
		this.lon = lon;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getPlsj() {
		return plsj;
	}
	public void setPlsj(String plsj) {
		this.plsj = plsj;
	}
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
	public String getOrgid() {
		return orgid;
	} 
	public void setOrgid(String orgid) {
		this.orgid = orgid;
	}
	public String getEwm() {
		return ewm;
	}
	public void setEwm(String ewm) {
		this.ewm = ewm;
	}
	public String getStatus() {
		return status;
	}
	public String getRegionid() {
		return regionid;
	}
	public void setRegionid(String regionid) {
		this.regionid = regionid;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getSzsslx() {
		return szsslx;
	}
	public void setSzsslx(String szsslx) {
		this.szsslx = szsslx;
	}
	public String getSzssmc() {
		return szssmc;
	}
	public void setSzssmc(String szssmc) {
		this.szssmc = szssmc;
	}
	
}
