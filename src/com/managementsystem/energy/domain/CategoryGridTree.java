package com.managementsystem.energy.domain;

import java.util.*;

import com.managementsystem.energy.domain.Articlecategory;
import com.managementsystem.energy.domain.State;

public class CategoryGridTree extends Articlecategory {
	
	private String iconCls;
	private State state;  //closed,open
	@SuppressWarnings("rawtypes")
	private List children;
	private boolean checked;
	public String getIconCls() {
		return iconCls;
	}
	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}
	public State getState() {
		return state;
	}
	public void setState(State state) {
		this.state = state;
	}
	public List getChildren() {
		return children;
	}
	public void setChildren(List children) {
		this.children = children;
	}
	public boolean isChecked() {
		return checked;
	}
	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	
}
