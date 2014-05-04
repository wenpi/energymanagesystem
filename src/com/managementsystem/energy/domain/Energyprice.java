package com.managementsystem.energy.domain;

import java.util.Date;

/**
 * 能源价格信息设置
 * 
 * @author PING.CHEN
 * */
public class Energyprice implements java.io.Serializable {
	
	private static final long serialVersionUID = 6314466470010487552L;
	private String priceid;
	private Energydict energydict;
	private Long organizationid;
	private Long groupid;
	private Integer pricetype;
	private Integer pricetypevalue;
	private Double price;
	private String comment;
	private Integer status;
	private Integer begintime;
	private Integer endtime;
	private Long creatoruserid;
	private Date createdate;
	private Long modifier;
	private Date modifieddate;

	public Energyprice() {
	}

	public Energyprice(String priceid) {
		this.priceid = priceid;
	}

	public Energyprice(String priceid, Energydict energydict,
			Long organizationid, Long groupid, Integer pricetype,
			Integer pricetypevalue, Double price, String comment,
			Integer status, Long creatoruserid, Date createdate, Long modifier,
			Date modifieddate,Integer begintime, Integer endtime) {
		this.priceid = priceid;
		this.energydict = energydict;
		this.organizationid = organizationid;
		this.groupid = groupid;
		this.pricetype = pricetype;
		this.pricetypevalue = pricetypevalue;
		this.price = price;
		this.begintime = begintime;
		this.endtime = endtime;
		this.comment = comment;
		this.status = status;
		this.creatoruserid = creatoruserid;
		this.createdate = createdate;
		this.modifier = modifier;
		this.modifieddate = modifieddate;
	}

	public Integer getBegintime() {
		return begintime;
	}

	public void setBegintime(Integer begintime) {
		this.begintime = begintime;
	}

	public Integer getEndtime() {
		return endtime;
	}

	public void setEndtime(Integer endtime) {
		this.endtime = endtime;
	}

	public String getPriceid() {
		return this.priceid;
	}

	public void setPriceid(String priceid) {
		this.priceid = priceid;
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

	public Integer getPricetype() {
		return this.pricetype;
	}

	public void setPricetype(Integer pricetype) {
		this.pricetype = pricetype;
	}

	public Integer getPricetypevalue() {
		return this.pricetypevalue;
	}

	public void setPricetypevalue(Integer pricetypevalue) {
		this.pricetypevalue = pricetypevalue;
	}

	public Double getPrice() {
		return this.price;
	}

	public void setPrice(Double price) {
		this.price = price;
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
