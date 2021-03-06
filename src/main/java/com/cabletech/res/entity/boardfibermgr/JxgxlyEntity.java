package com.cabletech.res.entity.boardfibermgr;

import com.cabletech.res.entity.basemgr.BaseEntity;

/**
 * 局向光纤路由实体
 * @author Administrator
 *
 */
public class JxgxlyEntity extends BaseEntity {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id; //系统编号
	private String ssjxgxllz; //所属局向光纤链路组
	private String ssgldly; //所属光缆路由
	private String lytype; //路由资源类型
	private String sn; //编号
	private String status; //状态
	private String ssjxgx;//所属局向光纤
	
	public String getSsjxgx() {
		return ssjxgx;
	}
	public void setSsjxgx(String ssjxgx) {
		this.ssjxgx = ssjxgx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getLytype() {
		return lytype;
	}
	public void setLytype(String lytype) {
		this.lytype = lytype;
	}
	public String getSn() {
		return sn;
	}
	public void setSn(String sn) {
		this.sn = sn;
	}
	public String getSsgldly() {
		return ssgldly;
	}
	public void setSsgldly(String ssgldly) {
		this.ssgldly = ssgldly;
	}
	public String getSsjxgxllz() {
		return ssjxgxllz;
	}
	public void setSsjxgxllz(String ssjxgxllz) {
		this.ssjxgxllz = ssjxgxllz;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
