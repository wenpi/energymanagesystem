package com.managementsystem.energy.portlet.highcharts.constants;

import com.managementsystem.energy.portlet.holographic.vo.ServiceReqParam;


public class CategoriesConstants {
	public static final int TYPE_MONTH=0;
	
	private static String[][] CATE={
			{"1/1","1/2","1/3","1/4",
            "1/5","1/6","1/7","1/8", 
            "1/9","1/10","1/11","1/12", 
            "1/13","1/14","1/15","1/16", 
            "1/17","1/18","1/19","1/20", 
            "1/21","1/22","1/23","1/24", 
            "1/25","1/26","1/27","1/28", 
            "1/29","1/30","1/31" }
			
	};
	public static String[] getMonthCategories(){
		return CATE[0];
	}
	public static String[] getCategories(int type ){
		return CATE[type]; 
	}
	/**
	 根据日期类型生成catagories
	 @author allchin
	 modified@2013年8月12日 下午3:14:15
	 * @param type
	 * @return
	 */
	public static String[] getCategories(String type){
		if("month".equals(type)){
			return  CategoriesConstants.getMonthCategories();
		}
		return null;
	} 
	
	 
}
