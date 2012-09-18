package com.cabletech.contractor.entity.sublineinfo;

import com.cabletech.res.entity.basemgr.BaseEntity;

/**
 * 路由段实体
 * @author Administrator
 *
 */
public class SublineInfoEntity extends BaseEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String sublineid;//编号
	private String pointnumber;//点序
	private String inumber;//线序
	private String sublinename;//巡检线段名称
	private String lineid;//线路编号
	private String patrolid;//巡检人编号
	private String patrolname;//巡检人名称
	private String regionid;//区域编号
	private String regionname;//区域名称
	private String remark;//备注	
	
	private String newpointid;//资源点编号
	private String newrestype;//资源点类型
	
	public String getNewpointid() {
		return newpointid;
	}
	public void setNewpointid(String newpointid) {
		this.newpointid = newpointid;
	}
	public String getNewrestype() {
		return newrestype;
	}
	public void setNewrestype(String newrestype) {
		this.newrestype = newrestype;
	}
	public String getInumber() {
		return inumber;
	}
	public void setInumber(String inumber) {
		this.inumber = inumber;
	}
	public String getSublineid() {
		return sublineid;
	}
	public void setSublineid(String sublineid) {
		this.sublineid = sublineid;
	}
	public String getPointnumber() {
		return pointnumber;
	}
	public void setPointnumber(String pointnumber) {
		this.pointnumber = pointnumber;
	}
	public String getLineid() {
		return lineid;
	}
	public void setLineid(String lineid) {
		this.lineid = lineid;
	}
	public String getPatrolid() {
		return patrolid;
	}
	public void setPatrolid(String patrolid) {
		this.patrolid = patrolid;
	}
	public String getPatrolname() {
		return patrolname;
	}
	public void setPatrolname(String patrolname) {
		this.patrolname = patrolname;
	}
	public String getRegionid() {
		return regionid;
	}
	public void setRegionid(String regionid) {
		this.regionid = regionid;
	}
	public String getRegionname() {
		return regionname;
	}
	public void setRegionname(String regionname) {
		this.regionname = regionname;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getSublinename() {
		return sublinename;
	}
	public void setSublinename(String sublinename) {
		this.sublinename = sublinename;
	}
	
	
}
