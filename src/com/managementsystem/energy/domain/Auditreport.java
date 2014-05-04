package com.managementsystem.energy.domain;

import java.math.BigDecimal;
import java.util.Date;

public class Auditreport implements java.io.Serializable {

	private static final long serialVersionUID = 2381153346866930185L;
	private String reportid;
	private BigDecimal version;
	private String buildId;
	private String title;
	private String description;
	private String mycontent;
	private Long groupid;
	private Long companyid;
	private Long userid;
	private String username;
	private Date createdondate;
	private Date modifiedondate;
	private String articleid;
	private Integer status;
	private Long statusbyuserid;
	private String statusbyusername;
	private Date statusdate;

	public Auditreport() {
	}

	public Auditreport(String reportid) {
		this.reportid = reportid;
	}

	public Auditreport(String reportid, String buildId, String title,
			String description, String mycontent, Long groupid, Long companyid,
			Long userid, String username, Date createdondate,
			Date modifiedondate, String articleid, Integer status,
			Long statusbyuserid, String statusbyusername, Date statusdate) {
		this.reportid = reportid;
		this.buildId = buildId;
		this.title = title;
		this.description = description;
		this.mycontent = mycontent;
		this.groupid = groupid;
		this.companyid = companyid;
		this.userid = userid;
		this.username = username;
		this.createdondate = createdondate;
		this.modifiedondate = modifiedondate;
		this.articleid = articleid;
		this.status = status;
		this.statusbyuserid = statusbyuserid;
		this.statusbyusername = statusbyusername;
		this.statusdate = statusdate;
	}

	public String getReportid() {
		return this.reportid;
	}

	public void setReportid(String reportid) {
		this.reportid = reportid;
	}

	

	public String getBuildId() {
		return this.buildId;
	}

	public BigDecimal getVersion() {
		return version;
	}

	public void setVersion(BigDecimal version) {
		this.version = version;
	}

	public void setBuildId(String buildId) {
		this.buildId = buildId;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getMycontent() {
		return mycontent;
	}

	public void setMycontent(String mycontent) {
		this.mycontent = mycontent;
	}

	public Long getGroupid() {
		return this.groupid;
	}

	public void setGroupid(Long groupid) {
		this.groupid = groupid;
	}

	public Long getCompanyid() {
		return this.companyid;
	}

	public void setCompanyid(Long companyid) {
		this.companyid = companyid;
	}

	public Long getUserid() {
		return this.userid;
	}

	public void setUserid(Long userid) {
		this.userid = userid;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Date getCreatedondate() {
		return this.createdondate;
	}

	public void setCreatedondate(Date createdondate) {
		this.createdondate = createdondate;
	}

	public Date getModifiedondate() {
		return this.modifiedondate;
	}

	public void setModifiedondate(Date modifiedondate) {
		this.modifiedondate = modifiedondate;
	}

	public String getArticleid() {
		return this.articleid;
	}

	public void setArticleid(String articleid) {
		this.articleid = articleid;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Long getStatusbyuserid() {
		return this.statusbyuserid;
	}

	public void setStatusbyuserid(Long statusbyuserid) {
		this.statusbyuserid = statusbyuserid;
	}

	public String getStatusbyusername() {
		return this.statusbyusername;
	}

	public void setStatusbyusername(String statusbyusername) {
		this.statusbyusername = statusbyusername;
	}

	public Date getStatusdate() {
		return this.statusdate;
	}

	public void setStatusdate(Date statusdate) {
		this.statusdate = statusdate;
	}

}
