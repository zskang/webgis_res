package com.cabletech.res.entity.basemgr;

/**
 * 挂墙信息实体类
 * 
 * @author zhanglei 2012-05-09
 */
public class GqxxEntity extends BaseEntity{

	private static final long serialVersionUID = 1L;

	private String ymc; //原名称
	private String dz; //地址
	private String cqxz; //产权性质
	private String sszt; //设施状态
	private String whfs; //维护方式
	private String yt; //用途
	private String isdanger; //是否危险点
	private String ssglq; //所属管理区
	private String lon; //经度
	private String lat; //纬度
	private String regionid; //所属区域
	private String ewm; //二维码
	private String orgid; //组织ID
	private String createdate;//采集时间
	
	public String getOrgid() {
		return orgid;
	}
	public void setOrgid(String orgid) {
		this.orgid = orgid;
	}
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
	public String getYmc() {
		return ymc;
	}
	public void setYmc(String ymc) {
		this.ymc = ymc;
	}
	public String getDz() {
		return dz;
	}
	public void setDz(String dz) {
		this.dz = dz;
	}
	public String getCqxz() {
		return cqxz;
	}
	public void setCqxz(String cqxz) {
		this.cqxz = cqxz;
	}
	public String getSszt() {
		return sszt;
	}
	public void setSszt(String sszt) {
		this.sszt = sszt;
	}
	public String getWhfs() {
		return whfs;
	}
	public void setWhfs(String whfs) {
		this.whfs = whfs;
	}
	public String getYt() {
		return yt;
	}
	public void setYt(String yt) {
		this.yt = yt;
	}
	public String getIsdanger() {
		return isdanger;
	}
	public void setIsdanger(String isdanger) {
		this.isdanger = isdanger;
	}
	public String getSsglq() {
		return ssglq;
	}
	public void setSsglq(String ssglq) {
		this.ssglq = ssglq;
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
	public String getRegionid() {
		return regionid;
	}
	public void setRegionid(String regionid) {
		this.regionid = regionid;
	}
	public String getEwm() {
		return ewm;
	}
	public void setEwm(String ewm) {
		this.ewm = ewm;
	}
	
}
