package com.managementsystem.energy.portlet.holographic.config;

import java.text.SimpleDateFormat;
import java.util.Date;

public class HoloConifg {
	public HoloConifg() {
		 
	}
	
	private String defaultDate;

	public String getDefaultDate() {
		if("today".equals(defaultDate)){
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			return sdf.format(new Date());
		}
		
		return defaultDate;
	}

	public void setDefaultDate(String defaultDate) {
		this.defaultDate = defaultDate;
	}
	
	
}
