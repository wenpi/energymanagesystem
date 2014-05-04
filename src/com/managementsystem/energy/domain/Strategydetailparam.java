package com.managementsystem.energy.domain;

public class Strategydetailparam implements java.io.Serializable {
	private static final long serialVersionUID = 2992317299417464144L;
	private String paramid;
	private Strategydetail strategydetail;
	private Integer paramtypeid;
	private String paramname;
	private String paramvalue;
	private String paramminvalue;
	private String parammaxvalue;
	private String controlid;
	private Integer tagid;

	public Strategydetailparam() {
	}

	public Strategydetailparam(String paramid) {
		this.paramid = paramid;
	}

	public Strategydetailparam(String paramid, Strategydetail strategydetail,
			Integer paramtypeid, String paramname, String paramvalue,
			String paramminvalue, String parammaxvalue, String controlid,
			Integer tagid) {
		this.paramid = paramid;
		this.strategydetail = strategydetail;
		this.paramtypeid = paramtypeid;
		this.paramname = paramname;
		this.paramvalue = paramvalue;
		this.paramminvalue = paramminvalue;
		this.parammaxvalue = parammaxvalue;
		this.controlid = controlid;
		this.tagid = tagid;
	}

	public String getParamid() {
		return this.paramid;
	}

	public void setParamid(String paramid) {
		this.paramid = paramid;
	}

	public Strategydetail getStrategydetail() {
		return this.strategydetail;
	}

	public void setStrategydetail(Strategydetail strategydetail) {
		this.strategydetail = strategydetail;
	}

	public Integer getParamtypeid() {
		return this.paramtypeid;
	}

	public void setParamtypeid(Integer paramtypeid) {
		this.paramtypeid = paramtypeid;
	}

	public String getParamname() {
		return this.paramname;
	}

	public void setParamname(String paramname) {
		this.paramname = paramname;
	}

	public String getParamvalue() {
		return this.paramvalue;
	}

	public void setParamvalue(String paramvalue) {
		this.paramvalue = paramvalue;
	}

	public String getParamminvalue() {
		return this.paramminvalue;
	}

	public void setParamminvalue(String paramminvalue) {
		this.paramminvalue = paramminvalue;
	}

	public String getParammaxvalue() {
		return this.parammaxvalue;
	}

	public void setParammaxvalue(String parammaxvalue) {
		this.parammaxvalue = parammaxvalue;
	}

	public String getControlid() {
		return this.controlid;
	}

	public void setControlid(String controlid) {
		this.controlid = controlid;
	}

	public Integer getTagid() {
		return this.tagid;
	}

	public void setTagid(Integer tagid) {
		this.tagid = tagid;
	}

	@Override
	public String toString() {
		return "[" + this.paramid + "," + this.strategydetail.getDetailid()
				+ "," + this.paramtypeid + "," + this.paramname + ","
				+ this.paramvalue + "," + this.paramminvalue + ","
				+ this.parammaxvalue + "," + this.controlid + "," + this.tagid
				+ "]";
	}

}
