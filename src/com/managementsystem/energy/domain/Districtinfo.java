package com.managementsystem.energy.domain;


import java.util.HashSet;
import java.util.Set;

import org.codehaus.jackson.annotate.JsonBackReference;

/**
 * 行政区划信息类
 */
public class Districtinfo implements java.io.Serializable {

	private static final long serialVersionUID = 3827299777025465866L;
	private String districtId;
	private Districtinfo districtinfo;
	private String districtName;
	private String districtPinyin;
	private String districtPostcode;
	private String districtAreacode;
	private String woeid;
	private String districtRemark;
	
	@JsonBackReference
	private Set districtinfos = new HashSet(0);

	public Districtinfo() {
	}

	public Districtinfo(String districtId) {
		this.districtId = districtId;
	}

	public Districtinfo(String districtId, Districtinfo districtinfo,
			String districtName,String districtPinyin, String districtPostcode,
			String districtAreacode,String woeid, String districtRemark, Set districtinfos) {
		this.districtId = districtId;
		this.districtinfo = districtinfo;
		this.districtName = districtName;
		this.districtPinyin = districtPinyin;
		this.districtPostcode = districtPostcode;
		this.districtAreacode = districtAreacode;
		this.woeid = woeid;
		this.districtRemark = districtRemark;
		this.districtinfos = districtinfos;
	}

	public String getDistrictId() {
		return this.districtId;
	}

	public void setDistrictId(String districtId) {
		this.districtId = districtId;
	}

	public Districtinfo getDistrictinfo() {
		return this.districtinfo;
	}

	public void setDistrictinfo(Districtinfo districtinfo) {
		this.districtinfo = districtinfo;
	}

	public String getDistrictName() {
		return this.districtName;
	}

	public void setDistrictName(String districtName) {
		this.districtName = districtName;
	}

	public String getDistrictPinyin() {
		return districtPinyin;
	}

	public void setDistrictPinyin(String districtPinyin) {
		this.districtPinyin = districtPinyin;
	}

	public String getDistrictPostcode() {
		return this.districtPostcode;
	}

	public void setDistrictPostcode(String districtPostcode) {
		this.districtPostcode = districtPostcode;
	}

	public String getDistrictAreacode() {
		return this.districtAreacode;
	}

	public void setDistrictAreacode(String districtAreacode) {
		this.districtAreacode = districtAreacode;
	}

	public String getWoeid() {
		return woeid;
	}

	public void setWoeid(String woeid) {
		this.woeid = woeid;
	}

	public String getDistrictRemark() {
		return this.districtRemark;
	}

	public void setDistrictRemark(String districtRemark) {
		this.districtRemark = districtRemark;
	}

	public Set getDistrictinfos() {
		return this.districtinfos;
	}

	public void setDistrictinfos(Set districtinfos) {
		this.districtinfos = districtinfos;
	}

}
