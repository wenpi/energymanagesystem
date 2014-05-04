package com.managementsystem.energy.service;

import java.util.Map;

/**
 * 能源管理公共接口类
 * 
 * @author zouzhixiang create 2013-11-14
 * 
 */
public interface EnergyCommonService {
	/**
	 * 根据指定编码获取指定url的内容
	 *
	 * @param url
	 * @param api
	 * @param charset
	 * @return
	 */
	public Map<String, Object> getContentByUrl(String url, String api, String charset);
	
	/**
	 * 分页显示表格内容
	 * 
	 * @param curPage
	 * @param size
	 * @param resultMap
	 * @return
	 */
	public Map<String, Object> pagingShow(int curPage,int size,Map<String , Object> paramMap);

}
