package com.managementsystem.energy.domain;

import java.math.BigDecimal;
import java.util.Date;

import org.codehaus.jackson.annotate.JsonBackReference;

/**
 * 气候区能耗标准
 */
public class EnergyRegionalStandardDetail implements java.io.Serializable {

	private static final long serialVersionUID = -9048098476574764009L;
	private String detailId;
	@JsonBackReference
	private EnergyStandard energyStandard;
	private String bigdistrictId;
	private String buildFunction;
	private BigDecimal avgValue;
	private BigDecimal highValue;
	private BigDecimal midValue;
	private BigDecimal lowValue;
	private String description;
	private Date createdOnDate;
	private Long createdByUserId;
	private String createdByUserName;
	private Long lastModifiedByUserId;
	private Date lastModifiedOnDate;

	public EnergyRegionalStandardDetail() {
	}

	public EnergyRegionalStandardDetail(String detailId) {
		this.detailId = detailId;
	}

	public EnergyRegionalStandardDetail(String detailId,
			EnergyStandard energyStandard, String bigdistrictId,
			String buildFunction, BigDecimal avgValue, BigDecimal highValue,
			BigDecimal midValue, BigDecimal lowValue, String description,
			Date createdOnDate, Long createdByUserId, String createdByUserName,
			Long lastModifiedByUserId, Date lastModifiedOnDate) {
		this.detailId = detailId;
		this.energyStandard = energyStandard;
		this.bigdistrictId = bigdistrictId;
		this.buildFunction = buildFunction;
		this.avgValue = avgValue;
		this.highValue = highValue;
		this.midValue = midValue;
		this.lowValue = lowValue;
		this.description = description;
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

	public String getBigdistrictId() {
		return this.bigdistrictId;
	}

	public void setBigdistrictId(String bigdistrictId) {
		this.bigdistrictId = bigdistrictId;
	}

	public String getBuildFunction() {
		return this.buildFunction;
	}

	public void setBuildFunction(String buildFunction) {
		this.buildFunction = buildFunction;
	}

	public BigDecimal getAvgValue() {
		return this.avgValue;
	}

	public void setAvgValue(BigDecimal avgValue) {
		this.avgValue = avgValue;
	}

	public BigDecimal getHighValue() {
		return this.highValue;
	}

	public void setHighValue(BigDecimal highValue) {
		this.highValue = highValue;
	}

	public BigDecimal getMidValue() {
		return this.midValue;
	}

	public void setMidValue(BigDecimal midValue) {
		this.midValue = midValue;
	}

	public BigDecimal getLowValue() {
		return this.lowValue;
	}

	public void setLowValue(BigDecimal lowValue) {
		this.lowValue = lowValue;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
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
