package com.managementsystem.energy.domain;

import java.util.HashSet;
import java.util.Set;

import org.codehaus.jackson.annotate.JsonBackReference;

/**
 * 设备支路信息
 */
public class Circuitinfo implements java.io.Serializable {

	private static final long serialVersionUID = -1789226691936742126L;
	private String circuitId;
	private Circuitinfo circuitinfo;
	@JsonBackReference
	private Buildinfo buildinfo;
	private String circuitCode;
	private String circuitName;
	private Integer circuitState;
	private String circuitImage;
	private String circuitText;
	private String circuitIspd;
	private String source;

	@JsonBackReference
	private Set circuitinfos = new HashSet(0);
	@JsonBackReference
	private Set meteruseinfos = new HashSet(0);

	private String _parentId;

	public Circuitinfo() {
	}

	public Circuitinfo(String circuitId) {
		this.circuitId = circuitId;
	}

	public Circuitinfo(String circuitId, Circuitinfo circuitinfo,
			Buildinfo buildinfo, String circuitCode, String circuitName,
			Integer circuitState, String circuitImage, String circuitText,
			String circuitIspd, String source, Set circuitinfos,
			Set meteruseinfos) {
		this.circuitId = circuitId;
		this.circuitinfo = circuitinfo;
		this.buildinfo = buildinfo;
		this.circuitCode = circuitCode;
		this.circuitName = circuitName;
		this.circuitState = circuitState;
		this.circuitImage = circuitImage;
		this.circuitText = circuitText;
		this.source = source;
		this.circuitinfos = circuitinfos;
		this.meteruseinfos = meteruseinfos;
	}

	public String getCircuitId() {
		return this.circuitId;
	}

	public void setCircuitId(String circuitId) {
		this.circuitId = circuitId;
	}

	public Circuitinfo getCircuitinfo() {
		return this.circuitinfo;
	}

	public void setCircuitinfo(Circuitinfo circuitinfo) {
		this.circuitinfo = circuitinfo;
	}

	public Buildinfo getBuildinfo() {
		return this.buildinfo;
	}

	public void setBuildinfo(Buildinfo buildinfo) {
		this.buildinfo = buildinfo;
	}

	public String getCircuitCode() {
		return circuitCode;
	}

	public void setCircuitCode(String circuitCode) {
		this.circuitCode = circuitCode;
	}

	public String getCircuitName() {
		return this.circuitName;
	}

	public void setCircuitName(String circuitName) {
		this.circuitName = circuitName;
	}

	public Integer getCircuitState() {
		return this.circuitState;
	}

	public void setCircuitState(Integer circuitState) {
		this.circuitState = circuitState;
	}

	public String getCircuitImage() {
		return this.circuitImage;
	}

	public void setCircuitImage(String circuitImage) {
		this.circuitImage = circuitImage;
	}

	public Set getCircuitinfos() {
		return this.circuitinfos;
	}

	public void setCircuitinfos(Set circuitinfos) {
		this.circuitinfos = circuitinfos;
	}

	public Set getMeteruseinfos() {
		return this.meteruseinfos;
	}

	public void setMeteruseinfos(Set meteruseinfos) {
		this.meteruseinfos = meteruseinfos;
	}

	public String get_parentId() {
		if (circuitinfo == null)
			_parentId = "";
		else
			_parentId = circuitinfo.getCircuitId();
		return _parentId;
	}

	public String getCircuitText() {
		return circuitText;
	}

	public void setCircuitText(String circuitText) {
		this.circuitText = circuitText;
	}

	public String getCircuitIspd() {
		return circuitIspd;
	}

	public void setCircuitIspd(String circuitIspd) {
		this.circuitIspd = circuitIspd;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public void set_parentId(String _parentId) {
		this._parentId = _parentId;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

}
