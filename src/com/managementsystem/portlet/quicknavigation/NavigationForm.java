package com.managementsystem.portlet.quicknavigation;

import java.util.ArrayList;
import java.util.List;

import org.springframework.util.StringUtils;

public class NavigationForm {

	private List<Navigation> navigations;

	private String cssClass;
	private String activeCssClass;
	private String navigationString;

	public NavigationForm() {
		/*if (navigations == null || navigations.size() == 0) {
			navigations = new ArrayList<Navigation>();
			for (int i = 0; i < 20; i++) {
				Navigation nav = new Navigation("", "", "");
				navigations.add(nav);
			}
		}*/
	}

	public List<Navigation> getNavigations() {

		List<Navigation> navs = new ArrayList<Navigation>();

		if (StringUtils.hasLength(navigationString)) {
			String[] arrNavs = navigationString.split("||");
			for (int i = 0; i < arrNavs.length; i++) {
				String arrNav = arrNavs[i];
				if (arrNav.indexOf(",") > 0) {
					String[] arrFields = arrNav.split(",");
					for (int j = 0; j < arrFields.length; j++) {
						String field = arrFields[j];
						if ("".equals(field))
							continue;
						Navigation nav = new Navigation();
						String[] fields = field.split("=");
						if (fields.length == 2) {

							if ("name".equals(fields[0])) {
								nav.setName(fields[1]);
							} else if ("url".equals(fields[0])) {
								nav.setUrl(fields[1]);
							} else if ("icon".equals(fields[0])) {
								nav.setIcon(fields[1]);
							} else if ("desc".equals(fields[0])) {
								nav.setDesc(fields[1]);
							}
						}
						navs.add(nav);
					}
				}
			}
		} else {
			for (int i = 0; i < 20; i++) {
				Navigation nav = new Navigation("", "", "");
				navs.add(nav);
			}
		}
		navigations = navs;
		
		return navigations;
	}

	public void setNavigations(List<Navigation> navigations) {
		this.navigations = navigations;
	}

	public String getCssClass() {
		return cssClass;
	}

	public void setCssClass(String cssClass) {
		this.cssClass = cssClass;
	}

	public String getActiveCssClass() {
		return activeCssClass;
	}

	public void setActiveCssClass(String activeCssClass) {
		this.activeCssClass = activeCssClass;
	}

	public String getNavigationString() {
		StringBuilder sb = new StringBuilder();
		if (navigations != null) {
			for (int i = 0; i < navigations.size(); i++) {
				Navigation nav = navigations.get(i);
				// sb.append("name="+ nav.name + )
				String s = String.format("name=%s,url=%s,icon=%s,desc=%s",
						nav.name, nav.url, nav.icon, nav.desc);
				if (sb.length() > 0)
					sb.append("||");
				sb.append(s);
			}
			if (navigations.size() < 20) {
				for (int i = 0; i < 20 - navigations.size(); i++) {
					String s = "name=,url=,icon=,desc=";
					if (sb.length() > 0)
						sb.append("||");
					sb.append(s);
				}
			}
		}
		navigationString = sb.toString();
		return navigationString;
	}

	public void setNavigationString(String navigationString) {
		this.navigationString = navigationString;
	}

}
