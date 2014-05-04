package com.managementsystem.energy.domain;


/**
 * 能耗分项结果类
 */
public class Energyitemresult implements java.io.Serializable {

	private static final long serialVersionUID = -5072393799577629361L;
	private String resultId;
	private Energyitemdict energyitemdict;
	private Meteruseinfo meteruseinfo;

	public Energyitemresult() {
	}

	public Energyitemresult(String resultId) {
		this.resultId = resultId;
	}

	public Energyitemresult(String resultId, Energyitemdict energyitemdict,
			Meteruseinfo meteruseinfo) {
		this.resultId = resultId;
		this.energyitemdict = energyitemdict;
		this.meteruseinfo = meteruseinfo;
	}

	public String getResultId() {
		return this.resultId;
	}

	public void setResultId(String resultId) {
		this.resultId = resultId;
	}

	public Energyitemdict getEnergyitemdict() {
		return this.energyitemdict;
	}

	public void setEnergyitemdict(Energyitemdict energyitemdict) {
		this.energyitemdict = energyitemdict;
	}

	public Meteruseinfo getMeteruseinfo() {
		return this.meteruseinfo;
	}

	public void setMeteruseinfo(Meteruseinfo meteruseinfo) {
		this.meteruseinfo = meteruseinfo;
	}

}
