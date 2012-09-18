package com.cabletech.res.entity.publicmgr;

import com.cabletech.res.entity.basemgr.BaseEntity;

/**
 * ODM实体类
 * 
 * @author zhanglei 2012-05-21
 */
public class OdmEntity extends BaseEntity {

	private static final long serialVersionUID = 1L;

	private String odmbm;// ODM编号
	private String sssb;// 所属设备
	private String sssbm;// 所属设备面
	private String gh;// 框号
	private String dybs;// 单元板数
	private String bplfs;// 板排列方式
	private String dzplfs;// 端子排列方式
	private String bdzs;// 板端子数 (吕仁钊 2012/7/9 新增)
	private String splx;// 适配类型
	private String kxh;// 被熔接盘占的框序号
	private String regionid;// 区域
	private String wyzt;// 网元状态
	private String whfs;// 维护方式
	private String cqxz;// 产权性质
	private String sccj;// 生产厂家
	private String bz;// 备注
	private String status;// 是否删除
	private String orgid;// 组织ID
	private String sssblx; // 所属设备类型
	private String twwidth; // 2012/7/9 吕仁钊新增 twaver面板宽度
	private String twheight; // 2012/7/9 吕仁钊新增 twaver面板高度
	private String twx; // 2012/7/9 吕仁钊新增 twaver面板x
	private String twy; // 2012/7/9 吕仁钊新增 twaver面板y
	private String twplfs; // 面板排列方式，水平或竖直 2012/7/9 吕仁钊新增
	private String dzqsbh; // 端子起始编号 2012/7/9 吕仁钊新增

	public String getTwplfs() {
		return twplfs;
	}

	public void setTwplfs(String twplfs) {
		this.twplfs = twplfs;
	}

	public String getDzqsbh() {
		return dzqsbh;
	}

	public void setDzqsbh(String dzqsbh) {
		this.dzqsbh = dzqsbh;
	}

	public String getBdzs() {
		return bdzs;
	}

	public void setBdzs(String bdzs) {
		this.bdzs = bdzs;
	}

	public String getSssblx() {
		return sssblx;
	}

	public void setSssblx(String sssblx) {
		this.sssblx = sssblx;
	}

	public String getOdmbm() {
		return odmbm;
	}

	public void setOdmbm(String odmbm) {
		this.odmbm = odmbm;
	}

	public String getSssb() {
		return sssb;
	}

	public void setSssb(String sssb) {
		this.sssb = sssb;
	}

	public String getGh() {
		return gh;
	}

	public void setGh(String gh) {
		this.gh = gh;
	}

	public String getDybs() {
		return dybs;
	}

	public void setDybs(String dybs) {
		this.dybs = dybs;
	}

	public String getBplfs() {
		return bplfs;
	}

	public void setBplfs(String bplfs) {
		this.bplfs = bplfs;
	}

	public String getDzplfs() {
		return dzplfs;
	}

	public void setDzplfs(String dzplfs) {
		this.dzplfs = dzplfs;
	}

	public String getSplx() {
		return splx;
	}

	public void setSplx(String splx) {
		this.splx = splx;
	}

	public String getKxh() {
		return kxh;
	}

	public void setKxh(String kxh) {
		this.kxh = kxh;
	}

	public String getRegionid() {
		return regionid;
	}

	public void setRegionid(String regionid) {
		this.regionid = regionid;
	}

	public String getWyzt() {
		return wyzt;
	}

	public void setWyzt(String wyzt) {
		this.wyzt = wyzt;
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

	public String getOrgid() {
		return orgid;
	}

	public void setOrgid(String orgid) {
		this.orgid = orgid;
	}

	public void setCqxz(String cqxz) {
		this.cqxz = cqxz;
	}

	public String getSssbm() {
		return sssbm;
	}

	public void setSssbm(String sssbm) {
		this.sssbm = sssbm;
	}

	public String getSccj() {
		return sccj;
	}

	public void setSccj(String sccj) {
		this.sccj = sccj;
	}

	public String getBz() {
		return bz;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}

	public String getTwwidth() {
		return twwidth;
	}

	public void setTwwidth(String twwidth) {
		this.twwidth = twwidth;
	}

	public String getTwheight() {
		return twheight;
	}

	public void setTwheight(String twheight) {
		this.twheight = twheight;
	}

	public String getTwx() {
		return twx;
	}

	public void setTwx(String twx) {
		this.twx = twx;
	}

	public String getTwy() {
		return twy;
	}

	public void setTwy(String twy) {
		this.twy = twy;
	}
}
