package com.managementsystem.energy.domain;


/**
 * 
 */
public class Counter implements java.io.Serializable {
	private static final long serialVersionUID = 5533729036637242276L;
	private String name;
	private Long currentid;

	public Counter() {
	}

	public Counter(String name) {
		this.name = name;
	}

	public Counter(String name, Long currentid) {
		this.name = name;
		this.currentid = currentid;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Long getCurrentid() {
		return this.currentid;
	}

	public void setCurrentid(Long currentid) {
		this.currentid = currentid;
	}

}
