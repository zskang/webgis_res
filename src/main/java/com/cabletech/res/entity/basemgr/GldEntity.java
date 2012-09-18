package com.cabletech.res.entity.basemgr;

/**
 * 杆路段实体
 * 
 * @author zhanglei 2012-05-09
 */
public class GldEntity extends BaseEntity {

	private static final long serialVersionUID = 1L;
 	
	private String ssglxt; //所属杆路系统
	private String qddg; //起端电杆
	private String zddg; //终端电杆
	private float gldcd; //杆路段长度
	private String regionid; //所属区域
	private String whfs; //维护方式
	private String sszt;//设施状态
	private String cqxz; //产权性质
	private String syqr; //所有权人
	private String yt; //用途
	private String sfgx; //是否共享
	private String sfgj; //是否共建
	private String orgid; //组织机构
	private String createdate;
	
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
	public String getSsglxt() {
		return ssglxt;
	}
	public void setSsglxt(String ssglxt) {
		this.ssglxt = ssglxt;
	}
	public String getQddg() {
		return qddg;
	}
	public void setQddg(String qddg) {
		this.qddg = qddg;
	}
	public String getZddg() {
		return zddg;
	}
	public void setZddg(String zddg) {
		this.zddg = zddg;
	}
	public String getRegionid() {
		return regionid;
	}
	public float getGldcd() {
		return gldcd;
	}
	public void setGldcd(float gldcd) {
		this.gldcd = gldcd;
	}
	public void setRegionid(String regionid) {
		this.regionid = regionid;
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
	public String getSyqr() {
		return syqr;
	}
	public void setSyqr(String syqr) {
		this.syqr = syqr;
	}
	public String getYt() {
		return yt;
	}
	public void setYt(String yt) {
		this.yt = yt;
	}
	public String getSfgx() {
		return sfgx;
	}
	public void setSfgx(String sfgx) {
		this.sfgx = sfgx;
	}
	public String getSfgj() {
		return sfgj;
	}
	public void setSfgj(String sfgj) {
		this.sfgj = sfgj;
	}
	public String getOrgid() {
		return orgid;
	}
	public void setOrgid(String orgid) {
		this.orgid = orgid;
	}
	public String getSszt() {
		return sszt;
	} 
	public void setSszt(String sszt) {
		this.sszt = sszt;
	}
	
}