package com.cabletech.res.entity.groupcustomsmgr;

import com.cabletech.res.entity.basemgr.BaseEntity;

/**
 * 营业厅实体
 * 
 * @author zhanglei 2012-05-09
 */
public class YytEntity extends BaseEntity{

	private static final long serialVersionUID = 1L;

	private String yytbh;//营业厅编号
	private String yytdz;//营业厅地址
	private String lxr;//联系人
	private String lxdh;//联系电话
	private String sjgxzt;//数据更新状态
	private String lon;//经度
	private String lat;//纬度
	private String sjgxxx;//数据更新信息
	private String createtime;//创建时间
	private String regionid;//所属地市
	private String sbgs;//设备归属
	private String orgid;//组织id
	private String status;//是否删除
	
	public String getYytbh() {
		return yytbh;
	}
	public void setYytbh(String yytbh) {
		this.yytbh = yytbh;
	}
	public String getYytdz() {
		return yytdz;
	}
	public void setYytdz(String yytdz) {
		this.yytdz = yytdz;
	}
	public String getLxr() {
		return lxr;
	}
	public void setLxr(String lxr) {
		this.lxr = lxr;
	}
	public String getLxdh() {
		return lxdh;
	}
	public void setLxdh(String lxdh) {
		this.lxdh = lxdh;
	}
	public String getSjgxzt() {
		return sjgxzt;
	}
	public void setSjgxzt(String sjgxzt) {
		this.sjgxzt = sjgxzt;
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
	public String getSjgxxx() {
		return sjgxxx;
	}
	public void setSjgxxx(String sjgxxx) {
		this.sjgxxx = sjgxxx;
	}
	public String getCreatetime() {
		return createtime;
	}
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}
	public String getRegionid() {
		return regionid;
	}
	public void setRegionid(String regionid) {
		this.regionid = regionid;
	}
	public String getSbgs() {
		return sbgs;
	}
	public void setSbgs(String sbgs) {
		this.sbgs = sbgs;
	}
	public String getOrgid() {
		return orgid;
	}
	public void setOrgid(String orgid) {
		this.orgid = orgid;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
}
