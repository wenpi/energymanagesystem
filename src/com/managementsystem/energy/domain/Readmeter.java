package com.managementsystem.energy.domain;


import java.util.Date;


public class Readmeter implements java.io.Serializable {

	private static final long serialVersionUID = -5651558413520419252L;
	private String readingid;
	private Energydict energydict;
	private Long organizationid;
	private Long groupid;
	private String buildId;
	private String meterId;
	private Double readingData;
	private String comment;
	private Integer status;
	private String readingPerson;
	private Date readingDate;
	private Long creatoruserid;
	private Date createdate;
	private Long modifier;
	private Date modifieddate;

	public Readmeter() {
	}

	public Readmeter(String readingid) {
		this.readingid = readingid;
	}

	public Readmeter(String readingid, Energydict energydict,
			Long organizationid, Long groupid, String buildId, String meterId,
			Double readingData, String comment, Integer status,
			String readingPerson, Date readingDate, Long creatoruserid,
			Date createdate, Long modifier, Date modifieddate) {
		this.readingid = readingid;
		this.energydict = energydict;
		this.organizationid = organizationid;
		this.groupid = groupid;
		this.buildId = buildId;
		this.meterId = meterId;
		this.readingData = readingData;
		this.comment = comment;
		this.status = status;
		this.readingPerson = readingPerson;
		this.readingDate = readingDate;
		this.creatoruserid = creatoruserid;
		this.createdate = createdate;
		this.modifier = modifier;
		this.modifieddate = modifieddate;
	}

	public String getReadingid() {
		return this.readingid;
	}

	public void setReadingid(String readingid) {
		this.readingid = readingid;
	}

	public Energydict getEnergydict() {
		return this.energydict;
	}

	public void setEnergydict(Energydict energydict) {
		this.energydict = energydict;
	}

	public Long getOrganizationid() {
		return this.organizationid;
	}

	public void setOrganizationid(Long organizationid) {
		this.organizationid = organizationid;
	}

	public Long getGroupid() {
		return this.groupid;
	}

	public void setGroupid(Long groupid) {
		this.groupid = groupid;
	}

	public String getBuildId() {
		return this.buildId;
	}

	public void setBuildId(String buildId) {
		this.buildId = buildId;
	}

	public String getMeterId() {
		return this.meterId;
	}

	public void setMeterId(String meterId) {
		this.meterId = meterId;
	}

	public Double getReadingData() {
		return this.readingData;
	}

	public void setReadingData(Double readingData) {
		this.readingData = readingData;
	}

	public String getComment() {
		return this.comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getReadingPerson() {
		return this.readingPerson;
	}

	public void setReadingPerson(String readingPerson) {
		this.readingPerson = readingPerson;
	}

	public Date getReadingDate() {
		return this.readingDate;
	}

	public void setReadingDate(Date readingDate) {
		this.readingDate = readingDate;
	}

	public Long getCreatoruserid() {
		return this.creatoruserid;
	}

	public void setCreatoruserid(Long creatoruserid) {
		this.creatoruserid = creatoruserid;
	}

	public Date getCreatedate() {
		return this.createdate;
	}

	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}

	public Long getModifier() {
		return this.modifier;
	}

	public void setModifier(Long modifier) {
		this.modifier = modifier;
	}

	public Date getModifieddate() {
		return this.modifieddate;
	}

	public void setModifieddate(Date modifieddate) {
		this.modifieddate = modifieddate;
	}

}
