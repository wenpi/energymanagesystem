package com.managementsystem.energy.domain;


import java.util.Date;

import org.codehaus.jackson.annotate.JsonBackReference;


public class Article implements java.io.Serializable {

	private static final long serialVersionUID = -6560931297838261284L;
	private String articleId;
	private Articlecategory articlecategoryByCatId;
	private Articlecategory articlecategoryByCatField;
	private Articlecategory articlecategoryByCatBusiness;
	private String title;
	private String source;
	private String author;
	private String description;
	private String content;
	private Long createdbyuserid;
	private Date createdondate;
	private Long lastmodifiedbyuserid;
	private Date lastmodifiedondate;
	private Long groupid;
	private Long companyid;
	private Integer status;
	private Long statusbyuserid;
	private String statusbyusername;
	private Date statusdate;

	public Article() {
	}

	public Article(String articleId) {
		this.articleId = articleId;
	}

	public Article(String articleId, Articlecategory articlecategoryByCatId,
			Articlecategory articlecategoryByCatField,
			Articlecategory articlecategoryByCatBusiness, String title,
			String source, String author, String description, String content,
			Long createdbyuserid, Date createdondate,
			Long lastmodifiedbyuserid, Date lastmodifiedondate, Long groupid,
			Long companyid, Integer status, Long statusbyuserid,
			String statusbyusername, Date statusdate) {
		this.articleId = articleId;
		this.articlecategoryByCatId = articlecategoryByCatId;
		this.articlecategoryByCatField = articlecategoryByCatField;
		this.articlecategoryByCatBusiness = articlecategoryByCatBusiness;
		this.title = title;
		this.source = source;
		this.author = author;
		this.description = description;
		this.content = content;
		this.createdbyuserid = createdbyuserid;
		this.createdondate = createdondate;
		this.lastmodifiedbyuserid = lastmodifiedbyuserid;
		this.lastmodifiedondate = lastmodifiedondate;
		this.groupid = groupid;
		this.companyid = companyid;
		this.status = status;
		this.statusbyuserid = statusbyuserid;
		this.statusbyusername = statusbyusername;
		this.statusdate = statusdate;
	}

	public String getArticleId() {
		return this.articleId;
	}

	public void setArticleId(String articleId) {
		this.articleId = articleId;
	}

	public Articlecategory getArticlecategoryByCatId() {
		return this.articlecategoryByCatId;
	}

	public void setArticlecategoryByCatId(Articlecategory articlecategoryByCatId) {
		this.articlecategoryByCatId = articlecategoryByCatId;
	}

	public Articlecategory getArticlecategoryByCatField() {
		return this.articlecategoryByCatField;
	}

	public void setArticlecategoryByCatField(
			Articlecategory articlecategoryByCatField) {
		this.articlecategoryByCatField = articlecategoryByCatField;
	}

	public Articlecategory getArticlecategoryByCatBusiness() {
		return this.articlecategoryByCatBusiness;
	}

	public void setArticlecategoryByCatBusiness(
			Articlecategory articlecategoryByCatBusiness) {
		this.articlecategoryByCatBusiness = articlecategoryByCatBusiness;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSource() {
		return this.source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getAuthor() {
		return this.author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Long getCreatedbyuserid() {
		return this.createdbyuserid;
	}

	public void setCreatedbyuserid(Long createdbyuserid) {
		this.createdbyuserid = createdbyuserid;
	}

	public Date getCreatedondate() {
		return this.createdondate;
	}

	public void setCreatedondate(Date createdondate) {
		this.createdondate = createdondate;
	}

	public Long getLastmodifiedbyuserid() {
		return this.lastmodifiedbyuserid;
	}

	public void setLastmodifiedbyuserid(Long lastmodifiedbyuserid) {
		this.lastmodifiedbyuserid = lastmodifiedbyuserid;
	}

	public Date getLastmodifiedondate() {
		return this.lastmodifiedondate;
	}

	public void setLastmodifiedondate(Date lastmodifiedondate) {
		this.lastmodifiedondate = lastmodifiedondate;
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
