package com.managementsystem.energy.domain;

import org.codehaus.jackson.annotate.JsonBackReference;



public class Bigdistrictrelainfo implements java.io.Serializable {

	private static final long serialVersionUID = -951124468354301105L;
	private String relationId;
	private Districtinfo districtinfo;
	@JsonBackReference
	private Bigdistrictinfo bigdistrictinfo;

	public Bigdistrictrelainfo() {
	}

	public Bigdistrictrelainfo(String relationId) {
		this.relationId = relationId;
	}

	public Bigdistrictrelainfo(String relationId, Districtinfo districtinfo,
			Bigdistrictinfo bigdistrictinfo) {
		this.relationId = relationId;
		this.districtinfo = districtinfo;
		this.bigdistrictinfo = bigdistrictinfo;
	}

	public String getRelationId() {
		return this.relationId;
	}

	public void setRelationId(String relationId) {
		this.relationId = relationId;
	}

	public Districtinfo getDistrictinfo() {
		return this.districtinfo;
	}

	public void setDistrictinfo(Districtinfo districtinfo) {
		this.districtinfo = districtinfo;
	}

	public Bigdistrictinfo getBigdistrictinfo() {
		return this.bigdistrictinfo;
	}

	public void setBigdistrictinfo(Bigdistrictinfo bigdistrictinfo) {
		this.bigdistrictinfo = bigdistrictinfo;
	}

}
