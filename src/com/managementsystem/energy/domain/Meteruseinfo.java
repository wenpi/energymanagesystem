package com.managementsystem.energy.domain;


import java.math.BigDecimal;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import org.codehaus.jackson.annotate.JsonBackReference;

/**
 * 仪表使用信息类
 */
public class Meteruseinfo implements java.io.Serializable {

	private static final long serialVersionUID = -5981484129243060733L;
	private String meterId;
	private Buildregioninfo buildregioninfo;
	@JsonBackReference
	private Circuitinfo circuitinfo;
	private Meterproinfo meterproinfo;
	private String meterName;
	private String meterAddr1;
	private String meterAddr2;
	private String meterAddr3;
	private BigDecimal meterRate;
	private Integer meterState;
	private String meterDesc;
	private String deviceid;
	
	@JsonBackReference
	private Set meteruseattributes = new HashSet(0);
	@JsonBackReference
	private Set energyitemresults = new HashSet(0);
	@JsonBackReference
	private List<Meteruseattribute> meteruseattributeslist = new LinkedList<Meteruseattribute>();

	public List<Meteruseattribute> getMeteruseattributeslist() {
		return meteruseattributeslist;
	}

	public void setMeteruseattributeslist(
			List<Meteruseattribute> meteruseattributeslist) {
		this.meteruseattributeslist = meteruseattributeslist;
	}

	public Meteruseinfo() {
	}

	public Meteruseinfo(String meterId) {
		this.meterId = meterId;
	}

	public Meteruseinfo(String meterId, Buildregioninfo buildregioninfo,
			Circuitinfo circuitinfo, Meterproinfo meterproinfo,
			String meterName, String meterAddr1, String meterAddr2,
			String meterAddr3, BigDecimal meterRate, Integer meterState,
			String meterDesc, String deviceid, Set meteruseattributes,
			Set energyitemresults) {
		this.meterId = meterId;
		this.buildregioninfo = buildregioninfo;
		this.circuitinfo = circuitinfo;
		this.meterproinfo = meterproinfo;
		this.meterName = meterName;
		this.meterAddr1 = meterAddr1;
		this.meterAddr2 = meterAddr2;
		this.meterAddr3 = meterAddr3;
		this.meterRate = meterRate;
		this.meterState = meterState;
		this.meterDesc = meterDesc;
		this.deviceid = deviceid;
		this.meteruseattributes = meteruseattributes;
		this.energyitemresults = energyitemresults;
	}

	public String getMeterId() {
		return this.meterId;
	}

	public void setMeterId(String meterId) {
		this.meterId = meterId;
	}

	public Buildregioninfo getBuildregioninfo() {
		return this.buildregioninfo;
	}

	public void setBuildregioninfo(Buildregioninfo buildregioninfo) {
		this.buildregioninfo = buildregioninfo;
	}

	public Circuitinfo getCircuitinfo() {
		return this.circuitinfo;
	}

	public void setCircuitinfo(Circuitinfo circuitinfo) {
		this.circuitinfo = circuitinfo;
	}

	public Meterproinfo getMeterproinfo() {
		return this.meterproinfo;
	}

	public void setMeterproinfo(Meterproinfo meterproinfo) {
		this.meterproinfo = meterproinfo;
	}

	public String getMeterName() {
		return this.meterName;
	}

	public void setMeterName(String meterName) {
		this.meterName = meterName;
	}

	public String getMeterAddr1() {
		return this.meterAddr1;
	}

	public void setMeterAddr1(String meterAddr1) {
		this.meterAddr1 = meterAddr1;
	}

	public String getMeterAddr2() {
		return this.meterAddr2;
	}

	public void setMeterAddr2(String meterAddr2) {
		this.meterAddr2 = meterAddr2;
	}

	public String getMeterAddr3() {
		return this.meterAddr3;
	}

	public void setMeterAddr3(String meterAddr3) {
		this.meterAddr3 = meterAddr3;
	}

	public BigDecimal getMeterRate() {
		return this.meterRate;
	}

	public void setMeterRate(BigDecimal meterRate) {
		this.meterRate = meterRate;
	}

	public Integer getMeterState() {
		return this.meterState;
	}

	public void setMeterState(Integer meterState) {
		this.meterState = meterState;
	}

	public String getMeterDesc() {
		return this.meterDesc;
	}

	public void setMeterDesc(String meterDesc) {
		this.meterDesc = meterDesc;
	}

	public String getDeviceid() {
		return this.deviceid;
	}

	public void setDeviceid(String deviceid) {
		this.deviceid = deviceid;
	}

	public Set getMeteruseattributes() {
		return this.meteruseattributes;
	}

	public void setMeteruseattributes(Set meteruseattributes) {
		this.meteruseattributes = meteruseattributes;
	}

	public Set getEnergyitemresults() {
		return this.energyitemresults;
	}

	public void setEnergyitemresults(Set energyitemresults) {
		this.energyitemresults = energyitemresults;
	}

}
