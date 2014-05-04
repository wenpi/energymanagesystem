package com.managementsystem.energy.domain;

/**
 * 仪表使用属性类
 */
public class MeteruseattributeId implements java.io.Serializable {

	private static final long serialVersionUID = -4960463607980739917L;
	private String meterattrName;
	private String meterId;

	public MeteruseattributeId() {
	}

	public MeteruseattributeId(String meterattrName, String meterId) {
		this.meterattrName = meterattrName;
		this.meterId = meterId;
	}

	public String getMeterattrName() {
		return this.meterattrName;
	}

	public void setMeterattrName(String meterattrName) {
		this.meterattrName = meterattrName;
	}

	public String getMeterId() {
		return this.meterId;
	}

	public void setMeterId(String meterId) {
		this.meterId = meterId;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof MeteruseattributeId))
			return false;
		MeteruseattributeId castOther = (MeteruseattributeId) other;

		return ((this.getMeterattrName() == castOther.getMeterattrName()) || (this
				.getMeterattrName() != null
				&& castOther.getMeterattrName() != null && this
				.getMeterattrName().equals(castOther.getMeterattrName())))
				&& ((this.getMeterId() == castOther.getMeterId()) || (this
						.getMeterId() != null && castOther.getMeterId() != null && this
						.getMeterId().equals(castOther.getMeterId())));
	}

	public int hashCode() {
		int result = 17;

		result = 37
				* result
				+ (getMeterattrName() == null ? 0 : this.getMeterattrName()
						.hashCode());
		result = 37 * result
				+ (getMeterId() == null ? 0 : this.getMeterId().hashCode());
		return result;
	}

}
