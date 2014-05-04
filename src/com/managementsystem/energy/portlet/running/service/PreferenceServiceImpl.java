package com.managementsystem.energy.portlet.running.service;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;

import javax.portlet.PortletPreferences;
import javax.portlet.ReadOnlyException;
import javax.portlet.RenderRequest;
import javax.portlet.ValidatorException;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.managementsystem.energy.domain.Buildsettinginfo;
import com.managementsystem.energy.portlet.running.model.PreferenceModel;
import com.managementsystem.energy.service.BuildService;
import com.managementsystem.util.BeanUtil;

@Service
public class PreferenceServiceImpl implements PreferenceService {

	private final Log logger = LogFactory.getLog(PreferenceServiceImpl.class);

	@Autowired
	private BuildService buildService;

	@Transactional(readOnly = true)
	public PreferenceModel getPreferenceModel(PortletPreferences prefs) {
		if (prefs.getMap().size() == 0)
			return null;
		PreferenceModel preferenceModel = new PreferenceModel();
		return (PreferenceModel) BeanUtil.setProperty(prefs.getMap(),
				preferenceModel);
	}

	@SuppressWarnings("rawtypes")
	@Transactional
	public void savePreferenceModel(PreferenceModel preferenceModel,
			PortletPreferences prefs) throws IllegalAccessException,
			InvocationTargetException, NoSuchMethodException,
			ReadOnlyException, ValidatorException, IOException {
		Map mapField = BeanUtils.describe(preferenceModel);
		Object[] keyValuePairs = mapField.entrySet().toArray();
		for (int i = 0; i < keyValuePairs.length; i++) {
			Map.Entry entry = (Map.Entry) keyValuePairs[i];
			String key = entry.getKey().toString();
			String val = entry.getValue() == null ? "" : entry.getValue()
					.toString();
			prefs.setValue(key, val);
		}
		String buildId = preferenceModel.getBuildId();
		if (StringUtils.hasLength(buildId)) {
			Buildsettinginfo buildsettinginfo = buildService
					.getBuildsettinginfo(buildId);
			prefs.setValue("settingWsUrl", buildsettinginfo.getSettingWsurl());
		}
		prefs.store();
	}

	@Transactional(readOnly = true)
	public List<String> getSvgFilenames(RenderRequest request) {
		

		
		return null;
	}

}
