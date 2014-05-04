package com.managementsystem.portlet.integration;

import java.util.List;

import org.codehaus.jackson.annotate.JsonBackReference;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

/**
 * 集成模块
 * */
public class IntegrationMode implements java.io.Serializable {

	private static final long serialVersionUID = 4385723783673051694L;

	public String buildId;

	public String subPath;

	@JsonBackReference
	private CommonsMultipartFile file;

	public List<Navigation> navigations;

	public String getBuildId() {
		return buildId;
	}

	public void setBuildId(String buildId) {
		this.buildId = buildId;
	}

	public String getSubPath() {
		return subPath;
	}

	public void setSubPath(String subPath) {
		this.subPath = subPath;
	}

	public CommonsMultipartFile getFile() {
		return file;
	}

	public void setFile(CommonsMultipartFile file) {
		this.file = file;
	}

	public List<Navigation> getNavigations() {
		return navigations;
	}

	public void setNavigations(List<Navigation> navigations) {
		this.navigations = navigations;
	}

	/**
	 * 集成目录类
	 * */
	public static class Navigation {

		public String name; // 名称
		public String filePath; // 文件路径

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getFilePath() {
			return filePath;
		}

		public void setFilePath(String filePath) {
			this.filePath = filePath;
		}

	}

}
