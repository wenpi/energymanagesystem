package com.managementsystem.energy.domain;


import java.math.BigDecimal;
import java.util.Date;

import org.codehaus.jackson.annotate.JsonBackReference;

/**
 * 分项能耗标准明细
 */
public class EnergyItemStandardDetail implements java.io.Serializable {

	private static final long serialVersionUID = -3947029573097265898L;
	private String detailId;
	@JsonBackReference
	private EnergyStandard energyStandard;
	private String buildFunction;
	private String energyItemcode;
	private String unit;
	private String description;
	private BigDecimal standardValue;
	private Date createdOnDate;
	private Long createdByUserId;
	private String createdByUserName;
	private Long lastModifiedByUserId;
	private Date lastModifiedOnDate;

	public EnergyItemStandardDetail() {
	}

	public EnergyItemStandardDetail(String detailId) {
		this.detailId = detailId;
	}

	public EnergyItemStandardDetail(String detailId,
			EnergyStandard energyStandard, String buildFunction,
			String energyItemcode, String unit, String description,
			BigDecimal standardValue, Date createdOnDate, Long createdByUserId,
			String createdByUserName, Long lastModifiedByUserId,
			Date lastModifiedOnDate) {
		this.detailId = detailId;
		this.energyStandard = energyStandard;
		this.buildFunction = buildFunction;
		this.energyItemcode = energyItemcode;
		this.unit = unit;
		this.description = description;
		this.standardValue = standardValue;
		this.createdOnDate = createdOnDate;
		this.createdByUserId = createdByUserId;
		this.createdByUserName = createdByUserName;
		this.lastModifiedByUserId = lastModifiedByUserId;
		this.lastModifiedOnDate = lastModifiedOnDate;
	}

	public String getDetailId() {
		return this.detailId;
	}

	public void setDetailId(String detailId) {
		this.detailId = detailId;
	}

	public EnergyStandard getEnergyStandard() {
		return this.energyStandard;
	}

	public void setEnergyStandard(EnergyStandard energyStandard) {
		this.energyStandard = energyStandard;
	}

	public String getBuildFunction() {
		return this.buildFunction;
	}

	public void setBuildFunction(String buildFunction) {
		this.buildFunction = buildFunction;
	}

	public String getEnergyItemcode() {
		return this.energyItemcode;
	}

	public void setEnergyItemcode(String energyItemcode) {
		this.energyItemcode = energyItemcode;
	}

	public String getUnit() {
		return this.unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public BigDecimal getStandardValue() {
		return this.standardValue;
	}

	public void setStandardValue(BigDecimal standardValue) {
		this.standardValue = standardValue;
	}

	public Date getCreatedOnDate() {
		return this.createdOnDate;
	}

	public void setCreatedOnDate(Date createdOnDate) {
		this.createdOnDate = createdOnDate;
	}

	public Long getCreatedByUserId() {
		return this.createdByUserId;
	}

	public void setCreatedByUserId(Long createdByUserId) {
		this.createdByUserId = createdByUserId;
	}

	public String getCreatedByUserName() {
		return this.createdByUserName;
	}

	public void setCreatedByUserName(String createdByUserName) {
		this.createdByUserName = createdByUserName;
	}

	public Long getLastModifiedByUserId() {
		return this.lastModifiedByUserId;
	}

	public void setLastModifiedByUserId(Long lastModifiedByUserId) {
		this.lastModifiedByUserId = lastModifiedByUserId;
	}

	public Date getLastModifiedOnDate() {
		return this.lastModifiedOnDate;
	}

	public void setLastModifiedOnDate(Date lastModifiedOnDate) {
		this.lastModifiedOnDate = lastModifiedOnDate;
	}
	
	public boolean isNew() {
        return (this.detailId == null);
    }
}
