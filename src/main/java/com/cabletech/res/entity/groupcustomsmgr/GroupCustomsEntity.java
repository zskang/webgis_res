package com.cabletech.res.entity.groupcustomsmgr;

import com.cabletech.res.entity.basemgr.BaseEntity;

/**
 * 集团客户信息实体类
 * 
 * @author wangt 2012-05-21
 */
public class GroupCustomsEntity extends BaseEntity{

	private static final long serialVersionUID = 1L;

	private String groupid; // 集团编号
	private String groupname; // 集团名称
	private String ymc; // 原名称
	private String groupaddr; // 集团地址
	private String grouptype; // 集团客户类型
	private String regionid; // 所属地市
	private String countyid; // 所属县区
	private String lon; // 经度
	private String lat; // 纬度
	private String jkblxr; // 集客部联系人
	private String jkblxdh; // 集客部联系电话
	private String khjl; // 客户经理
	private String khjldh; // 客户经理电话
	private String createtime; // 采集时间
	private String jrfs; // 接入方式
	private String czywxx; // 承载业务
	private String gsjrdmc; // 归属接入点名称
	private String sbgs; // 设备归属
	private String khlb; // 客户类别
	private String zyjb; // 重要级别
	private String shape; // 
	private String remark; // 备注
	private String status; // 是否删除
	private String orgid;//组织ID
	private String simid;//SIM卡号
	
	private String starttime; //采集开始时间｛查询用｝
	private String endtime; //采集结束时间｛查询用｝
	
	public String getGroupid() {
		return groupid;
	}
	public void setGroupid(String groupid) {
		this.groupid = groupid;
	}
	public String getYmc() {
		return ymc;
	}
	public void setYmc(String ymc) {
		this.ymc = ymc;
	}
	public String getGroupaddr() {
		return groupaddr;
	}
	public void setGroupaddr(String groupaddr) {
		this.groupaddr = groupaddr;
	}
	public String getGrouptype() {
		return grouptype;
	}
	public void setGrouptype(String grouptype) {
		this.grouptype = grouptype;
	}
	public String getRegionid() {
		return regionid;
	} 
	public void setRegionid(String regionid) {
		this.regionid = regionid;
	}
	public String getCountyid() {
		return countyid;
	}
	public void setCountyid(String countyid) {
		this.countyid = countyid;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getLon() {
		return lon;
	}
	public void setLon(String lon) {
		this.lon = lon;
	}
	public String getJkblxr() {
		return jkblxr;
	}
	public void setJkblxr(String jkblxr) {
		this.jkblxr = jkblxr;
	}
	public String getJkblxdh() {
		return jkblxdh;
	}
	public void setJkblxdh(String jkblxdh) {
		this.jkblxdh = jkblxdh;
	}
	public String getKhjl() {
		return khjl;
	}
	public void setKhjl(String khjl) {
		this.khjl = khjl;
	}
	public String getKhjldh() {
		return khjldh;
	}
	public void setKhjldh(String khjldh) {
		this.khjldh = khjldh;
	}
	public String getCreatetime() {
		return createtime;
	}
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getOrgid() {
		return orgid;
	}
	public void setOrgid(String orgid) {
		this.orgid = orgid;
	}
	public String getJrfs() {
		return jrfs;
	}
	public void setJrfs(String jrfs) {
		this.jrfs = jrfs;
	}
	public String getCzywxx() {
		return czywxx;
	}
	public void setCzywxx(String czywxx) {
		this.czywxx = czywxx;
	}
	public String getGsjrdmc() {
		return gsjrdmc;
	}
	public void setGsjrdmc(String gsjrdmc) {
		this.gsjrdmc = gsjrdmc;
	}
	public String getSbgs() {
		return sbgs;
	} 
	public void setSbgs(String sbgs) {
		this.sbgs = sbgs;
	}
	public String getShape() {
		return shape;
	}
	public void setShape(String shape) {
		this.shape = shape;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
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
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	public String getKhlb() {
		return khlb;
	}
	public void setKhlb(String khlb) {
		this.khlb = khlb;
	}
	public String getZyjb() {
		return zyjb;
	}
	public void setZyjb(String zyjb) {
		this.zyjb = zyjb;
	}
	public String getGroupname() {
		return groupname;
	}
	public void setGroupname(String groupname) {
		this.groupname = groupname;
	}
}
