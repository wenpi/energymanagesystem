package com.managementsystem.energy.domain;


import java.math.BigDecimal;

/**
 * 仪表参数类
 */
public class Meterparaminfo implements java.io.Serializable {

	private static final long serialVersionUID = 2998972251281416588L;
	private String meterParamid;
	private Meterproinfo meterproinfo;
	private String meterParamname;
	private String meterParamvalue;
	private BigDecimal meterChangerate;
	private Integer meterValuetype;
	private Integer meterParamstate;

	public Meterparaminfo() {
	}

	public Meterparaminfo(String meterParamid) {
		this.meterParamid = meterParamid;
	}

	public Meterparaminfo(String meterParamid, Meterproinfo meterproinfo,
			String meterParamname, BigDecimal meterChangerate,
			Integer meterValuetype, Integer meterParamstate) {
		this.meterParamid = meterParamid;
		this.meterproinfo = meterproinfo;
		this.meterParamname = meterParamname;
		this.meterChangerate = meterChangerate;
		this.meterValuetype = meterValuetype;
		this.meterParamstate = meterParamstate;
	}

	public String getMeterParamid() {
		return this.meterParamid;
	}

	public void setMeterParamid(String meterParamid) {
		this.meterParamid = meterParamid;
	}

	public Meterproinfo getMeterproinfo() {
		return this.meterproinfo;
	}

	public void setMeterproinfo(Meterproinfo meterproinfo) {
		this.meterproinfo = meterproinfo;
	}

	public String getMeterParamname() {
		return this.meterParamname;
	}

	public void setMeterParamname(String meterParamname) {
		this.meterParamname = meterParamname;
	}

	public String getMeterParamvalue() {
		return meterParamvalue;
	}

	public void setMeterParamvalue(String meterParamvalue) {
		this.meterParamvalue = meterParamvalue;
	}

	public BigDecimal getMeterChangerate() {
		return this.meterChangerate;
	}

	public void setMeterChangerate(BigDecimal meterChangerate) {
		this.meterChangerate = meterChangerate;
	}

	public Integer getMeterValuetype() {
		return this.meterValuetype;
	}

	public void setMeterValuetype(Integer meterValuetype) {
		this.meterValuetype = meterValuetype;
	}

	public Integer getMeterParamstate() {
		return this.meterParamstate;
	}

	public void setMeterParamstate(Integer meterParamstate) {
		this.meterParamstate = meterParamstate;
	}

}
