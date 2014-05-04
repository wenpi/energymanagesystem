package com.managementsystem.energy.domain;


import java.util.HashSet;
import java.util.Set;

import org.codehaus.jackson.annotate.JsonBackReference;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

/**
 * 建筑区域类
 */
public class Buildregioninfo extends com.managementsystem.util.io.FileUploadBase implements java.io.Serializable {

	private static final long serialVersionUID = -2829559816952456135L;
	
	private String regionId;
	//上级区域对象
	private Buildregioninfo buildregioninfo;
	//所属建对象
	private Buildinfo buildinfo;
	//位置名称
	private String regionName;
	//位置类型  ，共四种类型，分别为 build\floor\room\area
	private String regionType;
	//区域说明
	private String regionRemark;
	//区域图片
	private String regionImage;
	
	//新增图片位置功能 (2013-03-28),使区域显示到上级区域的位置
	private Double left;
	private Double top;
	private Integer width;
	private Integer height;
	private Integer offset;
	private String url;
	private String title;
	
	@JsonBackReference
	private Set meteruseinfos = new HashSet(0);
	@JsonBackReference
	private Set buildregioninfos = new HashSet(0);
	private String _parentId;

	public Buildregioninfo() {
	}

	public Buildregioninfo(String regionId) {
		this.regionId = regionId;
	}

	public Buildregioninfo(String regionId, Buildregioninfo buildregioninfo,
			Buildinfo buildinfo, String regionName, String regionRemark,
			String regionImage, Set meteruseinfos, Set buildregioninfos) {
		this.regionId = regionId;
		this.buildregioninfo = buildregioninfo;
		this.buildinfo = buildinfo;
		this.regionName = regionName;
		this.regionRemark = regionRemark;
		this.regionImage = regionImage;
		this.meteruseinfos = meteruseinfos;
		this.buildregioninfos = buildregioninfos;
	}

	public String getRegionId() {
		return this.regionId;
	}

	public void setRegionId(String regionId) {
		this.regionId = regionId;
	}

	public Buildregioninfo getBuildregioninfo() {
		return this.buildregioninfo;
	}

	public void setBuildregioninfo(Buildregioninfo buildregioninfo) {
		this.buildregioninfo = buildregioninfo;
	}

	public Buildinfo getBuildinfo() {
		return this.buildinfo;
	}

	public void setBuildinfo(Buildinfo buildinfo) {
		this.buildinfo = buildinfo;
	}

	public String getRegionName() {
		return this.regionName;
	}

	public void setRegionName(String regionName) {
		this.regionName = regionName;
	}

	public String getRegionType() {
		return regionType;
	}

	public void setRegionType(String regionType) {
		this.regionType = regionType;
	}

	public String getRegionRemark() {
		return this.regionRemark;
	}

	public void setRegionRemark(String regionRemark) {
		this.regionRemark = regionRemark;
	}

	public String getRegionImage() {
		return this.regionImage;
	}

	public void setRegionImage(String regionImage) {
		this.regionImage = regionImage;
	}

	public Set getMeteruseinfos() {
		return this.meteruseinfos;
	}

	public void setMeteruseinfos(Set meteruseinfos) {
		this.meteruseinfos = meteruseinfos;
	}

	public Set getBuildregioninfos() {
		return this.buildregioninfos;
	}

	public void setBuildregioninfos(Set buildregioninfos) {
		this.buildregioninfos = buildregioninfos;
	}

	public String get_parentId() {	
		if(buildregioninfo==null)
			_parentId = "";
		else
			_parentId = buildregioninfo.getRegionId();
		return _parentId;
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

	public Double getLeft() {
		return left;
	}

	public void setLeft(Double left) {
		this.left = left;
	}

	public Double getTop() {
		return top;
	}

	public void setTop(Double top) {
		this.top = top;
	}

	public Integer getWidth() {
		return width;
	}

	public void setWidth(Integer width) {
		this.width = width;
	}

	public Integer getHeight() {
		return height;
	}

	public void setHeight(Integer height) {
		this.height = height;
	}

	public Integer getOffset() {
		return offset;
	}

	public void setOffset(Integer offset) {
		this.offset = offset;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	
}
