package com.managementsystem.energy.domain;


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import org.codehaus.jackson.annotate.JsonBackReference;


public class Articlecategory implements java.io.Serializable {

	private static final long serialVersionUID = -6990072596310097068L;
	private String catId;
	private Articlecategory articlecategory;
	private Integer modelId;
	private String catName;
	private String catType;
	private String catDesc;
	private Integer artCount;
	private Long companyid;
	private Long createdbyuserid;
	private Date createdondate;
	private Long lastmodifiedbyuserid;
	private Date lastmodifiedondate;
	@JsonBackReference
	private Set articlecategories = new HashSet(0);
	@JsonBackReference
	private Set articlesForCatBusiness = new HashSet(0);
	@JsonBackReference
	private Set articlesForCatField = new HashSet(0);
	@JsonBackReference
	private Set articlesForCatId = new HashSet(0);

	private String _parentId;
	
	public Articlecategory() {
	}

	public Articlecategory(String catId) {
		this.catId = catId;
	}

	public Articlecategory(String catId, Articlecategory articlecategory,
			Integer modelId, String catName, String catType, String catDesc,
			Integer artCount, Long companyid, Long createdbyuserid,
			Date createdondate, Long lastmodifiedbyuserid,
			Date lastmodifiedondate, Set articlecategories,
			Set articlesForCatBusiness, Set articlesForCatField,
			Set articlesForCatId) {
		this.catId = catId;
		this.articlecategory = articlecategory;
		this.modelId = modelId;
		this.catName = catName;
		this.catType = catType;
		this.catDesc = catDesc;
		this.artCount = artCount;
		this.companyid = companyid;
		this.createdbyuserid = createdbyuserid;
		this.createdondate = createdondate;
		this.lastmodifiedbyuserid = lastmodifiedbyuserid;
		this.lastmodifiedondate = lastmodifiedondate;
		this.articlecategories = articlecategories;
		this.articlesForCatBusiness = articlesForCatBusiness;
		this.articlesForCatField = articlesForCatField;
		this.articlesForCatId = articlesForCatId;
	}

	public String getCatId() {
		return this.catId;
	}

	public void setCatId(String catId) {
		this.catId = catId;
	}

	public Articlecategory getArticlecategory() {
		return this.articlecategory;
	}

	public void setArticlecategory(Articlecategory articlecategory) {
		this.articlecategory = articlecategory;
	}

	public Integer getModelId() {
		return this.modelId;
	}

	public void setModelId(Integer modelId) {
		this.modelId = modelId;
	}

	public String getCatName() {
		return this.catName;
	}

	public void setCatName(String catName) {
		this.catName = catName;
	}

	public String getCatType() {
		return this.catType;
	}

	public void setCatType(String catType) {
		this.catType = catType;
	}

	public String getCatDesc() {
		return this.catDesc;
	}

	public void setCatDesc(String catDesc) {
		this.catDesc = catDesc;
	}

	public Integer getArtCount() {
		return this.artCount;
	}

	public void setArtCount(Integer artCount) {
		this.artCount = artCount;
	}

	public Long getCompanyid() {
		return this.companyid;
	}

	public void setCompanyid(Long companyid) {
		this.companyid = companyid;
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

	public Set getArticlecategories() {
		return this.articlecategories;
	}

	public void setArticlecategories(Set articlecategories) {
		this.articlecategories = articlecategories;
	}

	public Set getArticlesForCatBusiness() {
		return this.articlesForCatBusiness;
	}

	public void setArticlesForCatBusiness(Set articlesForCatBusiness) {
		this.articlesForCatBusiness = articlesForCatBusiness;
	}

	public Set getArticlesForCatField() {
		return this.articlesForCatField;
	}

	public void setArticlesForCatField(Set articlesForCatField) {
		this.articlesForCatField = articlesForCatField;
	}

	public Set getArticlesForCatId() {
		return this.articlesForCatId;
	}

	public void setArticlesForCatId(Set articlesForCatId) {
		this.articlesForCatId = articlesForCatId;
	}

	public String get_parentId() {	
		if(articlecategory==null)
			_parentId = "";
		else
			_parentId = articlecategory.getCatId();
		return _parentId;
	}
}
