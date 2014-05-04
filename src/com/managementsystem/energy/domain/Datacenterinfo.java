package com.managementsystem.energy.domain;


import java.util.HashSet;
import java.util.Set;

import org.codehaus.jackson.annotate.JsonBackReference;

/**
 * 数据中心类
 */
public class Datacenterinfo implements java.io.Serializable {

	private static final long serialVersionUID = -1107649573691517342L;
	private String datacenterId;
	private String datacenterName;
	private Integer datacenterType;
	private String datacenterManager;
	private String datacenterDesc;
	private String datacenterDistrictid;
	private String datacenterContact;
	private String datacenterTel;
	@JsonBackReference
	private Set buildinfos = new HashSet(0);
	@JsonBackReference
	private Set citytempinfos = new HashSet(0);

	public Datacenterinfo() {
	}

	public Datacenterinfo(String datacenterId) {
		this.datacenterId = datacenterId;
	}

	public Datacenterinfo(String datacenterId, String datacenterName,
			Integer datacenterType, String datacenterManager,
			String datacenterDesc,String datacenterDistrictid,
			String datacenterContact,String datacenterTel,
			Set buildinfos, Set citytempinfos) {
		this.datacenterId = datacenterId;
		this.datacenterName = datacenterName;
		this.datacenterType = datacenterType;
		this.datacenterManager = datacenterManager;
		this.datacenterDesc = datacenterDesc;
		this.datacenterDistrictid = datacenterDistrictid;
		this.datacenterContact = datacenterContact;
		this.datacenterTel = datacenterTel;
		this.buildinfos = buildinfos;
		this.citytempinfos = citytempinfos;
	}

	public String getDatacenterId() {
		return this.datacenterId;
	}

	public void setDatacenterId(String datacenterId) {
		this.datacenterId = datacenterId;
	}

	public String getDatacenterName() {
		return this.datacenterName;
	}

	public void setDatacenterName(String datacenterName) {
		this.datacenterName = datacenterName;
	}

	public Integer getDatacenterType() {
		return this.datacenterType;
	}

	public void setDatacenterType(Integer datacenterType) {
		this.datacenterType = datacenterType;
	}

	public String getDatacenterManager() {
		return this.datacenterManager;
	}

	public void setDatacenterManager(String datacenterManager) {
		this.datacenterManager = datacenterManager;
	}

	public String getDatacenterDesc() {
		return this.datacenterDesc;
	}

	public void setDatacenterDesc(String datacenterDesc) {
		this.datacenterDesc = datacenterDesc;
	}

	public String getDatacenterDistrictid() {
		return datacenterDistrictid;
	}

	public void setDatacenterDistrictid(String datacenterDistrictid) {
		this.datacenterDistrictid = datacenterDistrictid;
	}

	public String getDatacenterContact() {
		return this.datacenterContact;
	}

	public void setDatacenterContact(String datacenterContact) {
		this.datacenterContact = datacenterContact;
	}

	public String getDatacenterTel() {
		return this.datacenterTel;
	}

	public void setDatacenterTel(String datacenterTel) {
		this.datacenterTel = datacenterTel;
	}

	public Set getBuildinfos() {
		return this.buildinfos;
	}

	public void setBuildinfos(Set buildinfos) {
		this.buildinfos = buildinfos;
	}

	public Set getCitytempinfos() {
		return this.citytempinfos;
	}

	public void setCitytempinfos(Set citytempinfos) {
		this.citytempinfos = citytempinfos;
	}

}
