package com.managementsystem.energy.domain;


import java.math.BigDecimal;

/**
 * 空调箱信息
 */
public class Ahu implements java.io.Serializable {

	private long id;
	private String buildId;
	private String regionId;
	private String position;
	private String deviceNo;
	private String description;
	private String maker;
	private String model;
	private Integer total;
	private BigDecimal powerSf;
	private BigDecimal prSf;
	private BigDecimal frSf;
	private BigDecimal powerRf;
	private BigDecimal prRf;
	private BigDecimal frRf;
	private BigDecimal cp;
	private BigDecimal hp;
	private BigDecimal TCwS;
	private BigDecimal TCwR;
	private BigDecimal frCw;
	private BigDecimal THwS;
	private BigDecimal THwR;
	private BigDecimal frHw;
	private String comment;

	public Ahu() {
	}

	public Ahu(long id) {
		this.id = id;
	}

	public Ahu(long id, String buildId, String regionId, String position,
			String deviceNo, String description, String maker, String model,
			Integer total, BigDecimal powerSf, BigDecimal prSf,
			BigDecimal frSf, BigDecimal powerRf, BigDecimal prRf,
			BigDecimal frRf, BigDecimal cp, BigDecimal hp, BigDecimal TCwS,
			BigDecimal TCwR, BigDecimal frCw, BigDecimal THwS, BigDecimal THwR,
			BigDecimal frHw, String comment) {
		this.id = id;
		this.buildId = buildId;
		this.regionId = regionId;
		this.position = position;
		this.deviceNo = deviceNo;
		this.description = description;
		this.maker = maker;
		this.model = model;
		this.total = total;
		this.powerSf = powerSf;
		this.prSf = prSf;
		this.frSf = frSf;
		this.powerRf = powerRf;
		this.prRf = prRf;
		this.frRf = frRf;
		this.cp = cp;
		this.hp = hp;
		this.TCwS = TCwS;
		this.TCwR = TCwR;
		this.frCw = frCw;
		this.THwS = THwS;
		this.THwR = THwR;
		this.frHw = frHw;
		this.comment = comment;
	}

	public long getId() {
		return this.id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getBuildId() {
		return this.buildId;
	}

	public void setBuildId(String buildId) {
		this.buildId = buildId;
	}

	public String getRegionId() {
		return this.regionId;
	}

	public void setRegionId(String regionId) {
		this.regionId = regionId;
	}

	public String getPosition() {
		return this.position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getDeviceNo() {
		return this.deviceNo;
	}

	public void setDeviceNo(String deviceNo) {
		this.deviceNo = deviceNo;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getMaker() {
		return this.maker;
	}

	public void setMaker(String maker) {
		this.maker = maker;
	}

	public String getModel() {
		return this.model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public Integer getTotal() {
		return this.total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	public BigDecimal getPowerSf() {
		return this.powerSf;
	}

	public void setPowerSf(BigDecimal powerSf) {
		this.powerSf = powerSf;
	}

	public BigDecimal getPrSf() {
		return this.prSf;
	}

	public void setPrSf(BigDecimal prSf) {
		this.prSf = prSf;
	}

	public BigDecimal getFrSf() {
		return this.frSf;
	}

	public void setFrSf(BigDecimal frSf) {
		this.frSf = frSf;
	}

	public BigDecimal getPowerRf() {
		return this.powerRf;
	}

	public void setPowerRf(BigDecimal powerRf) {
		this.powerRf = powerRf;
	}

	public BigDecimal getPrRf() {
		return this.prRf;
	}

	public void setPrRf(BigDecimal prRf) {
		this.prRf = prRf;
	}

	public BigDecimal getFrRf() {
		return this.frRf;
	}

	public void setFrRf(BigDecimal frRf) {
		this.frRf = frRf;
	}

	public BigDecimal getCp() {
		return this.cp;
	}

	public void setCp(BigDecimal cp) {
		this.cp = cp;
	}

	public BigDecimal getHp() {
		return this.hp;
	}

	public void setHp(BigDecimal hp) {
		this.hp = hp;
	}

	public BigDecimal getTCwS() {
		return this.TCwS;
	}

	public void setTCwS(BigDecimal TCwS) {
		this.TCwS = TCwS;
	}

	public BigDecimal getTCwR() {
		return this.TCwR;
	}

	public void setTCwR(BigDecimal TCwR) {
		this.TCwR = TCwR;
	}

	public BigDecimal getFrCw() {
		return this.frCw;
	}

	public void setFrCw(BigDecimal frCw) {
		this.frCw = frCw;
	}

	public BigDecimal getTHwS() {
		return this.THwS;
	}

	public void setTHwS(BigDecimal THwS) {
		this.THwS = THwS;
	}

	public BigDecimal getTHwR() {
		return this.THwR;
	}

	public void setTHwR(BigDecimal THwR) {
		this.THwR = THwR;
	}

	public BigDecimal getFrHw() {
		return this.frHw;
	}

	public void setFrHw(BigDecimal frHw) {
		this.frHw = frHw;
	}

	public String getComment() {
		return this.comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

}
