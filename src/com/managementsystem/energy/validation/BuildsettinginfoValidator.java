package com.managementsystem.energy.validation;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;

import com.managementsystem.energy.domain.Buildsettinginfo;

/**
 * 建筑设置验证类
 * */
public class BuildsettinginfoValidator {
	/**
	 * 对象验证 ,使用如 {@link org.springframework.validation.ValidationUtils}或
	 * {@link org.springframework.util.StringUtils}类进行验证
	 * <p>for example:ValidationUtils.rejectIfEmptyOrWhitespace(errors, "code", "required","required");</p>
	 * 
	 * @param buildsettinginfo 建筑设置信息
	 * @param errors 错误结果集
	 * 
	 * */
	public void validate(Buildsettinginfo buildsettinginfo, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "buildId", "required", "建筑ID不能为空");
	}
}
