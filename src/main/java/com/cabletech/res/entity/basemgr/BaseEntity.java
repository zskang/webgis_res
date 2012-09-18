package com.cabletech.res.entity.basemgr;

import java.io.Serializable;
/**
 * 统一XTBH Objectid等操作
 * @author lvrenzhao 2012-05-15
 *
 */
public class BaseEntity implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String serializeQueryCondition;// 序列化字符串查询条件

	private String actionMessage;// 操作提示

	private String pointX; // 经纬度x
	private String pointY; // 经纬度y
	private String projectx; // 投影x
	private String projecty; // 投影y
	private String srid; // sde srid字段
	private String geostr; // geo字符串
	private int objectid;
	private String xtbh;//系统编号
	private String zymc;//资源名称

	public String getZymc() {
		return zymc;
	}

	public void setZymc(String zymc) {
		this.zymc = zymc;
	}

	public String getGeostr() {
		return geostr;
	}

	public void setGeostr(String geostr) {
		this.geostr = geostr;
	}
 
	public String getXtbh() {
		return xtbh;
	}

	public void setXtbh(String xtbh) {
		this.xtbh = xtbh;
	}

	public String getSrid() {
		return srid;
	}

	public void setSrid(String srid) {
		this.srid = srid;
	}

	public String getPointX() {
		return pointX;
	}

	public void setPointX(String pointX) {
		this.pointX = pointX;
	}

	public String getPointY() {
		return pointY;
	}

	public void setPointY(String pointY) {
		this.pointY = pointY;
	}

	public String getProjectx() {
		return projectx;
	}

	public void setProjectx(String projectx) {
		this.projectx = projectx;
	}

	public String getProjecty() {
		return projecty;
	}

	public void setProjecty(String projecty) {
		this.projecty = projecty;
	}

	public String getActionMessage() {
		return actionMessage;
	}

	public void setActionMessage(String actionMessage) {
		this.actionMessage = actionMessage;
	}

	public String getSerializeQueryCondition() {
		return serializeQueryCondition;
	}

	public void setSerializeQueryCondition(String serializeQueryCondition) {
		this.serializeQueryCondition = serializeQueryCondition;
	}

	public int getObjectid() {
		return objectid;
	}

	public void setObjectid(int objectid) {
		this.objectid = objectid;
	}
}
