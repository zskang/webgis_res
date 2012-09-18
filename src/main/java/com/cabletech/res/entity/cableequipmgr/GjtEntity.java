package com.cabletech.res.entity.cableequipmgr;

import com.cabletech.res.entity.basemgr.BaseEntity;

/**
 * 光接头信息实体类
 * 
 * @author wangt 2012-05-21
 */
public class GjtEntity extends BaseEntity{

	private static final long serialVersionUID = 1L;

	private String gjtbh; // 光接头编号
	private String ymc; // 原名称
	private String gdzcbh; // 固定资产编号
	private String ggxh; // 规格型号
	private String jtlx; // 接头类型
	private String ywjb; // 业务级别
	private String sszt; // 设施状态
	private String whfs; // 维护方式
	private String cqxz; // 产权性质
	private String azfs; // 安装方式
	private String sssslx; // 所在设施类型
	private String ssssmc; // 所属设施名称
	private String ssgl; // 所属光缆
	private String xh; // 序号
	private String ssglq; // 所属管理区
	private String ssgc; // 所属工程
	private String zjdw; // 主建单位
	private String cjwd; // 参见单位
	private String lon; // 经度
	private String lat; // 纬度
	private String regionid;//区域ID
	private String createdate; // 采集时间
	private String orgid; // 采集单位
	private String ewm; // 二维码
	private String shape; // SHAPE
	private String status; // 是否删除
	private String simid;//SIM卡号
	private String starttime; //采集开始时间｛查询用｝
	private String endtime; //采集结束时间｛查询用｝
 
	public String getGjtbh() {
		return gjtbh;
	}
	public void setGjtbh(String gjtbh) {
		this.gjtbh = gjtbh;
	}
	public String getYmc() {
		return ymc;
	}
	public void setYmc(String ymc) {
		this.ymc = ymc;
	}
	public String getGdzcbh() {
		return gdzcbh;
	}
	public void setGdzcbh(String gdzcbh) {
		this.gdzcbh = gdzcbh;
	}
	public String getGgxh() {
		return ggxh;
	}
	public void setGgxh(String ggxh) {
		this.ggxh = ggxh;
	}
	public String getJtlx() {
		return jtlx;
	}
	public void setJtlx(String jtlx) {
		this.jtlx = jtlx;
	}
	public String getYwjb() {
		return ywjb;
	}
	public void setYwjb(String ywjb) {
		this.ywjb = ywjb;
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
	public String getCqxz() {
		return cqxz;
	}
	public void setCqxz(String cqxz) {
		this.cqxz = cqxz;
	}
	public String getAzfs() {
		return azfs;
	}
	public void setAzfs(String azfs) {
		this.azfs = azfs;
	}
	public String getSssslx() {
		return sssslx;
	}
	public void setSssslx(String sssslx) {
		this.sssslx = sssslx;
	}
	public String getSsssmc() {
		return ssssmc;
	}
	public void setSsssmc(String ssssmc) {
		this.ssssmc = ssssmc;
	}
	public String getSsgl() {
		return ssgl;
	}
	public void setSsgl(String ssgl) {
		this.ssgl = ssgl;
	}
	public String getXh() {
		return xh;
	}
	public void setXh(String xh) {
		this.xh = xh;
	}
	public String getSsglq() {
		return ssglq;
	}
	public void setSsglq(String ssglq) {
		this.ssglq = ssglq;
	}
	public String getSsgc() {
		return ssgc;
	}
	public void setSsgc(String ssgc) {
		this.ssgc = ssgc;
	}
	public String getZjdw() {
		return zjdw;
	}
	public void setZjdw(String zjdw) {
		this.zjdw = zjdw;
	}
	public String getCjwd() {
		return cjwd;
	}
	public void setCjwd(String cjwd) {
		this.cjwd = cjwd;
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
	public String getShape() {
		return shape;
	}
	public void setShape(String shape) {
		this.shape = shape;
	}
	public String getSimid() {
		return simid;
	}
	public void setSimid(String simid) {
		this.simid = simid;
	}
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public String getEndtime() {
		return endtime;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	public String getRegionid() {
		return regionid;
	}
	public void setRegionid(String regionid) {
		this.regionid = regionid;
	}
	
}
