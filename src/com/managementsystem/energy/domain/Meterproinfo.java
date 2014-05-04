package com.managementsystem.energy.domain;


import java.util.HashSet;
import java.util.Set;

import org.codehaus.jackson.annotate.JsonBackReference;

/**
 * 仪表设备产品信息类
 */
public class Meterproinfo implements java.io.Serializable {

	private static final long serialVersionUID = -3958966553647398976L;
	private String meterProductid;
	private String meterProductname;
	private Integer meterType;
	private String meterProducter;
	private String meterModel;
	private String meterProductdesc;
	private String meterPhoto;
	
	@JsonBackReference
	private Set meterparaminfos = new HashSet(0);
	@JsonBackReference
	private Set meteruseinfos = new HashSet(0);

	public Meterproinfo() {
	}

	public Meterproinfo(String meterProductid) {
		this.meterProductid = meterProductid;
	}

	public Meterproinfo(String meterProductid, String meterProductname,
			Integer meterType, String meterProducter, String meterModel,
			String meterProductdesc, Set meterparaminfos, Set meteruseinfos) {
		this.meterProductid = meterProductid;
		this.meterProductname = meterProductname;
		this.meterType = meterType;
		this.meterProducter = meterProducter;
		this.meterModel = meterModel;
		this.meterProductdesc = meterProductdesc;
		this.meterparaminfos = meterparaminfos;
		this.meteruseinfos = meteruseinfos;
	}

	public String getMeterProductid() {
		return this.meterProductid;
	}

	public void setMeterProductid(String meterProductid) {
		this.meterProductid = meterProductid;
	}

	public String getMeterProductname() {
		return this.meterProductname;
	}

	public void setMeterProductname(String meterProductname) {
		this.meterProductname = meterProductname;
	}

	public Integer getMeterType() {
		return this.meterType;
	}

	public void setMeterType(Integer meterType) {
		this.meterType = meterType;
	}

	public String getMeterProducter() {
		return this.meterProducter;
	}

	public void setMeterProducter(String meterProducter) {
		this.meterProducter = meterProducter;
	}

	public String getMeterModel() {
		return this.meterModel;
	}

	public void setMeterModel(String meterModel) {
		this.meterModel = meterModel;
	}

	public String getMeterProductdesc() {
		return this.meterProductdesc;
	}

	public void setMeterProductdesc(String meterProductdesc) {
		this.meterProductdesc = meterProductdesc;
	}

	public Set getMeterparaminfos() {
		return this.meterparaminfos;
	}

	public void setMeterparaminfos(Set meterparaminfos) {
		this.meterparaminfos = meterparaminfos;
	}

	public Set getMeteruseinfos() {
		return this.meteruseinfos;
	}

	public void setMeteruseinfos(Set meteruseinfos) {
		this.meteruseinfos = meteruseinfos;
	}

	public String getMeterPhoto() {
		return meterPhoto;
	}

	public void setMeterPhoto(String meterPhoto) {
		this.meterPhoto = meterPhoto;
	}

}
