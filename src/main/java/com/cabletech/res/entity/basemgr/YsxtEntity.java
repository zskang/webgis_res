package com.cabletech.res.entity.basemgr;

/**
 * 引上系统实体类
 * 
 * @author zhanglei 2012-05-09
 */
public class YsxtEntity extends BaseEntity{

	private static final long serialVersionUID = 1L;
	private String cqxz; // 产权性质
	private String sszt; // 设施状态
	private String whfs; // 维护方式
	private String ywjb; // 业务级别
	private String regionid;// 所属区域
	private String bz; // 备注
	private String orgid;//组织ID

	public String getOrgid() {
		return orgid;
	}

	public void setOrgid(String orgid) {
		this.orgid = orgid;
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

	public String getYwjb() {
		return ywjb;
	}

	public void setYwjb(String ywjb) {
		this.ywjb = ywjb;
	}

	public String getRegionid() {
		return regionid;
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
