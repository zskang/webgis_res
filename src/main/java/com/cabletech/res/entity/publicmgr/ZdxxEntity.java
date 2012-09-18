package com.cabletech.res.entity.publicmgr;

import com.cabletech.baseinfo.business.entity.UserInfo;
import com.cabletech.core.common.Page;
import com.cabletech.res.entity.basemgr.BaseEntity;

/**
 * 站点信息实体类
 * 
 * @author 杨隽 2012-05-22 创建
 */
public class ZdxxEntity extends BaseEntity {
	private static final long serialVersionUID = 1L;
	private String regionid; // 地市编号
	private String zymc;// 资源名称
	private String xtbh;// 系统编号
	private String zdbh; // 站点编号
	private String ymc; // 原名称
	private String jtgfmc; // 集团规范名称
	private String sx; // 缩写
	private String dz; // 地址
	private String dlmc; // 道路名称
	private String zdlx; // 站点类型
	private String ywjb; // 业务级别
	private String cqxz; // 产权性质
	private String mphm; // 门牌号码
	private String fwjg; // 房屋结构
	private String zydw; // 租用单位
	private String cz; // 承重
	private String ssglq; // 所属管理区
	private String lon; // 经度
	
	private String lat; // 纬度
	private String createDate;// 创建日期
	private String bz; // 备注
	private String orgid; // 采集单位
	private String ewm; // 二维码
	private String status; // 状态

	// 登录用户信息（业务数据，不存储数据库）
	private UserInfo loginUser;

	public String getZymc() {
		return zymc;
	}

	public void setZymc(String zymc) {
		this.zymc = zymc;
	}

	public String getXtbh() {
		return xtbh;
	}

	public void setXtbh(String xtbh) {
		this.xtbh = xtbh;
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


	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

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

	public String getZdbh() {
		return zdbh;
	}

	public void setZdbh(String zdbh) {
		this.zdbh = zdbh;
	}

	public String getYmc() {
		return ymc;
	}

	public void setYmc(String ymc) {
		this.ymc = ymc;
	}

	public String getJtgfmc() {
		return jtgfmc;
	}

	public void setJtgfmc(String jtgfmc) {
		this.jtgfmc = jtgfmc;
	}

	public String getSx() {
		return sx;
	}

	public void setSx(String sx) {
		this.sx = sx;
	}

	public String getDz() {
		return dz;
	}

	public void setDz(String dz) {
		this.dz = dz;
	}

	public String getDlmc() {
		return dlmc;
	}

	public void setDlmc(String dlmc) {
		this.dlmc = dlmc;
	}

	public String getZdlx() {
		return zdlx;
	}

	public void setZdlx(String zdlx) {
		this.zdlx = zdlx;
	}

	public String getYwjb() {
		return ywjb;
	}

	public void setYwjb(String ywjb) {
		this.ywjb = ywjb;
	}

	public String getCqxz() {
		return cqxz;
	}

	public void setCqxz(String cqxz) {
		this.cqxz = cqxz;
	}

	public String getMphm() {
		return mphm;
	}

	public void setMphm(String mphm) {
		this.mphm = mphm;
	}

	public String getFwjg() {
		return fwjg;
	}

	public void setFwjg(String fwjg) {
		this.fwjg = fwjg;
	}

	public String getZydw() {
		return zydw;
	}

	public void setZydw(String zydw) {
		this.zydw = zydw;
	}

	public String getCz() {
		return cz;
	}

	public void setCz(String cz) {
		this.cz = cz;
	}

	public String getSsglq() {
		return ssglq;
	}

	public void setSsglq(String ssglq) {
		this.ssglq = ssglq;
	}

	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
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
}
