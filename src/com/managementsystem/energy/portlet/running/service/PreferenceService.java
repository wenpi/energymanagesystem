package com.managementsystem.energy.portlet.running.service;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

import javax.portlet.PortletPreferences;
import javax.portlet.ReadOnlyException;
import javax.portlet.RenderRequest;
import javax.portlet.ValidatorException;

import com.managementsystem.energy.portlet.running.model.PreferenceModel;

public interface PreferenceService {
	
	/**
	 * 获取首选项模型
	 * 
	 * @param prefs Portlet首选项
	 * 
	 * @return 首选项模型
	 * */
	public PreferenceModel getPreferenceModel(PortletPreferences prefs);
	
	/**
	 * 保存首选项
	 * 
	 * @param preferenceModel 首选项数据
	 * @param prefs PORTLET首选项
	 * @throws ReadOnlyException 
	 * @throws IOException 
	 * @throws ValidatorException 
	 * */
	public void savePreferenceModel(PreferenceModel preferenceModel,PortletPreferences prefs) throws IllegalAccessException,InvocationTargetException,NoSuchMethodException, ReadOnlyException, ValidatorException, IOException;
	
	
	/**
	 * 获取所有SVG文件名称
	 * */
	public List<String> getSvgFilenames(RenderRequest request);
	
}
