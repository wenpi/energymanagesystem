package com.managementsystem.portlet.quicknavigation;

/**
 * 链接基本信息
 * 
 * @author chenflat
 * */
public class Navigation {
	public String name;
	public String url;
	public String icon;
	public String desc;

	public Navigation() {
		
	}
	public Navigation(String name,String url,String icon) {
		this.name = name;
		this.url = url;
		this.icon = icon;
	}
	
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}

}
