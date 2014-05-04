package com.managementsystem.energy.domain;


import java.util.Date;

/**
 * 
 */
public class CitytempinfoId implements java.io.Serializable {

	private static final long serialVersionUID = 1458628780234859575L;
	private String datacenterId;
	private String citytempDistrictcode;
	private Date citytempStarttime;
	private Date citytempEndtime;

	public CitytempinfoId() {
	}

	public CitytempinfoId(String datacenterId, String citytempDistrictcode,
			Date citytempStarttime, Date citytempEndtime) {
		this.datacenterId = datacenterId;
		this.citytempDistrictcode = citytempDistrictcode;
		this.citytempStarttime = citytempStarttime;
		this.citytempEndtime = citytempEndtime;
	}

	public String getDatacenterId() {
		return this.datacenterId;
	}

	public void setDatacenterId(String datacenterId) {
		this.datacenterId = datacenterId;
	}

	public String getCitytempDistrictcode() {
		return this.citytempDistrictcode;
	}

	public void setCitytempDistrictcode(String citytempDistrictcode) {
		this.citytempDistrictcode = citytempDistrictcode;
	}

	public Date getCitytempStarttime() {
		return this.citytempStarttime;
	}

	public void setCitytempStarttime(Date citytempStarttime) {
		this.citytempStarttime = citytempStarttime;
	}

	public Date getCitytempEndtime() {
		return this.citytempEndtime;
	}

	public void setCitytempEndtime(Date citytempEndtime) {
		this.citytempEndtime = citytempEndtime;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof CitytempinfoId))
			return false;
		CitytempinfoId castOther = (CitytempinfoId) other;

		return ((this.getDatacenterId() == castOther.getDatacenterId()) || (this
				.getDatacenterId() != null
				&& castOther.getDatacenterId() != null && this
				.getDatacenterId().equals(castOther.getDatacenterId())))
				&& ((this.getCitytempDistrictcode() == castOther
						.getCitytempDistrictcode()) || (this
						.getCitytempDistrictcode() != null
						&& castOther.getCitytempDistrictcode() != null && this
						.getCitytempDistrictcode().equals(
								castOther.getCitytempDistrictcode())))
				&& ((this.getCitytempStarttime() == castOther
						.getCitytempStarttime()) || (this
						.getCitytempStarttime() != null
						&& castOther.getCitytempStarttime() != null && this
						.getCitytempStarttime().equals(
								castOther.getCitytempStarttime())))
				&& ((this.getCitytempEndtime() == castOther
						.getCitytempEndtime()) || (this.getCitytempEndtime() != null
						&& castOther.getCitytempEndtime() != null && this
						.getCitytempEndtime().equals(
								castOther.getCitytempEndtime())));
	}

	public int hashCode() {
		int result = 17;

		result = 37
				* result
				+ (getDatacenterId() == null ? 0 : this.getDatacenterId()
						.hashCode());
		result = 37
				* result
				+ (getCitytempDistrictcode() == null ? 0 : this
						.getCitytempDistrictcode().hashCode());
		result = 37
				* result
				+ (getCitytempStarttime() == null ? 0 : this
						.getCitytempStarttime().hashCode());
		result = 37
				* result
				+ (getCitytempEndtime() == null ? 0 : this.getCitytempEndtime()
						.hashCode());
		return result;
	}

}
