package com.managementsystem.energy.domain;


import java.util.HashSet;
import java.util.Set;

import org.codehaus.jackson.annotate.JsonBackReference;

/**
 * 数据字典分组
 */
public class Dictgroup implements java.io.Serializable {

	private static final long serialVersionUID = 7668440661045022849L;
	private String groupCode;
	private String groupName;
	@JsonBackReference
	private Set dictitems = new HashSet(0);

	public Dictgroup() {
	}

	public Dictgroup(String groupCode) {
		this.groupCode = groupCode;
	}

	public Dictgroup(String groupCode, String groupName, Set dictitems) {
		this.groupCode = groupCode;
		this.groupName = groupName;
		this.dictitems = dictitems;
	}

	public String getGroupCode() {
		return this.groupCode;
	}

	public void setGroupCode(String groupCode) {
		this.groupCode = groupCode;
	}

	public String getGroupName() {
		return this.groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public Set getDictitems() {
		return this.dictitems;
	}

	public void setDictitems(Set dictitems) {
		this.dictitems = dictitems;
	}

}
