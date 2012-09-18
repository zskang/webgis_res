package com.cabletech.res.entity.basemgr;

/**
 * 管道段系统实体类
 * 
 * @author zhanglei 2012-05-09
 */
public class GddxtEntity extends BaseEntity{
 
	private static final long serialVersionUID = 1L;
	private String zcd; //总长度
	private String gjs; //管井数
	private String ywjb; //业务级别
	private String sszt; //设施状态
	private String whfs; //维护方式
	private String cqxz; //产权性质
	private String jsdw; //建设单位
	private String jgsj; //竣工时间
	private String orgid; //组织ID
	private String createdate;//采集时间
	
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
	private String regionid; //所属区域
	private String bz; //备注
	
	public String getZcd() {
		return zcd;
	}
	public void setZcd(String zcd) {
		this.zcd = zcd;
	}
	public String getGjs() {
		return gjs;
	}
	public void setGjs(String gjs) {
		this.gjs = gjs;
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
	public String getJsdw() {
		return jsdw;
	}
	public void setJsdw(String jsdw) {
		this.jsdw = jsdw;
	}
	public String getJgsj() {
		return jgsj;
	}
	public void setJgsj(String jgsj) {
		this.jgsj = jgsj;
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
