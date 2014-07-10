package com.managementsystem.energy.domain;

/**
 * 设备支路信息
 */
public class Temp implements java.io.Serializable {

	private static final long serialVersionUID = -1789226691936742126L;
	private String id;
	private String time;

	public Temp() {
	}

	public Temp(String id, String time) {
		super();
		this.id = id;
		this.time = time;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}
}
