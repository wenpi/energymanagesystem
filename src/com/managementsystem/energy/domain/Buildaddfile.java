package com.managementsystem.energy.domain;

// Generated 2012-6-14 13:19:36 by Hibernate Tools 3.4.0.CR1

import java.util.Date;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

/**
 * Buildaddfile generated by hbm2java
 */
public class Buildaddfile implements java.io.Serializable {

	private String addfileId;
	private Buildinfo buildinfo;
	private String addfileName;
	private Integer addfileFunctype;
	private String addfileSuffix;
	private String addfileDesc;
	private Long addfileSize;
	private Date addfileDate;
	private String addfilePath;
	private Boolean buildCover = false;

	public Buildaddfile() {
	}

	public Buildaddfile(String addfileId) {
		this.addfileId = addfileId;
	}

	public Buildaddfile(String addfileId, Buildinfo buildinfo,
			Integer addfileFunctype, String addfileSuffix, String addfileDesc,
			Long addfileSize, Date addfileDate, String addfilePath) {
		this.addfileId = addfileId;
		this.buildinfo = buildinfo;
		this.addfileFunctype = addfileFunctype;
		this.addfileSuffix = addfileSuffix;
		this.addfileDesc = addfileDesc;
		this.addfileSize = addfileSize;
		this.addfileDate = addfileDate;
		this.addfilePath = addfilePath;
	}

	public String getAddfileId() {
		return this.addfileId;
	}

	public void setAddfileId(String addfileId) {
		this.addfileId = addfileId;
	}

	public Buildinfo getBuildinfo() {
		return this.buildinfo;
	}

	public void setBuildinfo(Buildinfo buildinfo) {
		this.buildinfo = buildinfo;
	}

	public String getAddfileName() {
		return addfileName;
	}

	public void setAddfileName(String addfileName) {
		this.addfileName = addfileName;
	}

	public Integer getAddfileFunctype() {
		return this.addfileFunctype;
	}

	public void setAddfileFunctype(Integer addfileFunctype) {
		this.addfileFunctype = addfileFunctype;
	}

	public String getAddfileSuffix() {
		return this.addfileSuffix;
	}

	public void setAddfileSuffix(String addfileSuffix) {
		this.addfileSuffix = addfileSuffix;
	}

	public String getAddfileDesc() {
		return this.addfileDesc;
	}

	public void setAddfileDesc(String addfileDesc) {
		this.addfileDesc = addfileDesc;
	}

	public Long getAddfileSize() {
		return this.addfileSize;
	}

	public void setAddfileSize(Long addfileSize) {
		this.addfileSize = addfileSize;
	}

	public Date getAddfileDate() {
		return this.addfileDate;
	}

	public void setAddfileDate(Date addfileDate) {
		this.addfileDate = addfileDate;
	}

	public String getAddfilePath() {
		return this.addfilePath;
	}

	public void setAddfilePath(String addfilePath) {
		this.addfilePath = addfilePath;
	}

	public Boolean getBuildCover() {
		return buildCover;
	}

	public void setBuildCover(Boolean buildCover) {
		this.buildCover = buildCover;
	}

	private CommonsMultipartFile fileData;
	private String message;

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public CommonsMultipartFile getFileData() {
		return fileData;
	}

	public void setFileData(CommonsMultipartFile fileData) {
		this.fileData = fileData;
	}
}
