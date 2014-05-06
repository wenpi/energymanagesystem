package com.managementsystem.energy.service;

import java.io.FileNotFoundException;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public interface ImportService {

	/**
	 * 读取Excel的内容，第一维数组存储的是一行中格列的值，二维数组存储的是多少个行
	 * 
	 * @param mf
	 * @param type
	 * @return
	 */
	public String importExcelToCircuitinfo(MultipartFile mf, String type);
}
