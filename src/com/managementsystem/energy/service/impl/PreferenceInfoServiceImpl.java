package com.managementsystem.energy.service.impl;

import java.lang.reflect.InvocationTargetException;
import java.util.Map;
import javax.portlet.PortletPreferences;
import org.apache.commons.beanutils.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.managementsystem.energy.portlet.energystatistic.model.PreferenceInfo;
import com.managementsystem.energy.service.PreferenceInfoService;
import com.managementsystem.util.BeanUtil;

@Service
public class PreferenceInfoServiceImpl implements PreferenceInfoService {

	@Transactional(readOnly = true)
	public PreferenceInfo getPreferenceInfo(PortletPreferences prefs) {
		if (prefs.getMap().size() == 0)
			return null;
		PreferenceInfo preferenceinfo = new PreferenceInfo();
		return (PreferenceInfo) BeanUtil.setProperty(prefs.getMap(),
				preferenceinfo);
	}

	@Transactional(readOnly = true)
	public Object getPreferenceInfo(PortletPreferences prefs, Object object)
			throws InstantiationException, IllegalAccessException {
		if (prefs.getMap().size() == 0)
			return null;
		return (Object) BeanUtil.setProperty(prefs.getMap(), object);
	}

	@SuppressWarnings("rawtypes")
	@Transactional
	public void savePreferenceInfo(PortletPreferences prefs,
			PreferenceInfo preferenceinfo) throws IllegalAccessException,
			InvocationTargetException, NoSuchMethodException, Exception {
		Map mapField;
		mapField = BeanUtils.describe(preferenceinfo);
		Object[] keyValuePairs = mapField.entrySet().toArray();
		for (int i = 0; i < keyValuePairs.length; i++) {
			Map.Entry entry = (Map.Entry) keyValuePairs[i];
			String key = entry.getKey().toString();
			String val = entry.getValue() == null ? "" : entry.getValue()
					.toString();
			prefs.setValue(key, val);
		}
		prefs.store();
	}

	@SuppressWarnings("rawtypes")
	@Transactional
	public void savePreferenceInfo(PortletPreferences prefs, Object object)
			throws IllegalAccessException, InvocationTargetException,
			NoSuchMethodException, Exception {
		Map mapField;
		mapField = BeanUtils.describe(object);
		Object[] keyValuePairs = mapField.entrySet().toArray();
		for (int i = 0; i < keyValuePairs.length; i++) {
			Map.Entry entry = (Map.Entry) keyValuePairs[i];
			String key = entry.getKey().toString();
			String val = entry.getValue() == null ? "" : entry.getValue()
					.toString();
			prefs.setValue(key, val);
		}
		prefs.store();
	}
}