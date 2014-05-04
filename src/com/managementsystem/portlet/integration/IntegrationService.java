package com.managementsystem.portlet.integration;

import java.util.List;
import java.util.Map;

import javax.portlet.PortletPreferences;


/**
 * 集成模块服务类
 * */
public interface IntegrationService {

	/**
	 * 获取指定路径的文件集合
	 * 
	 * @param pathname 路径名称
	 * 
	 * @param suffix 后缀名
	 * 
	 * @return 文件名称列表
	 * */
	public List<IntegrationFile> getFiles(String pathname,String suffix);
	
	/**
	 * 获取设置首选项
	 * 
	 * @param prefs 首选项
	 * 
	 * @return 设置首选项
	 * */
	public IntegrationMode getIntegrationMode(PortletPreferences prefs);
	
	/**
	 * 上传文件
	 * 
	 * @param integrationMode 集成模块
	 * */
	public String uploadFiles(IntegrationMode integrationMode,String realPath);
	
}
