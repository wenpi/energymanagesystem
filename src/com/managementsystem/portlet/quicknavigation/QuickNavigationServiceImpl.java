package com.managementsystem.portlet.quicknavigation;

import javax.portlet.PortletPreferences;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.managementsystem.util.BeanUtil;

@Service
public class QuickNavigationServiceImpl implements QuickNavigationService {

	@Transactional(readOnly = true)
	public NavigationForm getNavigationForm(PortletPreferences prefs) {

		if (prefs.getMap().size() == 0)
			return null;
		NavigationForm navigationForm = new NavigationForm();
		return (NavigationForm) BeanUtil.setProperty(prefs.getMap(),
				navigationForm);
	}

}
