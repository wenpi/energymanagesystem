package com.managementsystem.energy.domain;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

/**
 * 建筑区域类
 */
public class Importinfo {

	private CommonsMultipartFile fileData;

	public CommonsMultipartFile getFileData() {
		return fileData;
	}

	public void setFileData(CommonsMultipartFile fileData) {
		this.fileData = fileData;
	}

}
