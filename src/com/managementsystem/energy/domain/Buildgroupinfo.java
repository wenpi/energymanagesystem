package com.managementsystem.energy.domain;


import java.util.HashSet;
import java.util.Set;

import org.codehaus.jackson.annotate.JsonBackReference;

/**
 * 建筑群类
 */
public class Buildgroupinfo implements java.io.Serializable {

	private static final long serialVersionUID = 1319599445599670008L;
	private String buildgroupId;
	private String buildgroupName;
	private String buildgroupAliasname;
	private String buildgroupDesc;
	private String buildDistrictid;
	@JsonBackReference
	private Set buildgrouprelainfos = new HashSet(0);

	public Buildgroupinfo() {
	}

	public Buildgroupinfo(String buildgroupId, String buildgroupName) {
		this.buildgroupId = buildgroupId;
		this.buildgroupName = buildgroupName;
	}

	public Buildgroupinfo(String buildgroupId, String buildgroupName,
			String buildgroupAliasname, String buildgroupDesc, Set buildgrouprelainfos) {
		this.buildgroupId = buildgroupId;
		this.buildgroupName = buildgroupName;
		this.buildgroupAliasname = buildgroupAliasname;
		this.buildgroupDesc = buildgroupDesc;
		this.buildgrouprelainfos = buildgrouprelainfos;
	}

	public String getBuildgroupId() {
		return this.buildgroupId;
	}

	public void setBuildgroupId(String buildgroupId) {
		this.buildgroupId = buildgroupId;
	}

	public String getBuildgroupName() {
		return this.buildgroupName;
	}

	public void setBuildgroupName(String buildgroupName) {
		this.buildgroupName = buildgroupName;
	}

	public String getBuildgroupAliasname() {
		return this.buildgroupAliasname;
	}

	public void setBuildgroupAliasname(String buildgroupAliasname) {
		this.buildgroupAliasname = buildgroupAliasname;
	}

	public String getBuildgroupDesc() {
		return this.buildgroupDesc;
	}

	public void setBuildgroupDesc(String buildgroupDesc) {
		this.buildgroupDesc = buildgroupDesc;
	}

	public Set getBuildgrouprelainfos() {
		return buildgrouprelainfos;
	}

	public void setBuildgrouprelainfos(Set buildgrouprelainfos) {
		this.buildgrouprelainfos = buildgrouprelainfos;
	}

	public String getBuildDistrictid() {
		if(this.buildDistrictid==null || "".equals(this.buildDistrictid)) {
			if(this.buildgroupId!=null && !"".equals(this.buildgroupId)) {
				this.buildDistrictid = this.buildgroupId.substring(0, 6);
			}
		}
		return buildDistrictid;
	}

	public void setBuildDistrictid(String buildDistrictid) {
		this.buildDistrictid = buildDistrictid;
	}
}
