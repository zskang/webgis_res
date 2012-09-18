package com.cabletech.res.entity.basemgr;

/**
 * 直埋段系统（直埋段系统）实体
 * 
 * @author zhanglei 2012-05-09
 */
public class BsdxtEntity extends BaseEntity{

	private static final long serialVersionUID = 1L;
	private String zcd; // 总长度
	private String bss; // 标石数
	private String ywjb; // 业务级别
	private String sszt; // 设施状态
	private String whfs; //维护方式
	private String cqxz; // 产权性质
	private String jsdw; // 建设单位
	private String regionid; // 所属区域
	private String bz; // 备注
	private String orgid;//  组织ID
	
	public String getOrgid() {
		return orgid;
	}

	public void setOrgid(String orgid) {
		this.orgid = orgid;
	}

	public String getZcd() {
		return zcd;
	}

	public void setZcd(String zcd) {
		this.zcd = zcd;
	}

	public String getBss() {
		return bss;
	}

	public void setBss(String bss) {
		this.bss = bss;
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

	public String getCqxz() {
		return cqxz;
	}

	public void setCqxz(String cqxz) {
		this.cqxz = cqxz;
	}

	public String getJsdw() {
		return jsdw;
	}

	public void setJsdw(String jsdw) {
		this.jsdw = jsdw;
	}
 
	public String getRegionid() {
		return regionid;
	}

	public String getWhfs() {
		return whfs;
	} 

	public void setWhfs(String whfs) {
		this.whfs = whfs;
	}

	public void setRegionid(String regionid) {
		this.regionid = regionid;
	}
 
	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}

}
