package com.managementsystem.energy.domain;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import org.codehaus.jackson.annotate.JsonBackReference;

/**
 * 能耗标准
 */
public class EnergyStandard implements java.io.Serializable {

	private static final long serialVersionUID = -6375826392175219075L;
	private String standardId;
	private String standardName;
	private String standardType;
	private String description;
	private Long companyId;
	private Long groupid;
	private Integer isdefault;
	private Date createdOnDate;
	private Long createdByUserId;
	private String createdByUserName;
	private Long lastModifiedByUserId;
	private Date lastModifiedOnDate;
	@JsonBackReference
	private Set energyItemStandardDetails = new HashSet(0);
	@JsonBackReference
	private Set energyRegionalStandardDetails = new HashSet(0);

	public EnergyStandard() {
	}

	public EnergyStandard(String standardId) {
		this.standardId = standardId;
	}

	public EnergyStandard(String standardId, String standardName,
			String standardType, String description, Long companyId,
			Long groupid, Integer isdefault, Date createdOnDate,
			Long createdByUserId, String createdByUserName,
			Long lastModifiedByUserId, Date lastModifiedOnDate,
			Set energyItemStandardDetails, Set energyRegionalStandardDetails) {
		this.standardId = standardId;
		this.standardName = standardName;
		this.standardType = standardType;
		this.description = description;
		this.companyId = companyId;
		this.groupid = groupid;
		this.isdefault = isdefault;
		this.createdOnDate = createdOnDate;
		this.createdByUserId = createdByUserId;
		this.createdByUserName = createdByUserName;
		this.lastModifiedByUserId = lastModifiedByUserId;
		this.lastModifiedOnDate = lastModifiedOnDate;
		this.energyItemStandardDetails = energyItemStandardDetails;
		this.energyRegionalStandardDetails = energyRegionalStandardDetails;
	}

	public String getStandardId() {
		return this.standardId;
	}

	public void setStandardId(String standardId) {
		this.standardId = standardId;
	}

	public String getStandardName() {
		return this.standardName;
	}

	public void setStandardName(String standardName) {
		this.standardName = standardName;
	}

	public String getStandardType() {
		return this.standardType;
	}

	public void setStandardType(String standardType) {
		this.standardType = standardType;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Long getCompanyId() {
		return this.companyId;
	}

	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}

	public Long getGroupid() {
		return this.groupid;
	}

	public void setGroupid(Long groupid) {
		this.groupid = groupid;
	}

	public Integer getIsdefault() {
		return this.isdefault;
	}

	public void setIsdefault(Integer isdefault) {
		this.isdefault = isdefault;
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

	public Set getEnergyItemStandardDetails() {
		return this.energyItemStandardDetails;
	}

	public void setEnergyItemStandardDetails(Set energyItemStandardDetails) {
		this.energyItemStandardDetails = energyItemStandardDetails;
	}

	public Set getEnergyRegionalStandardDetails() {
		return this.energyRegionalStandardDetails;
	}

	public void setEnergyRegionalStandardDetails(
			Set energyRegionalStandardDetails) {
		this.energyRegionalStandardDetails = energyRegionalStandardDetails;
	}
	
	public boolean isNew() {
        return (this.standardId == null);
    }

}
