package com.managementsystem.energy.domain;


/**
 * 能耗公式
 */
public class Calcformula implements java.io.Serializable {
	private static final long serialVersionUID = -8744801096946510179L;
	private String formulaId;
	private Energyitemdict energyitemdict;
	private Buildinfo buildinfo;
	private String formulaName;
	private String formulaExp;
	private Integer formulaState;

	public Calcformula() {
	}

	public Calcformula(String formulaId) {
		this.formulaId = formulaId;
	}

	public Calcformula(String formulaId, Energyitemdict energyitemdict,
			Buildinfo buildinfo, String formulaName, String formulaExp,
			Integer formulaState) {
		this.formulaId = formulaId;
		this.energyitemdict = energyitemdict;
		this.buildinfo = buildinfo;
		this.formulaName = formulaName;
		this.formulaExp = formulaExp;
		this.formulaState = formulaState;
	}

	public String getFormulaId() {
		return this.formulaId;
	}

	public void setFormulaId(String formulaId) {
		this.formulaId = formulaId;
	}

	public Energyitemdict getEnergyitemdict() {
		return this.energyitemdict;
	}

	public void setEnergyitemdict(Energyitemdict energyitemdict) {
		this.energyitemdict = energyitemdict;
	}

	public Buildinfo getBuildinfo() {
		return this.buildinfo;
	}

	public void setBuildinfo(Buildinfo buildinfo) {
		this.buildinfo = buildinfo;
	}

	public String getFormulaName() {
		return this.formulaName;
	}

	public void setFormulaName(String formulaName) {
		this.formulaName = formulaName;
	}

	public String getFormulaExp() {
		return this.formulaExp;
	}

	public void setFormulaExp(String formulaExp) {
		this.formulaExp = formulaExp;
	}

	public Integer getFormulaState() {
		return this.formulaState;
	}

	public void setFormulaState(Integer formulaState) {
		this.formulaState = formulaState;
	}

}
