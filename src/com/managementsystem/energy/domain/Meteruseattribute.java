package com.managementsystem.energy.domain;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 仪表使用属性类
 */
public class Meteruseattribute implements java.io.Serializable {

	private static final long serialVersionUID = -2481807201619789739L;
	private MeteruseattributeId id;
	private Meteruseinfo meteruseinfo;
	private Integer meterattrType;
	private String meterattrValue;
	private String meterattrDesc;
	private BigDecimal meterattrCurrentvalue;
	private BigDecimal meterattrReadvalue;
	private BigDecimal meterattrDiffvalue;
	private Date meterattrUpdateddate;

	public Meteruseattribute() {
	}

	public Meteruseattribute(MeteruseattributeId id, Meteruseinfo meteruseinfo) {
		this.id = id;
		this.meteruseinfo = meteruseinfo;
	}

	public Meteruseattribute(MeteruseattributeId id, Meteruseinfo meteruseinfo,
			Integer meterattrType, String meterattrValue, String meterattrDesc) {
		this.id = id;
		this.meteruseinfo = meteruseinfo;
		this.meterattrType = meterattrType;
		this.meterattrValue = meterattrValue;
		this.meterattrDesc = meterattrDesc;
	}

	public MeteruseattributeId getId() {
		return this.id;
	}

	public void setId(MeteruseattributeId id) {
		this.id = id;
	}

	public Meteruseinfo getMeteruseinfo() {
		return this.meteruseinfo;
	}

	public void setMeteruseinfo(Meteruseinfo meteruseinfo) {
		this.meteruseinfo = meteruseinfo;
	}

	public Integer getMeterattrType() {
		return this.meterattrType;
	}

	public void setMeterattrType(Integer meterattrType) {
		this.meterattrType = meterattrType;
	}

	public String getMeterattrValue() {
		return this.meterattrValue;
	}

	public void setMeterattrValue(String meterattrValue) {
		this.meterattrValue = meterattrValue;
	}

	public String getMeterattrDesc() {
		return this.meterattrDesc;
	}

	public void setMeterattrDesc(String meterattrDesc) {
		this.meterattrDesc = meterattrDesc;
	}

	public BigDecimal getMeterattrCurrentvalue() {
		return meterattrCurrentvalue;
	}

	public void setMeterattrCurrentvalue(BigDecimal meterattrCurrentvalue) {
		this.meterattrCurrentvalue = meterattrCurrentvalue;
	}

	public BigDecimal getMeterattrReadvalue() {
		return meterattrReadvalue;
	}

	public void setMeterattrReadvalue(BigDecimal meterattrReadvalue) {
		this.meterattrReadvalue = meterattrReadvalue;
	}

	public BigDecimal getMeterattrDiffvalue() {
		return meterattrDiffvalue;
	}

	public void setMeterattrDiffvalue(BigDecimal meterattrDiffvalue) {
		this.meterattrDiffvalue = meterattrDiffvalue;
	}

	public Date getMeterattrUpdateddate() {
		return meterattrUpdateddate;
	}

	public void setMeterattrUpdateddate(Date meterattrUpdateddate) {
		this.meterattrUpdateddate = meterattrUpdateddate;
	}

}
