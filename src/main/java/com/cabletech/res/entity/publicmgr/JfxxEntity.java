package com.cabletech.res.entity.publicmgr;

import com.cabletech.baseinfo.business.entity.UserInfo;
import com.cabletech.core.common.Page;
import com.cabletech.res.entity.basemgr.BaseEntity;

/**
 * 机房信息实体类
 * 
 * @author wangt 2012-05-21
 */
public class JfxxEntity extends BaseEntity{

	private static final long serialVersionUID = 1L;

	private String regionid; // 地市编号
	private String jfbm; // 机房编码
	private String ymc; // 原名称
	private String sszd; // 所属站点
	private String jflx; // 机房类型
	private String szjzw; // 所在建筑物
	private String lch; // 楼层号
	private String fjh; // 房间号
	private String cqxz; // 产权性质
	private String cjsj; // 采集时间
	private String sx; // 缩写
	private String bm; //编码
	private String whfs; //维护方式
	private String cd; // 长度
	private String gd; // 高度
	private String kd; // 宽度
	private String gdzcbh; // 固定资产编号
	private String bz; // 备注
	private String countyid; // 所属县区
	private String ywjb; // 业务级别
	private String precinct; // 所属管理区
	private String status; // 是否删除
	private String simid;//SIM卡号
	private String orgid;//组织ID
	private String ewm;//二维码
	private String starttime; //采集开始时间｛查询用｝
	private String endtime; //采集结束时间｛查询用｝
	
	
	// 分页信息数据（列表分页数据，不存储数据库）

	// 登录用户信息（业务数据，不存储数据库）
	private UserInfo loginUser;
	
	public UserInfo getLoginUser() {
		return loginUser;
	}
	public void setLoginUser(UserInfo loginUser) {
		this.loginUser = loginUser;
	}
	public String getRegionid() {
		return regionid;
	}
	public void setRegionid(String regionid) {
		this.regionid = regionid;
	}
	public String getJfbm() {
		return jfbm;
	}
	public void setJfbm(String jfbm) {
		this.jfbm = jfbm;
	}
	public String getYmc() {
		return ymc;
	}
	public void setYmc(String ymc) {
		this.ymc = ymc;
	}
	public String getSszd() {
		return sszd;
	}
	public void setSzzd(String sszd) {
		this.sszd = sszd;
	}
	public String getJflx() {
		return jflx;
	}
	public void setJflx(String jflx) {
		this.jflx = jflx;
	}
	public String getSzjzw() {
		return szjzw;
	}
	public void setSzjzw(String szjzw) {
		this.szjzw = szjzw;
	}
	public String getLch() {
		return lch;
	}
	public void setLch(String lch) {
		this.lch = lch;
	}
	public String getFjh() {
		return fjh;
	}
	public void setFjh(String fjh) {
		this.fjh = fjh;
	}
	public String getWhfs() {
		return whfs;
	}
	public String getEwm() {
		return ewm;
	}
	public void setEwm(String ewm) {
		this.ewm = ewm;
	}
	public void setSszd(String sszd) {
		this.sszd = sszd;
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
	public String getCjsj() {
		return cjsj;
	}
	public void setCjsj(String cjsj) {
		this.cjsj = cjsj;
	}
	public String getSx() {
		return sx;
	}
	public void setSx(String sx) {
		this.sx = sx;
	}
	public String getBm() {
		return bm;
	}
	public void setBm(String bm) {
		this.bm = bm;
	}
	public String getCd() {
		return cd;
	}
	public void setCd(String cd) {
		this.cd = cd;
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
	public String getGd() {
		return gd;
	}
	public void setGd(String gd) {
		this.gd = gd;
	}
	public String getKd() {
		return kd;
	}
	public void setKd(String kd) {
		this.kd = kd;
	}
	public String getGdzcbh() {
		return gdzcbh;
	}
	public void setGdzcbh(String gdzcbh) {
		this.gdzcbh = gdzcbh;
	}
	public String getBz() {
		return bz;
	}
	public void setBz(String bz) {
		this.bz = bz;
	}
	public String getCountyid() {
		return countyid;
	}
	public void setCountyid(String countyid) {
		this.countyid = countyid;
	}
	public String getYwjb() {
		return ywjb;
	}
	public void setYwjb(String ywjb) {
		this.ywjb = ywjb;
	}
	public String getPrecinct() {
		return precinct;
	}
	public void setPrecinct(String precinct) {
		this.precinct = precinct;
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
	public String getSimid() {
		return simid;
	}
	public void setSimid(String simid) {
		this.simid = simid;
	}
	
}
