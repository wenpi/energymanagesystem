package com.managementsystem.energy.portlet.holographic.service;

import java.util.Map;

import com.managementsystem.energy.portlet.holographic.vo.MirrowData;

public interface MirrowGraphicService {
	
	public MirrowData fillHoloDetailData(MirrowData md) throws Exception;

	/**
	  查询区域数据
	 @author allchin
	 modified@2013年8月19日 下午1:13:25
	 * @param string build id  ,null就是所有区域
	 * @return
	 */
	public Map getHoloViewData(String string);

	/**
	 * 全息图全景图表数据
	 * @return
	 */
	public Map<String, Object> getHoloOverViewData();
	
	 
}
