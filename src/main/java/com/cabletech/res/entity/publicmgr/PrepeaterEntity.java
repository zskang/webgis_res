package com.cabletech.res.entity.publicmgr;
import com.cabletech.res.entity.basemgr.BaseEntity;

/**
 * 站点信息实体类
 * 
 * @author 周刚 2012-07-17 创建
 */
public class PrepeaterEntity extends BaseEntity {
	private static final long serialVersionUID = 1L;
	private String prepeaterId;
	private String prepeaterName;
	private String siteId;
	private String irmsId;  
	private String powerSupplyMode;
	private String cell;
	private String prepeaterType;
	private String signalReceiveMode;
	private String producer;
	private String coverType;
	private String openingTime; 
	public String getZdmc() {
		return zdmc;
	}

	public void setZdmc(String zdmc) {
		this.zdmc = zdmc;
	}

	private String state; // 状态 
	private String zymc;
	
	private String zdmc;
	

	public String getZymc() {
		return zymc;
	}

	public void setZymc(String zymc) {
		this.zymc = zymc;
	}

	public String getPrepeaterId() {
		return prepeaterId;
	}

	public void setPrepeaterId(String prepeaterId) {
		this.prepeaterId = prepeaterId;
	}

	public String getPrepeaterName() {
		return prepeaterName;
	}

	public void setPrepeaterName(String prepeaterName) {
		this.prepeaterName = prepeaterName;
	} 

	public String getSiteId() {
		return siteId;
	}

	public void setSiteId(String siteId) {
		this.siteId = siteId;
	}

	public String getIrmsId() {
		return irmsId;
	}

	public void setIrmsId(String irmsId) {
		this.irmsId = irmsId;
	}
 

	public String getPowerSupplyMode() {
		return powerSupplyMode;
	}

	public void setPowerSupplyMode(String powerSupplyMode) {
		this.powerSupplyMode = powerSupplyMode;
	}

	public String getCell() {
		return cell;
	}

	public void setCell(String cell) {
		this.cell = cell;
	}
 
	public String getPrepeaterType() {
		return prepeaterType;
	}

	public void setPrepeaterType(String prepeaterType) {
		this.prepeaterType = prepeaterType;
	}

	public String getSignalReceiveMode() {
		return signalReceiveMode;
	}

	 
	public void setSignalReceiveMode(String signalReceiveMode) {
		this.signalReceiveMode = signalReceiveMode;
	}

	public String getProducer() {
		return producer;
	}

	public void setProducer(String producer) {
		this.producer = producer;
	}

	public String getCoverType() {
		return coverType;
	}

	public void setCoverType(String coverType) {
		this.coverType = coverType;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getOpeningTime() {
		return openingTime;
	}

	public void setOpeningTime(String openingTime) {
		this.openingTime = openingTime;
	}

 
	 
}
