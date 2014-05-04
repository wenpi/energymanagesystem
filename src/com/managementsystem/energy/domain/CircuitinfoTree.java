package com.managementsystem.energy.domain;

import java.util.ArrayList;
import java.util.List;

import com.managementsystem.ui.easyui.BaseTree;
import com.managementsystem.ui.easyui.Tree;

public class CircuitinfoTree extends BaseTree {

	private static final long serialVersionUID = -5606895454250797400L;
	/**
	 * ID
	 * */
	private String id;
	/**
	 * Text
	 * */
	private String text;

	private String parentid;

	private List children;

	private String name;

	private String ispd;

	private String code;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getParentid() {
		if (parentid == null)
			parentid = "";
		return parentid;
	}

	public void setParentid(String parentid) {
		this.parentid = parentid;
	}

	public List getChildren() {
		if (children == null)
			children = new ArrayList<Tree>();
		return children;
	}

	public void setChildren(List children) {
		this.children = children;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIspd() {
		return ispd;
	}

	public void setIspd(String ispd) {
		this.ispd = ispd;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
}
