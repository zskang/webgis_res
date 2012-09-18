package com.cabletech.res.entity.basemgr;

/**
 * 标石信息实体类
 * 
 * @author zhanglei 2012-05-09
 */
public class BsxxEntity extends BaseEntity{

	private static final long serialVersionUID = 1L;

	private String ymc; // 原名称
	private String dlmc; // 道路名称
	private String mp; // 门牌
	private String sszt; // 设施状态
	private String cqxz; // 产权性质
	private String jtwz; // 具体位置
	private String bsyt; // 标石用途
	private String whfs; // 维护方式
	private String bsjtlx; // 标石类型
	private String sfwxd; // 是否危险点
	private String ms; // 埋深
	private String ssglq; // 所属管理区
	private String orgid; // 组织ID
	private String createdate;// 采集时间
	private String simid;// SIM卡号
	private String begintime;// 采集开始时间
	private String endtime;// 采集结束时间

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

	private String sydw; // 使用单位
	private String lon; // 经度
	private String lat; // 纬度
	private String regionid; // 所属地市
	private String ewm; // 二维码


	public String getYmc() {
		return ymc;
	}

	public void setYmc(String ymc) {
		this.ymc = ymc;
	}

	public String getDlmc() {
		return dlmc;
	}

	public void setDlmc(String dlmc) {
		this.dlmc = dlmc;
	}

	public String getMp() {
		return mp;
	}

	public void setMp(String mp) {
		this.mp = mp;
	}

	public String getSszt() {
		return sszt;
	}

	public void setSszt(String sszt) {
		this.sszt = sszt;
	}

	public String getCqxz() {
		return cqxz;
	}

	public void setCqxz(String cqxz) {
		this.cqxz = cqxz;
	}

	public String getJtwz() {
		return jtwz;
	}

	public void setJtwz(String jtwz) {
		this.jtwz = jtwz;
	}

	public String getBsyt() {
		return bsyt;
	}

	public void setBsyt(String bsyt) {
		this.bsyt = bsyt;
	}

	public String getWhfs() {
		return whfs;
	}

	public void setWhfs(String whfs) {
		this.whfs = whfs;
	}

	public String getBsjtlx() {
		return bsjtlx;
	}

	public void setBsjtlx(String bsjtlx) {
		this.bsjtlx = bsjtlx;
	}

	public String getSfwxd() {
		return sfwxd;
	}

	public void setSfwxd(String sfwxd) {
		this.sfwxd = sfwxd;
	}

	public String getMs() {
		return ms;
	}

	public void setMs(String ms) {
		this.ms = ms;
	}

	public String getSsglq() {
		return ssglq;
	}

	public void setSsglq(String ssglq) {
		this.ssglq = ssglq;
	}

	public String getSydw() {
		return sydw;
	}

	public void setSydw(String sydw) {
		this.sydw = sydw;
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

	public String getSimid() {
		return simid;
	}

	public void setSimid(String simid) {
		this.simid = simid;
	}

	public String getBegintime() {
		return begintime;
	}

	public void setBegintime(String begintime) {
		this.begintime = begintime;
	}

	public String getEndtime() {
		return endtime;
	}

	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}

}
