package com.managementsystem.energy.domain;


import java.util.HashSet;
import java.util.Set;

import org.codehaus.jackson.annotate.JsonBackReference;


public class Bigdistrictinfo implements java.io.Serializable {

	private static final long serialVersionUID = -240277638937778202L;
	private String bigdistrictId;
	private Bigdistrictinfo bigdistrictinfo;
	private String bigdistrictName;
	private String primaryIndicator;
	private String secondaryIndicator;
	private String bigdistrictRemark;
	private Integer orderNo = 0;
	@JsonBackReference
	private Set bigdistrictrelainfos = new HashSet(0);
	@JsonBackReference
	private Set bigdistrictinfos = new HashSet(0);

	public Bigdistrictinfo() {
	}

	public Bigdistrictinfo(String bigdistrictId) {
		this.bigdistrictId = bigdistrictId;
	}

	public Bigdistrictinfo(String bigdistrictId, String bigdistrictName,
			String bigdistrictRemark, Set bigdistrictrelainfos) {
		this.bigdistrictId = bigdistrictId;
		this.bigdistrictName = bigdistrictName;
		this.bigdistrictRemark = bigdistrictRemark;
		this.bigdistrictrelainfos = bigdistrictrelainfos;
	}

	public String getBigdistrictId() {
		return this.bigdistrictId;
	}

	public void setBigdistrictId(String bigdistrictId) {
		this.bigdistrictId = bigdistrictId;
	}

	public Bigdistrictinfo getBigdistrictinfo() {
		return bigdistrictinfo;
	}

	public void setBigdistrictinfo(Bigdistrictinfo bigdistrictinfo) {
		this.bigdistrictinfo = bigdistrictinfo;
	}

	public String getBigdistrictName() {
		return this.bigdistrictName;
	}

	public void setBigdistrictName(String bigdistrictName) {
		this.bigdistrictName = bigdistrictName;
	}

	public String getPrimaryIndicator() {
		return primaryIndicator;
	}

	public void setPrimaryIndicator(String primaryIndicator) {
		this.primaryIndicator = primaryIndicator;
	}

	public String getSecondaryIndicator() {
		return secondaryIndicator;
	}

	public void setSecondaryIndicator(String secondaryIndicator) {
		this.secondaryIndicator = secondaryIndicator;
	}

	public String getBigdistrictRemark() {
		return this.bigdistrictRemark;
	}

	public void setBigdistrictRemark(String bigdistrictRemark) {
		this.bigdistrictRemark = bigdistrictRemark;
	}

	public Integer getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}

	public Set getBigdistrictrelainfos() {
		return this.bigdistrictrelainfos;
	}

	public void setBigdistrictrelainfos(Set bigdistrictrelainfos) {
		this.bigdistrictrelainfos = bigdistrictrelainfos;
	}

	public Set getBigdistrictinfos() {
		return bigdistrictinfos;
	}

	public void setBigdistrictinfos(Set bigdistrictinfos) {
		this.bigdistrictinfos = bigdistrictinfos;
	}

}
