package com.managementsystem.energy.portlet.chart.config;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import com.managementsystem.energy.portlet.chart.api.ChartProperties;

public class ChartPropertiesImpl implements ChartProperties {

	private Map<String,String> configMap = new HashMap<String,String>(3);
	
	@Override
	public ChartProperties addProperty(String key, String value) {	
		if(!value.equals(getProperty(key))) {
			configMap.put(key, value);
		}
		return this;
	}

	@Override
	public ChartProperties removeProperty(String key) {
		String o = configMap.remove(key);
		return this;
	}

	@Override
	public String getProperty(String key) {
		return (String) configMap.get(key);
	}

	@Override
	public Map<String,String> getAllProperties() {
		return Collections.unmodifiableMap(configMap);
	}

	@Override
	public void clear() {
		if (!configMap.isEmpty()) {
			configMap.clear();
		}
	}

	@Override
	public void addAllProperties(Map<String,String> config) {
		if (!config.isEmpty()) {
			configMap.putAll(config);
		}
	}

}
