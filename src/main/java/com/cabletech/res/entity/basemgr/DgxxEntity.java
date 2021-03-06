package com.cabletech.res.entity.basemgr;

/**
 * 电杆信息实体类
 * 
 * @author zhanglei 2012-05-09
 */
public class DgxxEntity extends BaseEntity {

	private static final long serialVersionUID = 1L;

	private String ymc; //原名称
	private String dlmc; //道路名称
	private String jtwz; //具体位置
	private float gdd; //杆高度
	private String mp; //门牌
	private String gcz; //杆材质
	private String gxz; //杆形状
	private String ggg; //杆规格
	private String blzz; //避雷装置
	private String lxts; //拉线条数
	private String cggs; //撑杆根数
	private String sfcd; //是否撑点
	private String gmxs; //杆面形式
	private String dgyt; //电杆用途
	private String sfydp; //是否有吊牌
	private String regionid; //所属区域
	private String sszt; //设施状态
	private String cqxz; //产权性质
	private String whfs; //维护方式
	private String ssglq; //所属管理区
	private String lon; //经度
	private String lat; //纬度
	private String ewm; //二维码
	private String orgid;//组织机构编号
	private String simid;//SIM卡号
	
	private String starttime; //采集开始时间｛查询用｝
	private String endtime; //采集结束时间｛查询用｝
	
	private String createdate;
	
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public String getSimid() {
		return simid;
	}
	public void setSimid(String simid) {
		this.simid = simid;
	}
	public String getOrgid() {
		return orgid;
	}
	public void setOrgid(String orgid) {
		this.orgid = orgid;
	}
	public String getYmc() {
		return ymc;
	}
	public void setYmc(String ymc) {
		this.ymc = ymc;
	}
	public String getDlmc() {
		return dlmc;
	}
	public void setDlmc(String dlmc) {
		this.dlmc = dlmc;
	}
	public String getJtwz() {
		return jtwz;
	}
	public void setJtwz(String jtwz) {
		this.jtwz = jtwz;
	}
	public float getGdd() {
		return gdd;
	}
	public void setGdd(float gdd) {
		this.gdd = gdd;
	}
	public String getMp() {
		return mp;
	}
	public void setMp(String mp) {
		this.mp = mp;
	}
	public String getGxz() {
		return gxz;
	}
	public void setGxz(String gxz) {
		this.gxz = gxz;
	}
	public String getGgg() {
		return ggg;
	}
	public void setGgg(String ggg) {
		this.ggg = ggg;
	}
	public String getBlzz() {
		return blzz;
	}
	public void setBlzz(String blzz) {
		this.blzz = blzz;
	}
	public String getLxts() {
		return lxts;
	}
	public void setLxts(String lxts) {
		this.lxts = lxts;
	}
	public String getCggs() {
		return cggs;
	}
	public void setCggs(String cggs) {
		this.cggs = cggs;
	}
	public String getSfcd() {
		return sfcd;
	}
	public void setSfcd(String sfcd) {
		this.sfcd = sfcd;
	}
	public String getGmxs() {
		return gmxs;
	}
	public void setGmxs(String gmxs) {
		this.gmxs = gmxs;
	}
	public String getDgyt() {
		return dgyt;
	}
	public void setDgyt(String dgyt) {
		this.dgyt = dgyt;
	}
	public String getSfydp() {
		return sfydp;
	}
	public String getGcz() {
		return gcz;
	}
	public void setGcz(String gcz) {
		this.gcz = gcz;
	}
	public void setSfydp(String sfydp) {
		this.sfydp = sfydp;
	}
	public String getRegionid() {
		return regionid;
	}
	public void setRegionid(String regionid) {
		this.regionid = regionid;
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
	public String getWhfs() {
		return whfs;
	}
	public void setWhfs(String whfs) {
		this.whfs = whfs;
	}
	public String getSsglq() {
		return ssglq;
	}
	public void setSsglq(String ssglq) {
		this.ssglq = ssglq;
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
	public String getEwm() {
		return ewm;
	}
	public void setEwm(String ewm) {
		this.ewm = ewm;
	}
 
}
