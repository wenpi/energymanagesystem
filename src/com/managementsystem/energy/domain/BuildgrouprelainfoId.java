package com.managementsystem.energy.domain;


@SuppressWarnings("serial")
public class BuildgrouprelainfoId implements java.io.Serializable {

	private String buildId;
	private String buildgroupId;

	public BuildgrouprelainfoId() {
	}

	public BuildgrouprelainfoId(String buildId, String buildgroupId) {
		this.buildId = buildId;
		this.buildgroupId = buildgroupId;
	}

	public String getBuildId() {
		return this.buildId;
	}

	public void setBuildId(String buildId) {
		this.buildId = buildId;
	}

	public String getBuildgroupId() {
		return this.buildgroupId;
	}

	public void setBuildgroupId(String buildgroupId) {
		this.buildgroupId = buildgroupId;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof BuildgrouprelainfoId))
			return false;
		BuildgrouprelainfoId castOther = (BuildgrouprelainfoId) other;

		return ((this.getBuildId() == castOther.getBuildId()) || (this
				.getBuildId() != null && castOther.getBuildId() != null && this
				.getBuildId().equals(castOther.getBuildId())))
				&& ((this.getBuildgroupId() == castOther.getBuildgroupId()) || (this
						.getBuildgroupId() != null
						&& castOther.getBuildgroupId() != null && this
						.getBuildgroupId().equals(castOther.getBuildgroupId())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getBuildId() == null ? 0 : this.getBuildId().hashCode());
		result = 37
				* result
				+ (getBuildgroupId() == null ? 0 : this.getBuildgroupId()
						.hashCode());
		return result;
	}

}
