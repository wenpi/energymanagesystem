package com.managementsystem.energy.domain;

import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import org.codehaus.jackson.annotate.JsonBackReference;


public class Strategydetail implements java.io.Serializable {

	private static final long serialVersionUID = 1082471093088060739L;
	private String detailid;
	private Strategy strategy;
	private String devicename;
	@JsonBackReference
	private Set<Strategydetailparam> strategydetailparams = new HashSet<Strategydetailparam>(0);
	@JsonBackReference
	private List<Strategydetailparam> detailparams = new LinkedList<Strategydetailparam>();
	
	public Strategydetail() {
	}

	public Strategydetail(String detailid) {
		this.detailid = detailid;
	}

	public Strategydetail(String detailid, Strategy strategy,
			String devicename, Set<Strategydetailparam> strategydetailparams) {
		this.detailid = detailid;
		this.strategy = strategy;
		this.devicename = devicename;
		this.strategydetailparams = strategydetailparams;
	}

	public String getDetailid() {
		return this.detailid;
	}

	public void setDetailid(String detailid) {
		this.detailid = detailid;
	}

	public Strategy getStrategy() {
		return this.strategy;
	}

	public void setStrategy(Strategy strategy) {
		this.strategy = strategy;
	}

	public String getDevicename() {
		return this.devicename;
	}

	public void setDevicename(String devicename) {
		this.devicename = devicename;
	}

	public Set<Strategydetailparam> getStrategydetailparams() {
		return this.strategydetailparams;
	}

	public void setStrategydetailparams(Set<Strategydetailparam> strategydetailparams) {
		this.strategydetailparams = strategydetailparams;
	}

	public List<Strategydetailparam> getDetailparams() {
		if(this.strategydetailparams.size()>0) {
			return new LinkedList<Strategydetailparam>(this.strategydetailparams);
		}
		return detailparams;
	}

}
