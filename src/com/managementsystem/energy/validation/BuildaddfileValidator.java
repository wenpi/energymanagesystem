package com.managementsystem.energy.validation;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;

import com.managementsystem.energy.domain.Buildaddfile;

/**
 * 建筑附加信息验证类
 * 
 * @author CHENPING 2012-6-15
 * */
public class BuildaddfileValidator {
	
	/**
	 * 对象验证 ,使用如 {@link org.springframework.validation.ValidationUtils}或
	 * {@link org.springframework.util.StringUtils}类进行验证
	 * <p>for example: ValidationUtils.rejectIfEmptyOrWhitespace(errors, "code", "required","required");</p>
	 * 
	 * @param buildaddfile 建筑附加信息
	 * @param errors 错误结果集
	 * 
	 * */
	public void validate(Buildaddfile buildaddfile, Errors errors) {
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "buildinfo", "buildaddfile.buildinfo","建筑ID不能为空");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "addfileFunctype", "buildaddfile.addfileFunctype","附件功能类型未选择");
	//	ValidationUtils.rejectIfEmptyOrWhitespace(errors, "addfilePath", "buildaddfile.addfilePath","附件路径不能为空");
	}
}
