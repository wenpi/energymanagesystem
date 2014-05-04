package com.managementsystem.energy.domain;


import java.util.Date;


public class Buildgrouprelainfo implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private BuildgrouprelainfoId id;
	private Buildinfo buildinfo;
	private Buildgroupinfo buildgroupinfo;
	private Date createdondate;

	public Buildgrouprelainfo() {
	}

	public Buildgrouprelainfo(BuildgrouprelainfoId id, Buildinfo buildinfo,
			Buildgroupinfo buildgroupinfo) {
		this.id = id;
		this.buildinfo = buildinfo;
		this.buildgroupinfo = buildgroupinfo;
	}

	public Buildgrouprelainfo(BuildgrouprelainfoId id, Buildinfo buildinfo,
			Buildgroupinfo buildgroupinfo, Date createdondate) {
		this.id = id;
		this.buildinfo = buildinfo;
		this.buildgroupinfo = buildgroupinfo;
		this.createdondate = createdondate;
	}

	public BuildgrouprelainfoId getId() {
		return this.id;
	}

	public void setId(BuildgrouprelainfoId id) {
		this.id = id;
	}

	public Buildinfo getBuildinfo() {
		return this.buildinfo;
	}

	public void setBuildinfo(Buildinfo buildinfo) {
		this.buildinfo = buildinfo;
	}

	public Buildgroupinfo getBuildgroupinfo() {
		return this.buildgroupinfo;
	}

	public void setBuildgroupinfo(Buildgroupinfo buildgroupinfo) {
		this.buildgroupinfo = buildgroupinfo;
	}

	public Date getCreatedondate() {
		return this.createdondate;
	}

	public void setCreatedondate(Date createdondate) {
		this.createdondate = createdondate;
	}

}
