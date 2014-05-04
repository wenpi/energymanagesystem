package com.managementsystem.energy.domain;


import java.util.HashSet;
import java.util.Set;

import org.codehaus.jackson.annotate.JsonBackReference;

/**
 * 能耗 分项记量字典类
 */
public class Energyitemdict implements java.io.Serializable {

	private static final long serialVersionUID = 7479114483239367181L;
	private String energyItemcode;
	private Energyitemdict energyitemdict;
	private Energydict energydict;
	private String energyItemname;
	private Integer energyItemtype;
	private Integer energyItemstate;
	@JsonBackReference
	private Set calcformulas = new HashSet(0);
	@JsonBackReference
	private Set energyitemresults = new HashSet(0);
	@JsonBackReference
	private Set energyitemdicts = new HashSet(0);
	
	//TreeGrid Filed
	private String _parentId;

	public Energyitemdict() {
	}

	public Energyitemdict(String energyItemcode) {
		this.energyItemcode = energyItemcode;
	}

	public Energyitemdict(String energyItemcode, Energyitemdict energyitemdict,
			Energydict energydict, String energyItemname,
			Integer energyItemtype, Integer energyItemstate, Set calcformulas,
			Set energyitemresults, Set energyitemdicts) {
		this.energyItemcode = energyItemcode;
		this.energyitemdict = energyitemdict;
		this.energydict = energydict;
		this.energyItemname = energyItemname;
		this.energyItemtype = energyItemtype;
		this.energyItemstate = energyItemstate;
		this.calcformulas = calcformulas;
		this.energyitemresults = energyitemresults;
		this.energyitemdicts = energyitemdicts;
	}

	public String getEnergyItemcode() {
		return this.energyItemcode;
	}

	public void setEnergyItemcode(String energyItemcode) {
		this.energyItemcode = energyItemcode;
	}

	public Energyitemdict getEnergyitemdict() {
		return this.energyitemdict;
	}

	public void setEnergyitemdict(Energyitemdict energyitemdict) {
		this.energyitemdict = energyitemdict;
	}

	public Energydict getEnergydict() {
		return this.energydict;
	}

	public void setEnergydict(Energydict energydict) {
		this.energydict = energydict;
	}

	public String getEnergyItemname() {
		return this.energyItemname;
	}

	public void setEnergyItemname(String energyItemname) {
		this.energyItemname = energyItemname;
	}

	public Integer getEnergyItemtype() {
		return this.energyItemtype;
	}

	public void setEnergyItemtype(Integer energyItemtype) {
		this.energyItemtype = energyItemtype;
	}

	public Integer getEnergyItemstate() {
		return this.energyItemstate;
	}

	public void setEnergyItemstate(Integer energyItemstate) {
		this.energyItemstate = energyItemstate;
	}

	public Set getCalcformulas() {
		return this.calcformulas;
	}

	public void setCalcformulas(Set calcformulas) {
		this.calcformulas = calcformulas;
	}

	public Set getEnergyitemresults() {
		return this.energyitemresults;
	}

	public void setEnergyitemresults(Set energyitemresults) {
		this.energyitemresults = energyitemresults;
	}

	public Set getEnergyitemdicts() {
		return this.energyitemdicts;
	}

	public void setEnergyitemdicts(Set energyitemdicts) {
		this.energyitemdicts = energyitemdicts;
	}

	public String get_parentId() {	
		if(energyitemdict==null)
			_parentId = "";
		else
			_parentId = energyitemdict.getEnergyItemcode();
		return _parentId;
	}
}
