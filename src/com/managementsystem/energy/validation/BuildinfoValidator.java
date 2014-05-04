package com.managementsystem.energy.validation;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;

import com.managementsystem.energy.domain.Buildinfo;

/**
 * 建筑基本信息验证类
 * */
public class BuildinfoValidator {

	/**
	 * 对象验证 ,使用如 {@link org.springframework.validation.ValidationUtils}或
	 * {@link org.springframework.util.StringUtils}类进行验证
	 * <p>for example:ValidationUtils.rejectIfEmptyOrWhitespace(errors, "code", "required","required");</p>
	 * 
	 * @param buildinfo 建筑信息
	 * @param errors 错误结果集
	 * 
	 * */
	public void validate(Buildinfo buildinfo, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "datacenterinfo.datacenterId", "required", "数据中心ID必填");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "buildName", "required", "建筑名称必填");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "buildDistrictid", "required", "建筑所属行政区必填");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "buildFunction", "required", "建筑功能类型必填");
	}
	
}
