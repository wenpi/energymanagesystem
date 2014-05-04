package com.managementsystem.energy.service;

import java.lang.reflect.InvocationTargetException;
import javax.portlet.PortletPreferences;
import com.managementsystem.energy.portlet.energystatistic.model.PreferenceInfo;

/**
 * 保存、获取首选项 服务类
 * 
 * @author zouzhixiang modify 2013-11-21
 *
 */
public interface PreferenceInfoService {
	/**
	 * 获取 首选项信息
	 * 
	 * @param prefs
	 *            首选项对象
	 * 
	 * @return 首选项信息
	 */
	public PreferenceInfo getPreferenceInfo(PortletPreferences prefs);

	/**
	 * 根据实体类，获取对应类型的 首选项信息
	 * 
	 * @param prefs
	 *            portlet属性
	 * @param clazz
	 *            对应的实体类
	 * @return
	 */
	public Object getPreferenceInfo(PortletPreferences prefs, Object object) throws InstantiationException, IllegalAccessException;

	/**
	 * 保存 首选项信息
	 * 
	 * @param prefs
	 *            首选项对象
	 * @param preferenceinfo
	 *            首选项信息
	 * @throws NoSuchMethodException
	 * @throws InvocationTargetException
	 * @throws IllegalAccessException
	 * @throws Exception
	 * 
	 */
	public void savePreferenceInfo(PortletPreferences prefs,PreferenceInfo preferenceinfo) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException, Exception;

	/**
	 * 保存 首选项信息
	 * 
	 * @param prefs
	 *            portlet属性
	 * @param clazz
	 *            对应的实体类
	 * @throws IllegalAccessException
	 * @throws InvocationTargetException
	 * @throws NoSuchMethodException
	 * @throws Exception
	 */
	public void savePreferenceInfo(PortletPreferences prefs, Object object) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException, Exception;

}
