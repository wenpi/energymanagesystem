package com.managementsystem.energy.domain;

import java.util.Date;

/**
 * 查询方法
 * 
 * API查询地址: http://serv:port/?name=&id=&ispd=
 * */
public class QueryScheme implements java.io.Serializable {

	private static final long serialVersionUID = 3508644378667632205L;

	private String schemeId;
	private String num;
	private String name;
	private String id;
	private String categoryId;
	private String regionId;
	private String tagid;

	/**
	 * 0台账数据， 1，2为只需要span表的参数， 1为自身有TAGID,2为自身没TAGID; 3、4为需要做6项计算的参数，
	 * 4为计算结果但自身无TAGID
	 */
	private Long iscreate;
	/**
	 * 0是统计量，1，3是过程量,2是状态量只取span
	 */
	private Long ispd;
	/**
	 * 如当前参数需被统计，1当前参数需统计最大值，0当前参数不需要统计最大值
	 */
	private Long ismax;
	/**
	 * 如当前参数需被统计，1当前参数需统计最小值，0当前参数不需要统计最小值
	 */
	private Long ismin;
	/**
	 * 如当前参数需被统计，1当前参数需求和，0当前参数不需要求和
	 */
	private Long issum;
	/**
	 * 如当前参数需被统计，1当前参数需统计平均值，0当前参数不需要统计平均值
	 */
	private Long isavg;
	/**
	 * 如当前参数需被统计，1当前参数需统计占比，0当前参数不需要统计占比
	 */
	private Long ispercent;
	/**
	 * 如当前参数需被统计，1当前参数需统计变化量，0当前参数不需要统计变化量
	 */
	private Long ischange;
	/**
	 * 计算备注
	 */
	private String description;
	/**
	 * 建筑ID
	 */
	private String buildId;
	private String _parentId;
	private Date createdDate;
	private Long createdBy;
	private Date modifiedDate;
	private Long modifiedBy;
	private String comments;
	/**
	 * 1表示最优先算，4是最后算，同一个数是并行的关系
	 */
	private String calgrade;

	public String getSchemeId() {
		return schemeId;
	}

	public void setSchemeId(String schemeId) {
		this.schemeId = schemeId;
	}

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

	public String getRegionId() {
		return regionId;
	}

	public void setRegionId(String regionId) {
		this.regionId = regionId;
	}

	public String getTagid() {
		return tagid;
	}

	public void setTagid(String tagid) {
		this.tagid = tagid;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getBuildId() {
		return buildId;
	}

	public void setBuildId(String buildId) {
		this.buildId = buildId;
	}

	public String get_parentId() {
		return _parentId;
	}

	public void set_parentId(String _parentId) {
		this._parentId = _parentId;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Long getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(Long createdBy) {
		this.createdBy = createdBy;
	}

	public Date getModifiedDate() {
		return modifiedDate;
	}

	public void setModifiedDate(Date modifiedDate) {
		this.modifiedDate = modifiedDate;
	}

	public Long getModifiedBy() {
		return modifiedBy;
	}

	public void setModifiedBy(Long modifiedBy) {
		this.modifiedBy = modifiedBy;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Long getIscreate() {
		return iscreate;
	}

	public void setIscreate(Long iscreate) {
		this.iscreate = iscreate;
	}

	public Long getIspd() {
		return ispd;
	}

	public void setIspd(Long ispd) {
		this.ispd = ispd;
	}

	public Long getIsmax() {
		return ismax;
	}

	public void setIsmax(Long ismax) {
		this.ismax = ismax;
	}

	public Long getIsmin() {
		return ismin;
	}

	public void setIsmin(Long ismin) {
		this.ismin = ismin;
	}

	public Long getIssum() {
		return issum;
	}

	public void setIssum(Long issum) {
		this.issum = issum;
	}

	public Long getIsavg() {
		return isavg;
	}

	public void setIsavg(Long isavg) {
		this.isavg = isavg;
	}

	public Long getIspercent() {
		return ispercent;
	}

	public void setIspercent(Long ispercent) {
		this.ispercent = ispercent;
	}

	public Long getIschange() {
		return ischange;
	}

	public void setIschange(Long ischange) {
		this.ischange = ischange;
	}

	public String getCalgrade() {
		return calgrade;
	}

	public void setCalgrade(String calgrade) {
		this.calgrade = calgrade;
	}

	@Override
	public String toString() {
		return super.toString();
	}

}
