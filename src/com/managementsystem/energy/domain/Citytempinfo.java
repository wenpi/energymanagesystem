package com.managementsystem.energy.domain;


import java.math.BigDecimal;

/**
 * 城市温度
 */
public class Citytempinfo implements java.io.Serializable {

	private static final long serialVersionUID = -4048938064148291532L;
	private CitytempinfoId id;
	private Datacenterinfo datacenterinfo;
	private BigDecimal citytempTempvalue;

	public Citytempinfo() {
	}

	public Citytempinfo(CitytempinfoId id, Datacenterinfo datacenterinfo,
			BigDecimal citytempTempvalue) {
		this.id = id;
		this.datacenterinfo = datacenterinfo;
		this.citytempTempvalue = citytempTempvalue;
	}

	public CitytempinfoId getId() {
		return this.id;
	}

	public void setId(CitytempinfoId id) {
		this.id = id;
	}

	public Datacenterinfo getDatacenterinfo() {
		return this.datacenterinfo;
	}

	public void setDatacenterinfo(Datacenterinfo datacenterinfo) {
		this.datacenterinfo = datacenterinfo;
	}

	public BigDecimal getCitytempTempvalue() {
		return this.citytempTempvalue;
	}

	public void setCitytempTempvalue(BigDecimal citytempTempvalue) {
		this.citytempTempvalue = citytempTempvalue;
	}

}
