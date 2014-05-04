package com.managementsystem.energy.portlet.running.model;

import java.util.ArrayList;
import java.util.List;

import com.managementsystem.energy.portlet.model.PreferenceBaseModel;

public class PreferenceModel extends PreferenceBaseModel<PreferenceModel> {

	private static final long serialVersionUID = -7176587398078457968L;

	/**
	 * SVG目录
	 * */
	private String svgFolder;
	/**
	 * 当前SVG
	 * */
	private String currentSvg;

	/**
	 * 框架宽度
	 * */
	private String width;
	
	/**
	 * 杠架高度
	 * */
	private String height;

	public String getSvgFolder() {
		return svgFolder;
	}

	public void setSvgFolder(String svgFolder) {
		this.svgFolder = svgFolder;
	}

	public String getCurrentSvg() {
		return currentSvg;
	}

	public void setCurrentSvg(String currentSvg) {
		this.currentSvg = currentSvg;
	}

	public String getWidth() {
		return width;
	}

	public void setWidth(String width) {
		this.width = width;
	}

	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
		this.height = height;
	}
	


	public List<String> getCurrentsvgs() {
		if(this.currentSvg!=null && !"".equals(this.currentSvg)) {
			int index = this.currentSvg.indexOf(",");
			List<String> list = new ArrayList<String>();
			if(index>0) {
				String[] arrCurrentsvg = currentSvg.split(",");
				for(int i = 0;i<arrCurrentsvg.length;i++) {
					if(arrCurrentsvg[i].length()>0)
						list.add(arrCurrentsvg[i].toString());
				}	
			}else {
				list.add(this.currentSvg); 
			}
			return list;
		}
		return null;
	}

}
