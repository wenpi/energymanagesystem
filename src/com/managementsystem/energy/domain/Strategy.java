package com.managementsystem.energy.domain;

// Generated 2012-7-31 13:05:34 by Hibernate Tools 3.4.0.CR1

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import org.codehaus.jackson.annotate.JsonBackReference;

public class Strategy implements java.io.Serializable {

	private static final long serialVersionUID = -7362962630130872911L;
	private String strategyid;
	private Buildinfo buildinfo;
	private Strategy strategy;
	private String strategyname;
	private String author;
	private String strategydesc;
	private String comment;
	private Date createdondate;
	private Integer status;
	private Date planstartdate;
	private Date planstopdate;
	@JsonBackReference
	private Set strategies = new HashSet(0);
	@JsonBackReference
	private Set strategydetails = new HashSet(0);

	private String _parentId;
	
	public Strategy() {
	}

	public Strategy(String strategyid) {
		this.strategyid = strategyid;
	}

	public Strategy(String strategyid, Buildinfo buildinfo, Strategy strategy,
			String strategyname, String author, String strategydesc,
			String comment, Date createdondate, Integer status, Set strategies,
			Set strategydetails) {
		this.strategyid = strategyid;
		this.buildinfo = buildinfo;
		this.strategy = strategy;
		this.strategyname = strategyname;
		this.author = author;
		this.strategydesc = strategydesc;
		this.comment = comment;
		this.createdondate = createdondate;
		this.status = status;
		this.strategies = strategies;
		this.strategydetails = strategydetails;
	}

	public String getStrategyid() {
		return this.strategyid;
	}

	public void setStrategyid(String strategyid) {
		this.strategyid = strategyid;
	}

	public Buildinfo getBuildinfo() {
		return this.buildinfo;
	}

	public void setBuildinfo(Buildinfo buildinfo) {
		this.buildinfo = buildinfo;
	}

	public Strategy getStrategy() {
		return this.strategy;
	}

	public void setStrategy(Strategy strategy) {
		this.strategy = strategy;
	}

	public String getStrategyname() {
		return this.strategyname;
	}

	public void setStrategyname(String strategyname) {
		this.strategyname = strategyname;
	}

	public String getAuthor() {
		return this.author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getStrategydesc() {
		return this.strategydesc;
	}

	public void setStrategydesc(String strategydesc) {
		this.strategydesc = strategydesc;
	}

	public String getComment() {
		return this.comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Date getCreatedondate() {
		return this.createdondate;
	}

	public void setCreatedondate(Date createdondate) {
		this.createdondate = createdondate;
	}

	public Date getPlanstartdate() {
		return planstartdate;
	}

	public void setPlanstartdate(Date planstartdate) {
		this.planstartdate = planstartdate;
	}

	public Date getPlanstopdate() {
		return planstopdate;
	}

	public void setPlanstopdate(Date planstopdate) {
		this.planstopdate = planstopdate;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Set getStrategies() {
		return this.strategies;
	}

	public void setStrategies(Set strategies) {
		this.strategies = strategies;
	}

	public Set getStrategydetails() {
		return this.strategydetails;
	}

	public void setStrategydetails(Set strategydetails) {
		this.strategydetails = strategydetails;
	}

	public String get_parentId() {	
		if(strategy==null)
			_parentId = "";
		else
			_parentId = strategy.getStrategyid();
		return _parentId;
	}
}
