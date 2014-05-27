package com.managementsystem.energy.domain;

import java.math.BigDecimal;

/**
 * 水表和气表的数据信息
 */
public class Reportinfo implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private String id;
	private String reportid;
	private String time;
	private BigDecimal zhi;
	private String source;

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public Reportinfo() {
	}

	public Reportinfo(String source, String reportid, String time, BigDecimal zhi) {
		this.source = source;
		this.reportid = reportid;
		this.time = time;
		this.zhi = zhi;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getReportid() {
		return reportid;
	}

	public void setReportid(String reportid) {
		this.reportid = reportid;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public BigDecimal getZhi() {
		return zhi;
	}

	public void setZhi(BigDecimal zhi) {
		this.zhi = zhi;
	}

}
