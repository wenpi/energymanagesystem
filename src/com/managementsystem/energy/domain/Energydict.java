package com.managementsystem.energy.domain;

import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;

import org.codehaus.jackson.annotate.JsonBackReference;

/**
 * 能耗 字典类
 */
public class Energydict implements java.io.Serializable {

	private static final long serialVersionUID = 4900319829335107245L;
	private String energydictId;
	private String energydictName;
	private BigDecimal energydictCalorificvalue;
	private BigDecimal energydictCalorificvalueKj;
	private String energydictUnit;
	private BigDecimal energydictRate;
	private BigDecimal energyDictRateElectricity;

	@JsonBackReference
	private Set energyitemdicts = new HashSet(0);

	@JsonBackReference
	private Set readmeters = new HashSet(0);
	@JsonBackReference
	private Set energyprices = new HashSet(0);

	public Energydict() {
	}

	public Energydict(String energydictId) {
		this.energydictId = energydictId;
	}

	public Energydict(String energydictId, String energydictName,
			BigDecimal energydictCalorificvalue,
			BigDecimal energydictCalorificvalueKj, String energydictUnit,
			BigDecimal energydictRate, Set energyitemdicts) {
		this.energydictId = energydictId;
		this.energydictName = energydictName;
		this.energydictCalorificvalue = energydictCalorificvalue;
		this.energydictCalorificvalueKj = energydictCalorificvalueKj;
		this.energydictUnit = energydictUnit;
		this.energydictRate = energydictRate;
		this.energyitemdicts = energyitemdicts;
	}

	public String getEnergydictId() {
		return this.energydictId;
	}

	public void setEnergydictId(String energydictId) {
		this.energydictId = energydictId;
	}

	public String getEnergydictName() {
		return this.energydictName;
	}

	public void setEnergydictName(String energydictName) {
		this.energydictName = energydictName;
	}

	public BigDecimal getEnergydictCalorificvalue() {
		return this.energydictCalorificvalue;
	}

	public void setEnergydictCalorificvalue(BigDecimal energydictCalorificvalue) {
		this.energydictCalorificvalue = energydictCalorificvalue;
	}

	public BigDecimal getEnergydictCalorificvalueKj() {
		return this.energydictCalorificvalueKj;
	}

	public void setEnergydictCalorificvalueKj(
			BigDecimal energydictCalorificvalueKj) {
		this.energydictCalorificvalueKj = energydictCalorificvalueKj;
	}

	public String getEnergydictUnit() {
		return this.energydictUnit;
	}

	public void setEnergydictUnit(String energydictUnit) {
		this.energydictUnit = energydictUnit;
	}

	public BigDecimal getEnergydictRate() {
		return this.energydictRate;
	}

	public void setEnergydictRate(BigDecimal energydictRate) {
		this.energydictRate = energydictRate;
	}

	public BigDecimal getEnergyDictRateElectricity() {
		return energyDictRateElectricity;
	}

	public void setEnergyDictRateElectricity(
			BigDecimal energyDictRateElectricity) {
		this.energyDictRateElectricity = energyDictRateElectricity;
	}

	public Set getEnergyitemdicts() {
		return this.energyitemdicts;
	}

	public void setEnergyitemdicts(Set energyitemdicts) {
		this.energyitemdicts = energyitemdicts;
	}

	public Set getEnergyprices() {
		return energyprices;
	}

	public void setEnergyprices(Set energyprices) {
		this.energyprices = energyprices;
	}

	public Set getReadmeters() {
		return readmeters;
	}

	public void setReadmeters(Set readmeters) {
		this.readmeters = readmeters;
	}

}
