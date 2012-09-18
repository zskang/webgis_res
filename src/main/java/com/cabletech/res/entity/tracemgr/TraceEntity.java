package com.cabletech.res.entity.tracemgr;

import com.cabletech.res.entity.basemgr.BaseEntity;

/**
 * trace 实体
 * @author Administrator
 *
 */
public class TraceEntity extends BaseEntity {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String qssblx;//起始设备类型
	private String qssbid;//起始设备系统编号
	private String qssbdz;//起始设备端子编号
	private String ssodm;//所属ODM系统编号
	
	public String getQssbdz() {
		return qssbdz;
	}
	public void setQssbdz(String qssbdz) {
		this.qssbdz = qssbdz;
	}
	public String getQssbid() {
		return qssbid;
	}
	public void setQssbid(String qssbid) {
		this.qssbid = qssbid;
	}
	public String getQssblx() {
		return qssblx;
	}
	public void setQssblx(String qssblx) {
		this.qssblx = qssblx;
	}
	public String getSsodm() {
		return ssodm;
	}
	public void setSsodm(String ssodm) {
		this.ssodm = ssodm;
	}
	
}
